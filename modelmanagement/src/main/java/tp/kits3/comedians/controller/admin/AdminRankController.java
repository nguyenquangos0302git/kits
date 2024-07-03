/**
 * @author sang
 */
package tp.kits3.comedians.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.comedians.model.RankModel;
import tp.kits3.comedians.service.IRankService;

@RequestMapping("/admin-rank")
@Controller
public class AdminRankController {
	@Autowired
	private IRankService rankService;

	@RequestMapping(method = RequestMethod.GET)
	public String rank(Model model) {
		model.addAttribute("rankList", rankService.findAll());
		return "/admin/rank/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addForm(Model model) {
		return "/admin/rank/form";
	}

	@RequestMapping(value = "/add1", method = RequestMethod.POST)
	public String insert(RankModel model) {
		rankService.insert(model);
		return "redirect:/admin-rank";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String upDate(@PathVariable("id") int id,Model model) {
		model.addAttribute("rankModel", rankService.selectOne(id));
		return "/admin/rank/form";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		List<Integer> lis = new ArrayList<Integer>();
		lis.add(id);
		rankService.delete(lis);
		return "redirect: /model/admin-rank";
	}
}
