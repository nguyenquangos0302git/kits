package tp.kits3.comedians.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CancelController {

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String home() {
		
		return "web/cancel";
	}
	
}
