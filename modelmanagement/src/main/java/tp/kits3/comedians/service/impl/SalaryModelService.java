package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.ISalaryModelDao;
import tp.kits3.comedians.model.SalaryModelModel;
import tp.kits3.comedians.service.ISalaryModelService;

@Service
public class SalaryModelService implements ISalaryModelService{
	
	@Autowired
	ISalaryModelDao iSalaryModelDao;

	@Override
	public List<SalaryModelModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SalaryModelModel findSalaryByModelId(int id) {
		// TODO Auto-generated method stub
		return iSalaryModelDao.findSalaryByModelid(id);
	}

	@Override
	public void insert(SalaryModelModel salaryModelModel) {
		// TODO Auto-generated method stub
		iSalaryModelDao.insertSalaryEveryMonth(salaryModelModel);
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		iSalaryModelDao.delete(ids);
	}

	@Override
	public List<SalaryModelModel> findByModelid(int id) {
		// TODO Auto-generated method stub
		return iSalaryModelDao.findByModelid(id);
	}

	@Override
	public void update(SalaryModelModel salaryModelModel) {
		// TODO Auto-generated method stub
		iSalaryModelDao.update(salaryModelModel);
	}

}
