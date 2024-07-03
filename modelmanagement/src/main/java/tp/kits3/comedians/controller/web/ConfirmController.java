package tp.kits3.comedians.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConfirmController {

	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String about(Model model) {
		
		return "confirm/confirm";
	}
	
}
