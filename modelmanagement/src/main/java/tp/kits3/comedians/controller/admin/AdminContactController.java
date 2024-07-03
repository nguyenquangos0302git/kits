/*
 * author minh
 * */

package tp.kits3.comedians.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.service.IContactService;


@Controller
@RequestMapping("/admin-contact")
public class AdminContactController {
	
	@Autowired
	
	private IContactService contactService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String talent(Model model) {
		/* model.addAttribute("newTalent", new TalentModel()); */
		model.addAttribute("contactList", contactService.findAll());
		return "/admin/contact/list";
	}
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") List<Integer> id) {
		contactService.delete(id);
		return "redirect:/admin-contact";
	}

	/*
	 * @RequestMapping(value = "/search", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<ContactModel> search(HttpServletRequest req) {
	 * String name = req.getParameter("name"); name = "%" + name + "%";
	 * List<ContactModel> list = contactService.findAllByName(name); return list; }
	 */
}
