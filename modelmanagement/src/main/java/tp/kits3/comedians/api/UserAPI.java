package tp.kits3.comedians.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.IUserService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UserAPI {

	@Autowired
	private IUserService userService;
	
	@GetMapping(value = "/api-admin/user/idcard")
	public Object checkIdCard(@RequestParam(defaultValue = "null") String idcard) {
		int isUser = 0;
		try {
			isUser = userService.findByIdCard(idcard);
			return new ResponseEntity<Integer>(isUser, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			String status = "ERROR";
			return new ResponseEntity<>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping(value = "/api-admin/user/edit")
	public Object editProfile(@RequestBody UserModel user, HttpServletRequest request) {
		try {
			userService.update(request,user);
			return new ResponseEntity<UserModel>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<UserModel>(HttpStatus.BAD_GATEWAY);
		}
	}
	
}
