package tp.kits3.comedians.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SelectedController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/selected", method = RequestMethod.GET)
	public String about(Model model) {
		
		return "web/cart";
	}
	
}
