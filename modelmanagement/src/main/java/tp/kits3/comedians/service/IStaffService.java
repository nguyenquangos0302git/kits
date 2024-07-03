/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.StaffModel;

public interface IStaffService {

	List<StaffModel> findAll();

	StaffModel selectOne(int id);

	StaffModel findOneByAccountId(int accountId);

	int insert(StaffModel param);

	void update(StaffModel param);

	void delete(int id);

	int findByIdCard(String idcard);
}
