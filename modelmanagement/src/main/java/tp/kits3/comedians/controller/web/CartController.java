package tp.kits3.comedians.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.dto.CartDTO;
import tp.kits3.comedians.service.ICartService;
import tp.kits3.comedians.utils.SessionUtil;

@Controller
public class CartController {

	@Autowired
	private ICartService cartService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String showList(Model model, HttpServletRequest req) {
		AccountUserRoleDTO user = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
		List<CartDTO> list = cartService.findAllByAccountId(user.getId());
		model.addAttribute("cartList", cartService.findAllByAccountId(user.getId()));
		return "web/cart";
	}

}
