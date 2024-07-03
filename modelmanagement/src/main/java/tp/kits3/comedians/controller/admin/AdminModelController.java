/**
 * @author dung
 */
package tp.kits3.comedians.controller.admin;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.IRankService;

@Controller
@RequestMapping("/admin-model")
public class AdminModelController {

	@Autowired
	private IModelService modelService;
	@Autowired
	private IRankService rankService;

	@RequestMapping(value = "/{rq}={id}", method = RequestMethod.GET) // dung
	public String update(@PathVariable("rq") String rq, @PathVariable("id") int id, Model model) {
		String uri = "";
		if (rq.equals("") && id == 0) {
			List<ModelModel> list = modelService.findAll();
			model.addAttribute("rankModel", rankService.findAll());
			model.addAttribute("allList", list);
			uri = "/admin/model/list";
		}
		if (rq.equals("delete")) {
			ModelModel modelModel = modelService.findById(id);
			modelModel.setStatus(0);
			modelService.update(modelModel);
			uri = "redirect: /model/admin-model/=0";
		} else if (rq.equals("update")) {
			if (id > 0) {
				ModelModel myModel = modelService.findById(id);
				model.addAttribute("rankModel", rankService.findAll());
				model.addAttribute("findModel", myModel);
			} else {
				model.addAttribute("rankModel", rankService.findAll());
				model.addAttribute("findModel", new ModelModel());
			}
			uri = "/admin/model/update";
		}
		return uri;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST) // dung
	public String addModel(@ModelAttribute("findModel") ModelModel model) {
		if (modelService.findById(model.getId()) != null) {
			System.out.println(model.getName());
			System.out.println("update " + modelService.update(model));
		} else {
			System.out.println("insert " + modelService.insert(model));
		}
		return "redirect: /model/admin-model/=0";
	}
}
