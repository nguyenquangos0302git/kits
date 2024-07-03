/**
 * @author quang
 */
package tp.kits3.comedians.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.constant.SystemConstant;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.service.IAccountService;

@Controller
public class RegisterController {
	
	@Autowired
	private IAccountService accountService;  
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		AccountUserRoleDTO accountUserDTO = new AccountUserRoleDTO();
		model.addAttribute("registerForm", accountUserDTO);
		model.addAttribute(SystemConstant.MODEL, accountService.findAll());
		return "register/signup";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("registerForm") AccountUserRoleDTO accountUserDTO, Model model) {
		
		accountService.insert(request, response, accountUserDTO);
		
		return "redirect:/";
	}
	
}
