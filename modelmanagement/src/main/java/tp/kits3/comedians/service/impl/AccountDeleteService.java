package tp.kits3.comedians.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.dao.IAccountDeleteDao;
import tp.kits3.comedians.dao.IRoleAccountDao;
import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountDeleteModel;
import tp.kits3.comedians.model.AccountModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.IAccountDeleteService;
import tp.kits3.comedians.utils.DeleteFileUtil;
import tp.kits3.comedians.utils.SessionUtil;

@Service
public class AccountDeleteService implements IAccountDeleteService{

	@Autowired
	private IAccountDao accountDao;
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private IRoleAccountDao roleAccountDao;
	
	@Autowired
	private IAccountDeleteDao accountDeleteDao;
	
	@Autowired
	private IStaffDao staffDao;
	
	
	@Override
	public void insert(HttpServletRequest request, AccountUserRoleDTO param) {
		
		AccountUserRoleDTO accountUserRole = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		
		List<Integer> listId = param.getIds();
		
		for (int id : listId) {
			AccountDeleteModel accountDelete = new AccountDeleteModel();
			// get account by id
			AccountModel account = accountDao.findById(id);
			accountDelete.setUsername(account.getUsername());
			accountDelete.setEmail(account.getEmail());
			
			// get data user by id
			UserModel user = userDao.findOneByAccountId(id);
			
			if (user != null) {
				accountDelete.setName(user.getName());
				accountDelete.setPhone(user.getPhone());
				accountDelete.setAddress(user.getAddress());
				accountDelete.setCompany(user.getCompany());
				accountDelete.setGender(user.getGender());
				//DeleteFileUtil.deleteFileUtil("user", user.getAvatar());
				// remove role_account
				roleAccountDao.delete(id);
				
				// remove user
				userDao.delete(id);
			}
			
			StaffModel staff = staffDao.findOneByAccountId(id);
			
			if (staff != null) {
				accountDelete.setName(staff.getName());
				accountDelete.setPhone(staff.getPhone());
				accountDelete.setAddress(staff.getAddress());
				accountDelete.setCompany(staff.getCompany());
				accountDelete.setGender(staff.getGender());
				DeleteFileUtil.deleteFileUtil("staff", staff.getAvatar());
				// remove role_account
				roleAccountDao.delete(id);
				
				// remove user
				staffDao.delete(id);
			}
			
			// get user hander by session in here
			accountDelete.setCreatedby(accountUserRole.getCreatedby());
			accountDelete.setModifiedby(accountUserRole.getModifiedby());
			
			// insert data into table.accountdelete
			accountDeleteDao.insert(accountDelete);
		}
		accountDao.delete(listId);	
	}

}
