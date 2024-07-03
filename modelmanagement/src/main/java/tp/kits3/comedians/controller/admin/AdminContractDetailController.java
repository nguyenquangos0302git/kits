/**
 * @author dung
 */
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
import tp.kits3.comedians.model.ContractDetailModel;
import tp.kits3.comedians.service.IContractDetailService;
import tp.kits3.comedians.service.IContractService;
import tp.kits3.comedians.service.IModelService;

@Controller
@RequestMapping("/admin-contract-detail")
public class AdminContractDetailController {
	
	@Autowired
	private IContractDetailService iContractDetailService;
	@Autowired
	private IModelService iModelService;
	@Autowired
	private IContractService iContractService;
	@RequestMapping(value="" , method = RequestMethod.GET)
	public String getContractDetail(Model model) {
		model.addAttribute("allListDTO", iContractDetailService.findAllDTO());
		return "/admin/contractdetail/list";
	}
	@RequestMapping(value = "/{rq}={id}", method = RequestMethod.GET) // dung
	public String update(@PathVariable("rq") String rq, @PathVariable("id") int id, Model model) {
		String uri = "";
		if(rq.equals("search")) {
			String idName = String.valueOf(id);
			model.addAttribute("allListDTO", iContractDetailService.findByContractid(idName));
			uri = "/admin/contract/edit";
		}if (rq.equals("delete")) {
			List<Integer> ids = new ArrayList<Integer>();
			ids.add(id);
			int contractid = iContractDetailService.findById(id).getContractid();
			iContractDetailService.delete(ids);
			uri="redirect: /model/admin-contract-detail/search="+contractid;
		} else if (rq.equals("update")) {
			if (id > 0) {
				model.addAttribute("findModel", iContractDetailService.findById(id));
				model.addAttribute("allContract", iContractService.findAll());
				model.addAttribute("allModel", iModelService.findAll());
			} else {
				model.addAttribute("findModel", new ContractDetailModel());
				model.addAttribute("allContract", iContractService.findAll());
				model.addAttribute("allModel", iModelService.findAll());
			}
			uri = "/admin/contractdetail/form";
		}
		
		return uri;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST) // dung
	public String addModel(@ModelAttribute ("findModel") ContractDetailModel contractDetail ) {
		String uri="";
		if (iContractDetailService.findById(contractDetail.getId()) != null) {
			iContractDetailService.update(contractDetail);
			System.out.println("update "+contractDetail.getId());
			uri="redirect: /model/admin-contract-detail/search="+contractDetail.getContractid();
		} else {
			iContractDetailService.insert(contractDetail);
			System.out.println("insert ContractDetailModel complete!");
			uri="redirect: /model/admin-contract-detail/search="+contractDetail.getContractid();
		}
		return uri;
	}
}
