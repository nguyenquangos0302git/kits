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
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.dto.ModelSearchAndLimitRequestDTO;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.service.IModelService;
@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/model")
public class ModelAPI {
	@Autowired
	private IModelService modelService;
	
	@PostMapping("/remove")
	public Object deleteModel(@RequestBody CommonDTO ids) {
		String status = "";
		try {
			for(int id : ids.getIds()) {
				ModelModel modelModel = modelService.findById(id);
				modelModel.setStatus(0);
				modelService.update(modelModel);
			}
			status = "OK";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			status = "ERROR";
			return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/search")
	public ResponseEntity<List<ModelDTO>> search(@RequestBody ModelDTO modelDTO){
		modelDTO.setName("%" + modelDTO.getName() + "%");
		try {
			List<ModelDTO> list = modelService.searchShowAllAdmin(modelDTO.getName());
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getCreatedby()==null) list.get(i).setCreatedby("");
				if(list.get(i).getModifiedby()==null) list.get(i).setModifiedby("");
			}
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("/findall")
	public Object findAll() {
		List<ModelDTO> list = null;
		try {
			list = modelService.findAllModel();
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findallmodelandlimitandoffset")
	public Object findAndLimitAndOffset(@RequestParam(defaultValue = "0") int limit, @RequestParam(defaultValue = "10") int offset) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findAllModel(limit, offset);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/male")
	public Object findAllMale() {
		List<ModelDTO> list = null;
		try {
			list = modelService.findMales();
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/malemodelandlimitandoffset")
	public Object findMaleAndLimitAndOffset(@RequestParam(defaultValue = "0") int limit, @RequestParam(defaultValue = "10") int offset) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findMales(limit, offset);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/female")
	public Object findAllFemale() {
		List<ModelDTO> list = null;
		try {
			list = modelService.findFemales();
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/femalemodelandlimitandoffset")
	public Object findFemaleAndLimitAndOffset(@RequestParam(defaultValue = "0") int limit, @RequestParam(defaultValue = "10") int offset) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findFemales(limit, offset);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/newface")
	public Object findAllNewFace() {
		List<ModelDTO> list = null;
		try {
			list = modelService.findNewFace();
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/newfacemodelandlimitandoffset")
	public Object findNewFaceAndLimitAndOffset(@RequestParam(defaultValue = "0") int limit, @RequestParam(defaultValue = "10") int offset) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findNewFace(limit, offset);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/kids")
	public Object findAllKids() {
		List<ModelDTO> list = null;
		try {
			list = modelService.findKids();
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@GetMapping("/findall/kidsmodelandlimitandoffset")
	public Object findKidsAndLimitAndOffset(@RequestParam(defaultValue = "0") int limit, @RequestParam(defaultValue = "10") int offset) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findKids(limit, offset);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@PostMapping("/findallandsearchandlimit")
	public Object findAllAndSearchAndLimit(@RequestBody ModelSearchAndLimitRequestDTO model) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findAllModelAndLimit(model);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
	
	@PostMapping("/findallandsearchnotlimit")
	public Object findAllAndSearch(@RequestBody ModelSearchAndLimitRequestDTO model) {
		List<ModelDTO> list = null;
		try {
			list = modelService.findAllModelNotLimit(model);
			return new ResponseEntity<List<ModelDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return new ResponseEntity<List<ModelDTO>>(HttpStatus.BAD_GATEWAY);
		}	
	}
}
