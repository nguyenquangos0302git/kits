/**
 * @author giang
 */

package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IBookingDao;
import tp.kits3.comedians.dao.ICartCustomDAO;
import tp.kits3.comedians.dao.ICartDAO;
import tp.kits3.comedians.dao.IModelCustomDAO;
import tp.kits3.comedians.dto.CartDTO;
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.model.CartModel;
import tp.kits3.comedians.service.ICartService;

@Service
public class CartService implements ICartService {

	@Autowired
	private ICartDAO cartDAO;

	@Autowired
	private ICartCustomDAO cartCustomDAO;

	@Autowired
	private IBookingDao bookingDAO;

	@Autowired
	private IModelCustomDAO modelCustomDAO;

	@Override
	public List<CartModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartModel findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(CartModel cartModel, String username, int accountid) {
		cartModel.setCreatedby(username);
		cartModel.setModifiedby(username);
		if (cartDAO.findOneByModelIdAndAccountId(cartModel.getModelid(), accountid) != null) {
			return false;
		} else {
			cartDAO.insert(cartModel);
			return true;
		}
	}

	@Override
	public void update(CartModel cartModel, String username) {
		cartModel.setModifiedby(username);
		cartDAO.update(cartModel);
	}

	@Override
	public void delete(int modelid, int accounid) {
		cartDAO.delete(modelid, accounid);
	}

	@Override
	public int countCartByAccountId(int userId) {
		return cartDAO.countCartByAccountId(userId);
	}

	@Override
	public List<CartDTO> findAllByAccountId(int accountid) {
		List<CartDTO> listCartDTO = cartCustomDAO.findAllByAccountId(accountid);
		for (int i = 0; i < listCartDTO.size(); ++i) {
			CartDTO cartDTO = listCartDTO.get(i);
			ModelDTO model = modelCustomDAO.findOneById(cartDTO.getModelid());
			listCartDTO.get(i).setDay(bookingDAO.findByModelAndAccount(cartDTO.getModelid(), accountid).size());
			listCartDTO.get(i).setPrice(model.getPrice() * listCartDTO.get(i).getDay());
		}
		return listCartDTO;
	}

}
