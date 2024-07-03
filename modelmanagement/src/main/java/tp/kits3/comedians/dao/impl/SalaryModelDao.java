package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ISalaryModelDao;
import tp.kits3.comedians.model.SalaryModelModel;
@Repository
public class SalaryModelDao extends CommonDao<SalaryModelModel> implements ISalaryModelDao {

	@Override
	public int insertSalaryEveryMonth(SalaryModelModel param) {
		int result = insert("salaryModelMapper", "insert", param);
		result = param.getId();
		return result;
	}

	@Override
	public SalaryModelModel findSalaryByModelid(int id) {
		// TODO Auto-generated method stub
		return query("salaryModelMapper", "findSalaryByModelid", id).isEmpty()? null:query("salaryModelMapper", "findSalaryByModelid", id).get(0);
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		query("salaryModelMapper", "delete", ids);
	}

	@Override
	public List<SalaryModelModel> findByModelid(int id) {
		// TODO Auto-generated method stub
		return query("salaryModelMapper", "findByIdModel", id);
	}

	@Override
	public void update(SalaryModelModel salaryModelModel) {
		// TODO Auto-generated method stub
		query("salaryModelMapper", "update", salaryModelModel);
	}

}
