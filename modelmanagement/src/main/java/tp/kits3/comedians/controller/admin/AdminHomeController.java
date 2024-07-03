/**
 * @author quang
 */
package tp.kits3.comedians.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.service.IReportService;

@Controller
public class AdminHomeController {

	@Autowired
	IReportService reportService;

	@RequestMapping(value = "/admin-home", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("reportWeek", reportService.reportWeek());
		return "admin/home";
	}
	
}
