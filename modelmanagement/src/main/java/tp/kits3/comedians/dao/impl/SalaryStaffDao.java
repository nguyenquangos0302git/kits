package tp.kits3.comedians.dao.impl;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ISalaryStaffDao;
import tp.kits3.comedians.model.SalaryStaffModel;

@Repository
public class SalaryStaffDao extends CommonDao<SalaryStaffModel> implements ISalaryStaffDao {

	@Override
	public int insertSalaryEveryMonth(SalaryStaffModel param) {
		int result = insert("salaryStaffMapper", "insert", param);
		result = param.getId();
		return result;
	}

}
