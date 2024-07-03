package tp.kits3.comedians.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.dto.AccountStaffSalaryRoleDTO;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountModel;
import tp.kits3.comedians.model.RoleModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.IAccountUserRoleAccountRoleService;
import tp.kits3.comedians.utils.ConvertNumberDayUtil;

@Service
public class AccountUserRoleAccountRoleService implements IAccountUserRoleAccountRoleService{

	@Autowired
	private IAccountDao accountDao;
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private IRoleDao roleDao;
	
	@Autowired
	private IStaffDao staffDao;
	
	@Override
	public AccountUserRoleDTO findById(int id) {
		
		AccountUserRoleDTO accountUserRoleDTO = new AccountUserRoleDTO();
		AccountModel accountModel = new AccountModel();
		
		accountModel = accountDao.findById(id);
		
		accountUserRoleDTO.setId(accountModel.getId());
		accountUserRoleDTO.setUsername(accountModel.getUsername());
		accountUserRoleDTO.setPassword(accountModel.getPassword());
		accountUserRoleDTO.setEmail(accountModel.getEmail());
		accountUserRoleDTO.setStatus(accountModel.getStatus());
		accountUserRoleDTO.setCodeverification(accountModel.getCodeverification());	
		
		accountUserRoleDTO.setModifieddate(accountModel.getModifieddate());
		accountUserRoleDTO.setModifiedby(accountModel.getModifiedby());
		
		accountUserRoleDTO.setNote(accountModel.getNote());
		
		accountUserRoleDTO.setRoles(roleDao.getRolesName(accountModel.getId()));
		
		return accountUserRoleDTO;
	}

	@Override
	public List<AccountUserRoleDTO> findAll() {
		
		List<AccountUserRoleDTO> list = new ArrayList<AccountUserRoleDTO>();	
		
		List<AccountModel> listAccount = accountDao.findAll();
		
		for (AccountModel l : listAccount) {
			AccountUserRoleDTO accountUserRoleDTO = new AccountUserRoleDTO();
			
			accountUserRoleDTO.setId(l.getId());
			accountUserRoleDTO.setUsername(l.getUsername());
			accountUserRoleDTO.setEmail(l.getEmail());
			accountUserRoleDTO.setStatus(l.getStatus());
			accountUserRoleDTO.setCodeverification(l.getCodeverification());
			accountUserRoleDTO.setExpiredcode(l.getExpiredcode());
			accountUserRoleDTO.setCreatedate(l.getCreatedate());
			accountUserRoleDTO.setCreatedby(l.getCreatedby());
			accountUserRoleDTO.setModifieddate(l.getModifieddate());
			accountUserRoleDTO.setModifiedby(l.getModifiedby());
			accountUserRoleDTO.setNote(l.getNote());
			
			UserModel userModel = new UserModel();
			userModel = userDao.findOneByAccountId(l.getId());
			
			if (userModel != null) {
				accountUserRoleDTO.setName(userModel.getName());
				accountUserRoleDTO.setAddress(userModel.getAddress());
				accountUserRoleDTO.setPhone(userModel.getPhone());
				accountUserRoleDTO.setCompany(userModel.getCompany());
				accountUserRoleDTO.setIdcard(userModel.getIdcard());
				accountUserRoleDTO.setGender(userModel.getGender());
				accountUserRoleDTO.setAvatar(userModel.getAvatar());
			}
			
			StaffModel staffModel = new StaffModel();
			staffModel = staffDao.findOneByAccountId(l.getId());
			
			if (staffModel != null) {
				accountUserRoleDTO.setName(staffModel.getName());
				accountUserRoleDTO.setAddress(staffModel.getAddress());
				accountUserRoleDTO.setPhone(staffModel.getPhone());
				accountUserRoleDTO.setCompany(staffModel.getCompany());
				accountUserRoleDTO.setIdcard(staffModel.getIdcard());
				accountUserRoleDTO.setGender(staffModel.getGender());
				accountUserRoleDTO.setAvatar(staffModel.getAvatar());
				accountUserRoleDTO.setCoefficients_salary(staffModel.getCoefficients_salary());
				accountUserRoleDTO.setBirthday(staffModel.getBirthday());
			}
			
			accountUserRoleDTO.setRoles(roleDao.getRolesName(l.getId()));
		
			list.add(accountUserRoleDTO);
		}
		
		return list;
		
	}

	@Override
	public AccountStaffSalaryRoleDTO findByAccountId(int accountid) {
		AccountStaffSalaryRoleDTO accountStaffSalaryRole = new AccountStaffSalaryRoleDTO();
		AccountModel accountModel = new AccountModel();
		UserModel userModel = new UserModel();
		StaffModel staffModel = new StaffModel();
		
		accountModel = accountDao.findById(accountid);
		
		double salary = 0;
		
		accountStaffSalaryRole.setId(accountid);
		accountStaffSalaryRole.setUsername(accountModel.getUsername());
		accountStaffSalaryRole.setEmail(accountModel.getEmail());
		accountStaffSalaryRole.setStatus(accountModel.getStatus());
		accountStaffSalaryRole.setCodeverification(accountModel.getCodeverification());
		accountStaffSalaryRole.setExpiredcode(accountModel.getExpiredcode());
		accountStaffSalaryRole.setNote(accountModel.getNote());
		accountStaffSalaryRole.setCreatedate(accountModel.getCreatedate());
		accountStaffSalaryRole.setModifieddate(accountModel.getModifieddate());
		accountStaffSalaryRole.setCreatedby(accountModel.getCreatedby());
		accountStaffSalaryRole.setModifiedby(accountModel.getCreatedby());
		
		int id = accountModel.getId();
		
		userModel = userDao.findOneByAccountId(id);
		if (userModel != null) {
			accountStaffSalaryRole.setName(userModel.getName());
			accountStaffSalaryRole.setAddress(userModel.getAddress());
			accountStaffSalaryRole.setPhone(userModel.getPhone());
			accountStaffSalaryRole.setCompany(userModel.getCompany());
			accountStaffSalaryRole.setIdcard(userModel.getIdcard());
			accountStaffSalaryRole.setGender(userModel.getGender());
			accountStaffSalaryRole.setAvatar(userModel.getAvatar());
			accountStaffSalaryRole.setRoles(roleDao.getRolesName(id));
		}
		
		staffModel = staffDao.findOneByAccountId(id);
		if (staffModel != null) {
			accountStaffSalaryRole.setName(staffModel.getName());
			accountStaffSalaryRole.setAddress(staffModel.getAddress());
			accountStaffSalaryRole.setPhone(staffModel.getPhone());
			accountStaffSalaryRole.setCompany(staffModel.getCompany());
			accountStaffSalaryRole.setIdcard(staffModel.getIdcard());
			accountStaffSalaryRole.setGender(staffModel.getGender());
			accountStaffSalaryRole.setAvatar(staffModel.getAvatar());
			accountStaffSalaryRole.setCoefficients_salary(staffModel.getCoefficients_salary());
			accountStaffSalaryRole.setBirthday(staffModel.getBirthday());
			accountStaffSalaryRole.setRoles(roleDao.getRolesName(id));
			
			List<RoleModel> listRole = roleDao.findAll();
			
			List<String> list = accountStaffSalaryRole.getRoles();
			for (String l : list) {
				for (RoleModel lr : listRole) {
					if (l.equalsIgnoreCase(lr.getName())) {
						salary = salary + lr.getSalary();
					}
				}
			}
			
			int numberOfDayWork = ConvertNumberDayUtil.covertDay(accountModel.getCreatedate());
			
			accountStaffSalaryRole.setSalary(numberOfDayWork * salary * staffModel.getCoefficients_salary());
		}
		
		return accountStaffSalaryRole;
	}

}
