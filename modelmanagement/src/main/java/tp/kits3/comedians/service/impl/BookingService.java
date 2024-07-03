package tp.kits3.comedians.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IBookingDao;
import tp.kits3.comedians.dao.ICartDAO;
import tp.kits3.comedians.dao.IModelCustomDAO;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.model.BookingModel;
import tp.kits3.comedians.model.CartModel;
import tp.kits3.comedians.service.IBookingService;
import tp.kits3.comedians.utils.SessionUtil;

@Service
public class BookingService implements IBookingService {
	
	@Autowired
	private IBookingDao bookingDao;
	
	@Autowired 
	private ICartDAO cartDAO;
	
	@Autowired
	private IModelCustomDAO modelCustomDAO;

	@Override
	public List<BookingModel> findByModelId(HttpServletRequest request, int modelid) {
		
		AccountUserRoleDTO accountUserRole = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		
		BookingModel booking = new BookingModel();
		if (accountUserRole != null) {
			booking.setAccountid(accountUserRole.getId());
		} else {
			booking.setAccountid(0);
		}

		booking.setModelid(modelid);
		
		List<BookingModel> list = bookingDao.findByModelId(modelid);
		list.add(booking);

		return list;
	}

	@Override
	public void insert(List<BookingModel> booking, String username) {
		for (BookingModel b : booking) {
			if(bookingDao.findByModelAndAccountAndDate(b.getModelid(), b.getAccountid(), b.getStartdate(), b.getStartmonth(), b.getStartyear()) == null) {				
				bookingDao.insert(b);
			}
		}
		int modelid = booking.get(0).getModelid();
		int accountid = booking.get(0).getAccountid();
		CartModel cartModel = cartDAO.findOneByModelIdAndAccountId(modelid,accountid );
		if(cartModel == null) {
			cartModel = new CartModel();
			ModelDTO model = modelCustomDAO.findOneById(modelid);
			cartModel.setAccountid(booking.get(0).getAccountid());
			cartModel.setModelid(booking.get(0).getModelid());
			
			cartModel.setCreatedby(username);
			cartModel.setModifiedby(username);
			cartModel.setDay(bookingDao.findByModelAndAccount(cartModel.getModelid(), cartModel.getAccountid()).size());
			cartModel.setPrice(model.getPrice() * cartModel.getDay());
			cartDAO.insert(cartModel);
		}else {
			ModelDTO model = modelCustomDAO.findOneById(cartModel.getModelid());
			int countDay = bookingDao.findByModelAndAccount(modelid, accountid).size();
			cartModel.setDay(countDay);
			cartModel.setPrice(model.getPrice() * countDay);
			cartDAO.update(cartModel);
		}
		
		
	}

	@Override
	public void delete(int modelid, int accountid) {
		bookingDao.delete(modelid, accountid);
	}

}
