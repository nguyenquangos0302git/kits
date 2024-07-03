package tp.kits3.comedians.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.model.SlideModel;
import tp.kits3.comedians.service.ISlideService;

@Controller
@RequestMapping("/admin-slide")
public class AdminSlideController {
	@Autowired
	private ISlideService slideService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String slide(Model model) {
		model.addAttribute("slideList", slideService.findAll());
		return "/admin/slide/list";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addSlide(Model model) {
		
		return "/admin/slide/form";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addListSlide(SlideModel slide) {
		slideService.insert(slide);
		return "redirect:/admin-slide";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String updateSlide(@PathVariable("id") int id, Model model) {
		model.addAttribute("slideModel", slideService.selectOne(id));
		return "/admin/slide/form";
	}
	
	@RequestMapping(value = "/update/add", method = RequestMethod.POST)
	public String updateDoneSlide(SlideModel slide) {
		slideService.update(slide);
		return "redirect:/admin-slide";
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") List<Integer> id) {
		slideService.delete(id);
		return "redirect:/admin-slide";
	}
}
