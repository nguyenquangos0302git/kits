package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.service.IStaffService;

@Service
public class StaffService implements IStaffService {
	
	@Autowired
	private IStaffDao staffDao;

	@Override
	public List<StaffModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StaffModel selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(StaffModel param) {
		return staffDao.insert(param);
	}

	@Override
	public void update(StaffModel param) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int findByIdCard(String idcard) {
		return staffDao.findByIdCard(idcard);
	}

	@Override
	public StaffModel findOneByAccountId(int accountId) {
		// TODO Auto-generated method stub
		return null;
	}

}
