/**
 * @author dung
 */
package tp.kits3.comedians.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IContractDao;
import tp.kits3.comedians.dao.IContractDetailDao;
import tp.kits3.comedians.dao.IContractDetailDaoCustome;
import tp.kits3.comedians.dao.IModelDao;
import tp.kits3.comedians.dto.ContractDetailDTO;
import tp.kits3.comedians.model.ContractDetailModel;
import tp.kits3.comedians.service.IContractDetailService;

@Service
public class ContractDetailService implements IContractDetailService {

	@Autowired
	IContractDetailDao iContractDetailDao;
	
	@Autowired
	IModelDao iModelDao;
	@Autowired
	IContractDao iContractDao;
	
	@Autowired
	IContractDetailDaoCustome iContractDetailCustom;
	@Override
	public List<ContractDetailModel> findAll() {
		// TODO Auto-generated method stub
		return iContractDetailDao.findAll();
	}

	@Override
	public ContractDetailModel findById(int id) {
		// TODO Auto-generated method stub
		return iContractDetailDao.findById(id);
	}

	@Override
	public void insert(ContractDetailModel contractDetailModel) {
		// TODO Auto-generated method stub
		iContractDetailDao.insert(contractDetailModel);
	}

	@Override
	public void update(ContractDetailModel contractDetailModel) {
		// TODO Auto-generated method stub
		iContractDetailDao.update(contractDetailModel);
		iContractDao.updatePrice(contractDetailModel.getContractid());
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		List<Integer> lstContractid = new ArrayList<Integer>();
		for(int i : ids) {
			lstContractid.add(findById(i).getContractid());
		}
		iContractDetailDao.delete(ids);
		for(int i : lstContractid) {
			iContractDao.updatePrice(i);
		}
		
	}

	@Override
	public List<ContractDetailDTO> findAllDTO() {
		// TODO Auto-generated method stub
		return iContractDetailCustom.findAll();
	}

	@Override
	public List<ContractDetailDTO> findByContractid(String id) {
		// TODO Auto-generated method stub
		return iContractDetailCustom.findByContractid(id);
	}

	@Override
	public List<ContractDetailDTO> findAllByContractid(int contractid) {
		return iContractDetailCustom.findAllByContractid(contractid);
	}

}
