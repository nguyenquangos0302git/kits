/**
 * @author loi
 */
package tp.kits3.comedians.controller.admin;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.comedians.model.TalentModel;
import tp.kits3.comedians.service.ITalentService;

@Controller
@RequestMapping("/admin-talent")
public class AdminTalentController {
	@Autowired
	private ITalentService talentService;

	@RequestMapping(method = RequestMethod.GET)
	public String talent(Model model) {
		/* model.addAttribute("newTalent", new TalentModel()); */
		model.addAttribute("talentList", talentService.findAll());
		return "/admin/talent/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addTalent(Model model) {
		/* model.addAttribute("newTalent", new TalentModel()); */
		return "/admin/talent/form";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addlistTalent(TalentModel model) {
		talentService.insert(model);
		return "redirect:/admin-talent";
	}

	@RequestMapping(value = "/update/{coid}", method = RequestMethod.GET)
	public String updateTalent(@PathVariable("coid") int id, Model model) {
		model.addAttribute("talentModel", talentService.selectOne(id));
		return "/admin/talent/form";
	}

	@RequestMapping(value = "/update/add", method = RequestMethod.POST)
	public String updateDoneTalent(TalentModel talent) {
		talentService.update(talent);
		return "redirect:/admin-talent";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") List<Integer> id) {
		
		talentService.delete(id);
		return "redirect:/admin-talent";
	}

}
