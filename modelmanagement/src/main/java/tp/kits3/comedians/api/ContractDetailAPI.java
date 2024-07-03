/**
   * @author dung
 */
package tp.kits3.comedians.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.CommonDTO;
import tp.kits3.comedians.dto.ContractDetailDTO;
import tp.kits3.comedians.model.ContractDetailModel;
import tp.kits3.comedians.service.IContractDetailService;
import tp.kits3.comedians.service.IContractService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/contract-detail")
public class ContractDetailAPI {
	@Autowired
	private IContractDetailService iContractDetailService;
	@Autowired
	IContractService iContractService;
	
	@PostMapping("/remove")
	public Object deleteModel(@RequestBody CommonDTO ids) {
		String status = "ERROR";
		try {
			if(ids.getIds().size()>0) {
				iContractDetailService.delete(ids.getIds());
				status = "OK";
				return new ResponseEntity<String>(status, HttpStatus.OK);
			}else {
				return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/search")
	public ResponseEntity<List<ContractDetailDTO>> search(@RequestBody ContractDetailDTO contractDetailDTO){
		if(contractDetailDTO.getContractid() == 0) {
			List<ContractDetailDTO> list = iContractDetailService.findAllDTO();
			return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
		}else {
			try {
				String idName = "%"+String.valueOf(contractDetailDTO.getContractid())+"%";
				List<ContractDetailDTO> list = iContractDetailService.findByContractid(idName);
				return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<List<ContractDetailDTO>>(HttpStatus.BAD_GATEWAY);
			}
		}
	}
	
	@GetMapping("/search")
	public Object getDetail(@RequestParam(value = "contractid", required = false) int contractid) {
		try {
			List<ContractDetailDTO> list = iContractDetailService.findAllByContractid(contractid);
			return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/delete")
	public Object deleteDetail(@RequestBody CommonDTO ids) {
		try {
			if(ids.getIds().size()>0) {
				iContractDetailService.delete(ids.getIds());
				List<ContractDetailDTO> list = iContractDetailService.findAllByContractid(iContractDetailService.findById(ids.getIds().get(0)).getContractid());
				return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
			}else {
				return new ResponseEntity<List<ContractDetailDTO>>(HttpStatus.BAD_GATEWAY);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<List<ContractDetailDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/update")
	public Object updateDetail(@RequestBody ContractDetailModel contractDetailModel) {
		try {
			if(contractDetailModel.getId()>0) {
				iContractDetailService.update(contractDetailModel);
			}
			List<ContractDetailDTO> list = iContractDetailService.findAllDTO();
			return new ResponseEntity<List<ContractDetailDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<List<ContractDetailDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
}
