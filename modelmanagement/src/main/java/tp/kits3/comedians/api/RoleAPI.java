package tp.kits3.comedians.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.model.RoleModel;
import tp.kits3.comedians.service.IRoleService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class RoleAPI {
	
	@Autowired
	private IRoleService roleService;
	
	@GetMapping("/api-admin/role/findall")
	public Object getAllRole(@RequestParam(defaultValue = "id") String field, @RequestParam(defaultValue = "ASC") String direction) {
		try {
			List<RoleModel> list = roleService.findAllAndSort(field, direction);
			return new ResponseEntity<List<RoleModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
}
