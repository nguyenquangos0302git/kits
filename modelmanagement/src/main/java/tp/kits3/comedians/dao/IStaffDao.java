package tp.kits3.comedians.dao;

import tp.kits3.comedians.model.StaffModel;

public interface IStaffDao extends GenericDao<StaffModel> {

	int findByIdCard(String idcard);

	StaffModel findOneByAccountId(int accountId);

	int insert(StaffModel param);
	
	void delete (int id);
}
