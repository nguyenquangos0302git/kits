package tp.kits3.comedians.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.dto.ContractDetailDTO;
import tp.kits3.comedians.model.ContractModel;
import tp.kits3.comedians.service.IContractDetailService;
import tp.kits3.comedians.service.IContractService;
@Controller
@RequestMapping("/admin-contract")
public class AdminContractController {
	@Autowired
	private IContractService iContractService;
	@Autowired
	IContractDetailService iContractDetailService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String talent(Model model) {
		model.addAttribute("allListDTO", iContractService.findAllDTO());
		return "/admin/contract/list";
	}
	@RequestMapping(value = "/{rq}={id}", method = RequestMethod.GET) // dung
	public String update(@PathVariable("rq") String rq, @PathVariable("id") int id, Model model) {
		String uri = "";
		if (rq.equals("delete")) {
			List<Integer> ids = new ArrayList<Integer>();
			ids.add(id);
			iContractService.delete(ids);
			uri = "redirect: /model/admin-contract";
		} else if (rq.equals("update")) {
			if (id > 0) {
				model.addAttribute("findModel", iContractService.selectOneById(id));
			} else {
				model.addAttribute("findModel", new ContractModel());
			}
			uri = "/admin/contract/form";
		}
		
		return uri;

	}
	
	@RequestMapping(value = "/detail={contractid}", method = RequestMethod.GET) // dung
	public String getDetail(@PathVariable("contractid") int contractid,Model model) {
			List<ContractDetailDTO> list = iContractDetailService.findByContractid(String.valueOf(contractid));
			model.addAttribute("findModel", list);
		return "redirect: /model/admin-contract/edit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST) // dung
	public String addModel(@ModelAttribute ("findModel") ContractModel contractModel ) {
		if (iContractService.selectOneById(contractModel.getId()) != null) {
			iContractService.update(contractModel);
			System.out.println("update "+contractModel.getId());
		}
		return "redirect: /model/admin-contract";
	}
}
