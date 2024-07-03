/**
 * @author giang
 */
package tp.kits3.comedians.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.utils.CookieUtil;
import tp.kits3.comedians.utils.SessionUtil;

@Controller
public class LoginController {

	@Autowired
	private IAccountService accountService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model) {
		return "web/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(AccountUserRoleDTO account, HttpServletRequest req) {
		return accountService.findByUsernameAndPasswordAndStatus(req, account.getUsername(), account.getPassword(), 1);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		// Remove session
		SessionUtil.getInstance().removeValue(req, "ACCOUNT");
		// Remove cookie
		CookieUtil.removeCookie(req, resp);
		return "redirect:/";
	}
	
	@RequestMapping("accessDenied")
	public String accessDenied() {
		return "redirect:/login?accessDenied";
	}
}
