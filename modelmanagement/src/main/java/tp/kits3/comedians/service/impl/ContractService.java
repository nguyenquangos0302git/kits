/**
 * @author dung
 */
package tp.kits3.comedians.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IBookingDao;
import tp.kits3.comedians.dao.ICartDAO;
import tp.kits3.comedians.dao.IContractDao;
import tp.kits3.comedians.dao.IContractDaoCustome;
import tp.kits3.comedians.dao.IContractDetailDao;
import tp.kits3.comedians.dao.IModelCustomDAO;
import tp.kits3.comedians.dto.ContractDTO;
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.model.CartModel;
import tp.kits3.comedians.model.ContractDetailModel;
import tp.kits3.comedians.model.ContractModel;
import tp.kits3.comedians.service.IContractService;

@Service
public class ContractService implements IContractService {

	@Autowired
	private IContractDao iContractDao;
	
	@Autowired
	private IContractDaoCustome iContractDaoCustome;
	
	@Autowired
	private IBookingDao bookingDAO;
	
	@Autowired
	private IModelCustomDAO modelCustomDAO;
	
	@Autowired
	private IContractDetailDao contractDetailDAO;

	@Autowired
	private ICartDAO cartDAO;
	
	@Override
	public List<ContractModel> findAll() {
		// TODO Auto-generated method stub
		return iContractDao.findAll();
	}

	@Override
	public ContractModel selectOneById(int id) {
		// TODO Auto-generated method stub
		return iContractDao.findOneById(id);
	}

	@Override
	public void insert(int accountid, String username) {
		ContractModel contractModel = new ContractModel();
		contractModel.setAccountid(accountid);
		contractModel.setStatus(0);
		contractModel.setCreatedby(username);
		contractModel.setModifiedby(username);
		int contractid = iContractDao.insert(contractModel);
		List<CartModel> cartList = cartDAO.findOneByAccountId(accountid);
		for(int i = 0 ; i < cartList.size() ; ++i) {
			ModelDTO model = modelCustomDAO.findOneById(cartList.get(i).getModelid());
			ContractDetailModel contractDetailModel = new ContractDetailModel();
			contractDetailModel.setContractid(contractid);
			contractDetailModel.setModelid(cartList.get(i).getModelid());
			contractDetailModel.setDay(cartList.get(i).getDay());
			contractDetailModel.setPrice(model.getPrice() * contractDetailModel.getDay());
			contractDetailModel.setCreatedby(username);
			contractDetailModel.setModifiedby(username);
			contractDetailDAO.insert(contractDetailModel);
			bookingDAO.updateStatus(cartList.get(i).getModelid(), accountid);
			cartDAO.delete(cartList.get(i).getModelid(), accountid);
		}
		iContractDao.updatePrice(contractid);
	}

	@Override
	public void update(ContractModel contractModel) {
		// TODO Auto-generated method stub
		iContractDao.update(contractModel);
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		iContractDao.delete(ids);
	}

	@Override
	public List<ContractDTO> findAllDTO() {
		// TODO Auto-generated method stub
		List<ContractDTO> list = iContractDaoCustome.findAllDTO();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getStatus() == 0) {
				list.get(i).setStatusName("none-active");
			} else
				list.get(i).setStatusName("actived");
		}
		return list;
	}

	@Override
	public ContractDTO findById(int id) {
		// TODO Auto-generated method stub
		return iContractDaoCustome.findById(id);
	}

	@Override
	public List<ContractDTO> findByCreatedate(Date date) {
		// TODO Auto-generated method stub
		List<ContractDTO> list = new ArrayList<ContractDTO>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		for (ContractDTO cDTO : findAllDTO()) {
			if (formatter.format(cDTO.getCreatedate()).equals(formatter.format(date))) {
				list.add(cDTO);
			}
		}
		return list;
	}

	@Override
	public List<ContractDTO> findByModefieddate(Date date) {
		// TODO Auto-generated method stub
		List<ContractDTO> list = new ArrayList<ContractDTO>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		for (ContractDTO cDTO : findAllDTO()) {
			if (formatter.format(cDTO.getModifieddate()).equals(formatter.format(date))) {
				list.add(cDTO);
			}
		}
		return list;
	}

}
