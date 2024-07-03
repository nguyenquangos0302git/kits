/**
 * @author dung, sang
 */
package tp.kits3.comedians.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.IRankService;
import tp.kits3.comedians.service.ITalentService;

@Controller
public class ModelController {

	@Autowired
	private IModelService modelService;
	@Autowired
	private ITalentService talentService;
	@Autowired
	private IRankService rankService;

	@RequestMapping(value = "/{type}", method = RequestMethod.GET)
	public String allModel(Model model, @PathVariable("type") String type) {
		model.addAttribute("allList", modelService.findAll());
		model.addAttribute("allTalent", talentService.findAll());

		model.addAttribute("allRank", rankService.selectRank());
		if (type.equals("kids")) {
			List<Integer> list = modelService.selectAge();
			list.set(list.size() - 1, 15);
			model.addAttribute("selectAge", list);
		} else {
			model.addAttribute("selectAge", modelService.selectAge());
		}
		switch (type) {
		case "all":
			model.addAttribute("modelList", modelService.findAllModel());
			break;
		case "male":
			model.addAttribute("modelList", modelService.findMales());
			break;
		case "female":
			model.addAttribute("modelList", modelService.findFemales());
			break;
		case "new-faces":
			model.addAttribute("modelList", modelService.findNewFace());
			break;
		case "kids":
			model.addAttribute("modelList", modelService.findKids());
			break;
		default:
			break;
		}
		return "web/model";
	}

}
