/**
 * @author dung, quang, giang
 */
package tp.kits3.comedians.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.AccountModel;

@Component
public interface IAccountService {

	List<AccountModel> findAll();
	
	AccountModel findById(int id);
	
	AccountModel findByUsernameAndPassword(String username, String passWord);
	
	String findByUsernameAndPasswordAndStatus(HttpServletRequest req, String username, String password, int status);
	
	int insert(HttpServletRequest request, HttpServletResponse response, AccountUserRoleDTO param);
	
	void update(AccountModel param);
	
	void delete(int id);

	boolean login(AccountUserRoleDTO user);
	
	AccountUserRoleDTO loginByToken(String token);

	AccountModel findByUsername(String username);
	
	void changeStatusAccountByIdAndStatus(HttpServletRequest req, AccountModel account);
	
	int findByUserNameOrEmail(String username, String email);
	
	void deleteAccountByIdAndStatus(HttpServletRequest req, AccountModel account);
}
