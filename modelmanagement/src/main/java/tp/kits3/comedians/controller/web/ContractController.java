package tp.kits3.comedians.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tp.kits3.comedians.service.IContractService;

@Controller
public class ContractController {
	
	@RequestMapping("/cart/{accountid}")
	public String addContract(@PathVariable("accountid") int accountid) {
		return "redirect:/cart";
	}
}
