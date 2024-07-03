/**
 * @author quang
 */
package tp.kits3.comedians.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminAccountController {

	@RequestMapping(value = "/admin-account", method = RequestMethod.GET)
	public String home(Model model) {
		return "admin/account/list";
	}
	
//	@RequestMapping(value = "/admin-account/{id}", method = RequestMethod.GET)
//	@ResponseBody
//	public String detail(Model model, @PathVariable("id") Integer id) {
//		ObjectMapper object = new ObjectMapper();
//		UserModel user = new UserModel();
//		user.setAddress("ss");
//		user.setCompany("db");
//		String json = "";
//		try {
//			json = object.writeValueAsString(user);
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
//		return json;
//	}
	
}
