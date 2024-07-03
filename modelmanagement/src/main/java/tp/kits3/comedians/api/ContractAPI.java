/**
 * @author dung
 */
package tp.kits3.comedians.api;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.dto.CommonDTO;
import tp.kits3.comedians.dto.ContractDTO;
import tp.kits3.comedians.dto.ContractDetailDTO;
import tp.kits3.comedians.model.ContractModel;
import tp.kits3.comedians.service.IContractDetailService;
import tp.kits3.comedians.service.IContractService;
import tp.kits3.comedians.utils.SessionUtil;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/contract")
public class ContractAPI {
	
	@Autowired
	IContractService iContractService;
	@Autowired
	IContractDetailService iContractDetailService;
	
	
	@PostMapping("/active")
	public Object activeModel(@RequestBody ContractDTO contractDTO, HttpServletRequest req) {
		try {
			AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
			ContractModel contractModel = iContractService.selectOneById(contractDTO.getId());
			if(contractModel.getStatus()==0) {
				contractModel.setModifiedby(account.getUsername());
				contractModel.setStatus(1);
				iContractService.update(contractModel);
				List<ContractDTO> list = iContractService.findAllDTO();
				return new ResponseEntity<List<ContractDTO>>(list, HttpStatus.OK);
			}else {
				return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
			}
		} catch (Exception e) {
			return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/search")
	public Object deleteModel(@RequestBody ContractDTO contractDTO) {
		try {
			if(!contractDTO.getStatusName().equals("")){
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				if(contractDTO.getStatusName().equals("modifieddate")) {
					List<ContractDTO> list = iContractService.findByModefieddate(formatter.parse(contractDTO.getDescription()));
					return new ResponseEntity<List<ContractDTO>>(list, HttpStatus.OK);
				}else {
					List<ContractDTO> list = iContractService.findByCreatedate(formatter.parse(contractDTO.getDescription()));
					return new ResponseEntity<List<ContractDTO>>(list, HttpStatus.OK);
				}
			}else {
				return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
			}
		} catch (Exception e) {
			return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/edit")
	public Object editContract(@RequestBody ContractDetailDTO contractDetailDTO) {
		if(contractDetailDTO.getContractid() == 0) {
			List<ContractDetailDTO> list = iContractDetailService.findAllDTO();
			return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
		}else {
			try {
				String idName = String.valueOf(contractDetailDTO.getContractid());
				List<ContractDetailDTO> list = iContractDetailService.findByContractid(idName);
				return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<List<ContractDetailDTO>>(HttpStatus.BAD_GATEWAY);
			}
		}
	}
	
	@PostMapping("/delete")
	public Object delete(@RequestBody CommonDTO ids) {
		try {
			if(ids.getIds().size()>0) {
				iContractService.delete(ids.getIds());
				List<ContractDTO> list = iContractService.findAllDTO();
				return new ResponseEntity<List<ContractDTO>>(list, HttpStatus.OK);
			}else {
				return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<List<ContractDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	
	@PostMapping("/add")
	public Object addContract(int accountid, String username) {
		try {
			iContractService.insert(accountid, username);
			return new ResponseEntity<>(HttpStatus.OK);	
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
}
