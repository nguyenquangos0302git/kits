package tp.kits3.comedians.dao;

import tp.kits3.comedians.model.SalaryStaffModel;

public interface ISalaryStaffDao extends GenericDao<SalaryStaffModel> {

	int insertSalaryEveryMonth(SalaryStaffModel param);
	
}
