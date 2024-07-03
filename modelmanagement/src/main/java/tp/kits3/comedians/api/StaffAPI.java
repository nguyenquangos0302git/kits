package tp.kits3.comedians.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.service.IStaffService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class StaffAPI {

	@Autowired
	private IStaffService staffService;
	
	@GetMapping(value = "/api-admin/staff/idcard")
	public Object checkIdCard(@RequestParam(defaultValue = "null") String idcard) {
		int isStaff = 0;
		try {
			isStaff = staffService.findByIdCard(idcard);
			return new ResponseEntity<Integer>(isStaff, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			String status = "ERROR";
			return new ResponseEntity<>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
}
