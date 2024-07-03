package tp.kits3.comedians.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.CommonDTO;
import tp.kits3.comedians.service.IContactService;


@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/contact")
public class ContactAPI {
	@Autowired
	private IContactService contactService;
	
	@PostMapping("/delete")
	public Object deleteContact(@RequestBody CommonDTO ids) {
		String status = "";
		try {
			contactService.delete(ids.getIds());
			status = "OK";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			status = "ERROR";
			return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
		}
	}
}
