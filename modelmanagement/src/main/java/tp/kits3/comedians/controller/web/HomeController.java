/**
 * @author loi, giang
 */
package tp.kits3.comedians.controller.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.ISlideService;

@Controller
public class HomeController {

	@Autowired
	private ISlideService slideService;

	@Autowired
	private IModelService modelService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {
		model.addAttribute("slideList", slideService.findAll());
		model.addAttribute("modelTopList", modelService.findTopTenModel());
		model.addAttribute("femaleModel", modelService.findFemales());
		model.addAttribute("maleModel", modelService.findMales());
		model.addAttribute("kidModel", modelService.findKids());
		model.addAttribute("newModel", modelService.findNewFace());
		return "web/home";
	}
}
