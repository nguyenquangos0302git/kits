/**
 * @author giang, sang(rating)
 */
package tp.kits3.comedians.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.model.RatingModel;
import tp.kits3.comedians.service.ICommentService;
import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.IRatingService;
import tp.kits3.comedians.utils.SessionUtil;

@Controller
public class ModelDetailController {
	@Autowired
	private IRatingService ratingService;
	@Autowired
	private IModelService modeService;
	@Autowired
	private ICommentService commentService;
	

	@RequestMapping(value = "/model-detail/{id}", method = RequestMethod.GET)
	public String detailModel(@PathVariable int id, Model model, HttpServletRequest req) {
		AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
		ModelModel modelModel = new ModelModel();
		modelModel = modeService.findById(id);
		if (modelModel != null) {
			model.addAttribute("modelinfo", modeService.findModelById(id));
			model.addAttribute("commentModel", commentService.findAllByModelId(id));
			model.addAttribute("subcommentModel", commentService.findAllSubComment(id));
			model.addAttribute("talentModel", modeService.selectTalent(id));
			model.addAttribute("multiImages", modeService.multiImage(id));
			model.addAttribute("ratingModel",ratingService.ratingModel(id));
			if(account != null) {
				System.out.println(ratingService.contractidByAccountidAndModelid(account.getId(), id));
				model.addAttribute("ratingStatus",ratingService.contractidByAccountidAndModelid(account.getId(), id));
			}
			return "web/modeldetail";
		} else {
			return "redirect:/notfound";
		} 
	}
}
