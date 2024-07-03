/**
 * @author dung, quang, giang
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.model.UserCommonModel;
import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.service.IAccountUserRoleAccountRoleService;
import tp.kits3.comedians.service.IUserService;
import tp.kits3.comedians.utils.SessionUtil;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserDao userDAO;
	
	@Autowired
	private IAccountDao accountDao;
	
	@Autowired
	private IRoleDao roleDAO;

	@Override
	public List<UserModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserModel selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(UserModel param) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int update(HttpServletRequest request, UserModel param) {
		// TODO Auto-generated method stub
		AccountUserRoleDTO accountUserRole = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		int result = userDAO.update(param);
		accountUserRole = detailUser(accountDao.findById(accountUserRole.getId()), userDAO.findOneByAccountId(accountUserRole.getId()));
		SessionUtil.getInstance().putValue(request, "ACCOUNT", accountUserRole);
		return result;
	}
	
	private AccountUserRoleDTO detailUser(AccountModel account, UserCommonModel role) {
		AccountUserRoleDTO userDetail = null;
		if (role instanceof StaffModel) {
			userDetail = new AccountUserRoleDTO(account.getId(), role.getId(), account.getUsername(),
					account.getPassword(), account.getEmail(), role.getName(), role.getPhone(), role.getGender(),
					role.getAvatar(), role.getAddress(), role.getCompany());
		} else if (role instanceof UserModel) {
			userDetail = new AccountUserRoleDTO(account.getId(), role.getId(), account.getUsername(),
					account.getPassword(), account.getEmail(), role.getName(), role.getPhone(), role.getGender(),
					role.getAvatar(),  role.getAddress(), role.getCompany());
		}

		userDetail.setRoles(roleDAO.getRolesName(account.getId()));
		return userDetail;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserModel findOneByAccountId(int accountId) {
		UserModel userModel = new UserModel();
		userModel.setAccountid(accountId);
		return userDAO.findOneByAccountId(accountId);
	}

	@Override
	public int findByIdCard(String idcard) {
		return userDAO.findByIdCard(idcard);
	}

	
}
