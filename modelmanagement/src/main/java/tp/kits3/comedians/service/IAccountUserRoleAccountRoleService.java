package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.AccountStaffSalaryRoleDTO;
import tp.kits3.comedians.dto.AccountUserRoleDTO;

public interface IAccountUserRoleAccountRoleService {

	AccountUserRoleDTO findById(int id);
	
	List<AccountUserRoleDTO> findAll();
	
	AccountStaffSalaryRoleDTO findByAccountId(int accountid);
}
