/**
 * @author minh
 */
package tp.kits3.comedians.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.model.ContactModel;
import tp.kits3.comedians.service.impl.ContactService;

@Controller
public class ContactController {
	
	@Autowired
	private ContactService dao;
	private static final String CONTACT = "web/contact";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String insert(Model model) {
		ContactModel contactModel = new ContactModel();
		model.addAttribute("contactModel", contactModel);
		return CONTACT;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String saveContact(@ModelAttribute("contactModel") ContactModel contact) {
		dao.insert(contact);
		return CONTACT;
	}
	
	
	
}
