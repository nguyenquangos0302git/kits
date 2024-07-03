package tp.kits3.comedians.service;

import javax.servlet.http.HttpServletRequest;

import tp.kits3.comedians.dto.AccountUserRoleDTO;

public interface IAccountDeleteService {

	void insert(HttpServletRequest request, AccountUserRoleDTO param);
}
