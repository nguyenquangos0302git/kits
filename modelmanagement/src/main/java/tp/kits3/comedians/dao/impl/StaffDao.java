package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.model.StaffModel;

@Repository
public class StaffDao extends CommonDao<StaffModel> implements IStaffDao {

	@Override
	public int findByIdCard(String idcard) {
		List<StaffModel> list = query("staffMapper", "selectStaffByIdCard", idcard);
		return list.isEmpty() ? 0 : 1;
	}

	public int insert(StaffModel param) {
		int result = insert("staffMapper", "insert", param);
		result = param.getId();
		return result;
	}

	@Override
	public StaffModel findOneByAccountId(int accountId) {
		List<StaffModel> list = query("staffMapper", "findOneByAccountId", accountId);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void delete(int id) {
		delete("staffMapper", "deleteStaffByAccountId", id);
	}

}
