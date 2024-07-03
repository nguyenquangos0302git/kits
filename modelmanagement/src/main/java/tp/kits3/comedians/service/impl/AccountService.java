/**
 * @author dung, quang, giang
 */
package tp.kits3.comedians.service.impl;

import java.io.File;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.constant.SystemConstant;
import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.dao.ICartDAO;
import tp.kits3.comedians.dao.IRoleAccountDao;
import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountModel;
import tp.kits3.comedians.model.RoleAccountModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.model.UserCommonModel;
import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.service.IStaffService;
import tp.kits3.comedians.utils.GetTimeNowUtil;
import tp.kits3.comedians.utils.RandomAvatarUserUtil;
import tp.kits3.comedians.utils.RandomCodeVerificationUtil;
import tp.kits3.comedians.utils.SendMailUtil;
import tp.kits3.comedians.utils.SessionUtil;
import tp.kits3.comedians.utils.UploadFileUtil;

@Service
public class AccountService implements IAccountService {

	@Autowired
	private IAccountDao accountDao;

	@Autowired
	private IUserDao userDao;

	@Autowired
	private IRoleAccountDao roleAccountDao;

	@Autowired
	private IRoleDao roleDAO;

	@Autowired
	private ICartDAO cartDAO;

	@Autowired
	private IStaffDao staffDAO;

	@Autowired
	private JwtService jwtService;

	@Autowired
	private IStaffService staffService;

	@Override
	public List<AccountModel> findAll() {
		return accountDao.findAll();
	}

	@Override
	public AccountModel findById(int id) {
		return accountDao.findById(id);
	}

	@Override
	public AccountModel findByUsernameAndPassword(String userName, String passWord) {
		return accountDao.findByUsernameAndPassword(userName, passWord);
	}

	@Override
	public int insert(HttpServletRequest request, HttpServletResponse response, AccountUserRoleDTO param) {

		AccountUserRoleDTO model = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		AccountModel accountModel = new AccountModel();
		RoleAccountModel roleAccountModel = new RoleAccountModel();

		int accountid = 0;

		String imageURL = null;
		int verifyCode = RandomCodeVerificationUtil.randomCodeVerification();

		accountModel.setUsername(param.getUsername());
		accountModel.setEmail(param.getEmail());
		accountModel.setCodeverification(verifyCode);
		accountModel.setNote("register");

		// handling user vs staff
		if (model == null) {
			UserModel userModel = new UserModel();
			accountModel.setCreatedby(param.getCreatedby());
			accountModel.setModifiedby(param.getModifiedby());

			userModel.setCreatedby(param.getUsername());
			userModel.setModifiedby(param.getUsername());

			String has = BCrypt.hashpw(param.getPassword(), BCrypt.gensalt(10));
			accountModel.setPassword(has);
			imageURL = RandomAvatarUserUtil.randomAvatarUser();

			accountid = accountDao.insert(accountModel);

			userModel.setName(param.getName());
			userModel.setPhone(param.getPhone());
			userModel.setGender(param.getGender());
			userModel.setAccountid(accountid);
			userModel.setCreatedby(param.getUsername());
			userModel.setModifiedby(param.getUsername());
			userModel.setAvatar(imageURL);

			userDao.insert(userModel);

			roleAccountModel.setAccountid(accountid);

			roleAccountDao.insert(roleAccountModel);

			SendMailUtil.sendMail(param.getEmail(), verifyCode);

		} else {

			StaffModel staffModel = new StaffModel();

			accountModel.setCreatedby(model.getUsername());
			accountModel.setModifiedby(model.getUsername());
			String has = BCrypt.hashpw(SystemConstant.PASSWORD__ACCOUNT__ROOT, BCrypt.gensalt(10));
			accountModel.setPassword(has);
			accountid = accountDao.insert(accountModel);

			staffModel.setAccountid(accountid);
			staffModel.setName(param.getName());
			staffModel.setAddress(param.getAddress());
			staffModel.setPhone(param.getPhone());
			staffModel.setCompany(param.getCompany());
			staffModel.setIdcard(param.getPhone());
			staffModel.setBirthday(param.getBirthday());
			staffModel.setCreatedby(model.getUsername());
			staffModel.setModifiedby(model.getUsername());
			staffModel.setGender(param.getGender());

			String avatarString = param.getAvatar();
			avatarString = accountid + "_" + param.getUsername() + ".jpg";

			// handling image
			byte[] decodeBase64 = Base64.getDecoder().decode(param.getBase64().split(",")[1].getBytes());
			UploadFileUtil.writeOrUpdate(decodeBase64, "/staff/" + File.separator + avatarString);

			staffModel.setAvatar(SystemConstant.STAFF__AVATAR + avatarString);

			staffService.insert(staffModel);

			for (int roleid : param.getRoleids()) {
				roleAccountModel.setAccountid(accountid);
				roleAccountModel.setRoleid(roleid);
				roleAccountDao.insertStaffRole(roleAccountModel);
			}

			SendMailUtil.sendMailStaffAccount(param.getEmail(), verifyCode, SystemConstant.PASSWORD__ACCOUNT__ROOT, param.getUsername());
		}

		return accountid;
	}

	@Override
	public void update(AccountModel param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// accountDao.delete(id);
	}

	@Override
	public String findByUsernameAndPasswordAndStatus(HttpServletRequest req, String username, String password,
			int status) {
		String view = "redirect:/";
		AccountUserRoleDTO user = null;
		AccountModel account = accountDao.findOneByUserNameAndStatus(username, status);
		if (account != null) {
			BCryptPasswordEncoder encoded = new BCryptPasswordEncoder();
			if (encoded.matches(password, account.getPassword())) {
				if (userDao.findOneByAccountId(account.getId()) != null) {
					user = detailUser(account, userDao.findOneByAccountId(account.getId()));
				} else if (staffDAO.findOneByAccountId(account.getId()) != null) {
					user = detailUser(account, staffDAO.findOneByAccountId(account.getId()));
				}
				user.setCountCart(cartDAO.countCartByAccountId(user.getId()));
				SessionUtil.getInstance().putValue(req, "ACCOUNT", user);
				if (user.getRoles().contains("ADMIN") || user.getRoles().contains("MANAGEMENT")
						|| user.getRoles().contains("STAFF")) {
					view = "redirect:/admin-home";
				}
			} else {
				view = "redirect:/login?invalid";
			}
		} else {
			view = "redirect:/login?invalid";
		}
		return view;
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
	public boolean login(AccountUserRoleDTO accountModel) {
		AccountModel account = accountDao.findOneByUserNameAndStatus(accountModel.getUsername(), 1);
		if (account != null) {
			BCryptPasswordEncoder encoded = new BCryptPasswordEncoder();
			if (encoded.matches(accountModel.getPassword(), account.getPassword())
					|| accountModel.getPassword().equals(account.getPassword())) {

				return true;
			}
		}
		return false;
	}

	@Override
	public AccountModel findByUsername(String username) {
		return accountDao.findByUserName(username);
	}

	@Override
	public AccountUserRoleDTO loginByToken(String token) {
		AccountUserRoleDTO user = null;
		if (jwtService.validateTokenLogin(token)) {
			String username = jwtService.getUserFromToken(token);
			AccountModel account = accountDao.findOneByUserNameAndStatus(username, 1);
			if (account != null) {
				if (userDao.findOneByAccountId(account.getId()) != null) {
					user = detailUser(account, userDao.findOneByAccountId(account.getId()));
				} else if (staffDAO.findOneByAccountId(account.getId()) != null) {
					user = detailUser(account, staffDAO.findOneByAccountId(account.getId()));
				}
			}
		}
		return user;
	}

	@Override
	public void changeStatusAccountByIdAndStatus(HttpServletRequest request, AccountModel account) {
		AccountUserRoleDTO accountUserRole = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request,
				"ACCOUNT");
		Date date = GetTimeNowUtil.getTimeNow();
		String note = "change status";
		accountDao.changeStatusAccountByIdAndStatus(account.getStatus(), note, accountUserRole.getUsername(), date,
				account.getId());
	}

	@Override
	public int findByUserNameOrEmail(String username, String email) {
		return accountDao.findByUserNameOrEmail(username, email);
	}

	@Override
	public void deleteAccountByIdAndStatus(HttpServletRequest req, AccountModel account) {
		AccountUserRoleDTO accountUserRole = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
		Date date = GetTimeNowUtil.getTimeNow();
		String note = "change status";
		accountDao.changeStatusAccountByIdAndStatus(1, note, accountUserRole.getUsername(), date, account.getId());
	}

}
