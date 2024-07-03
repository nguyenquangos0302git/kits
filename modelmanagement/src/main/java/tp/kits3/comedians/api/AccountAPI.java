package tp.kits3.comedians.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.AccountStaffSalaryRoleDTO;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountModel;
import tp.kits3.comedians.service.IAccountDeleteService;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.service.IAccountUserRoleAccountRoleService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class AccountAPI {

	@Autowired
	private IAccountDeleteService accountDeleteService;
	
	@Autowired
	private IAccountUserRoleAccountRoleService accountUserRoleService;
	
	@Autowired
	private IAccountService accountService;
	
	@GetMapping("/api-admin/account/findall")
	public Object getInformationAccountUserRoleAccountRole() {
		try {
			List<AccountUserRoleDTO> listAccountUserRole = accountUserRoleService.findAll();
			return new ResponseEntity<List<AccountUserRoleDTO>>(listAccountUserRole, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/api-admin/account/{id}")
	public Object getInformationAccountUserRoleAccountRoleById(@PathVariable("id") int id) {
		AccountStaffSalaryRoleDTO accountUserRoleDTO = new AccountStaffSalaryRoleDTO();
		try {
			accountUserRoleDTO = accountUserRoleService.findByAccountId(id);
			return new ResponseEntity<AccountStaffSalaryRoleDTO>(accountUserRoleDTO, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/api-admin/account/delete")
	public Object deleteAccount(HttpServletRequest request, @RequestBody AccountUserRoleDTO ids) {
		String status = "";
		try {
			accountDeleteService.insert(request, ids);
			status = "OK";
			return new ResponseEntity<>(status, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			status = "ERROR";
			return new ResponseEntity<>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/api-admin/account/status")
	public Object changeStatus(@RequestBody AccountModel account, HttpServletRequest request) {
		try {
			AccountUserRoleDTO accountUserRoleDTO = new AccountUserRoleDTO();
			accountService.changeStatusAccountByIdAndStatus(request, account);
			accountUserRoleDTO = accountUserRoleService.findById(account.getId());
			return new ResponseEntity<AccountUserRoleDTO>(accountUserRoleDTO, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			String status = "ERROR";
			return new ResponseEntity<>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/api-admin/account/checkaccount")
	public Object checkAccountOrEmailExist(@RequestParam(defaultValue = "null") String username, @RequestParam(defaultValue = "null") String email) {
		int isAccount = 0;
		try {
			isAccount = accountService.findByUserNameOrEmail(username, email);
			return new ResponseEntity<Integer>(isAccount, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			String status = "ERROR";
			return new ResponseEntity<>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/api-admin/account/add")
	public Object insertNewAccount(HttpServletRequest request, HttpServletResponse response, @RequestBody AccountUserRoleDTO accountUserRole) {
		boolean success = false;
		try {
			accountService.insert(request, response, accountUserRole);
			return new ResponseEntity<Boolean>(success, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<Boolean>(success, HttpStatus.BAD_GATEWAY);
		}
	}

}
