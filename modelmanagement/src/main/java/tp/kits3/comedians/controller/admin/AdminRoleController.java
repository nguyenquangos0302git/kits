package tp.kits3.comedians.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.model.RoleModel;
import tp.kits3.comedians.service.IRoleService;

@RequestMapping("/admin-role")
@Controller
public class AdminRoleController {
	@Autowired
	private IRoleService roleService;

	@RequestMapping(method = RequestMethod.GET)
	public String rank(Model model) {
		model.addAttribute("roleList", roleService.findAll());
		return "/admin/role/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addForm(Model model) {
		return "/admin/role/form";
	}

	@RequestMapping(value = "/add1", method = RequestMethod.POST)
	public String insert(RoleModel model) {
		System.out.println(model.getId());
		int i = model.getId();
		if (i == 0) {
			roleService.insert(model);

		} else {

			roleService.update(model);

		}
		return "redirect:/admin-role";

	}
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String upDate(@PathVariable("id") int id, Model model) {
		model.addAttribute("roleModel", roleService.selectOne(id));
		return "/admin/role/form";
	}

}
