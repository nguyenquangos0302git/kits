package tp.kits3.comedians.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.dto.TokenDTO;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.service.impl.JwtService;

@RestController
@RequestMapping("/api")
public class UserRestController {

	@Autowired
	private JwtService jwtService;

	@Autowired
	private IAccountService accountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<String> login(@RequestBody AccountUserRoleDTO user) {
		String result = "";
		boolean remember = user.isRemember();
		HttpStatus httpStatus = null;
		try {
			if (accountService.login(user)) {
				if(remember) {
					TokenDTO userDTO = new TokenDTO(user.getId(), user.getUsername(), user.getUserId());
					result = jwtService.generateTokenLogin(userDTO);
				}
				httpStatus = HttpStatus.OK;
			} else {
				result = "Wrong userId and password";
				httpStatus = HttpStatus.BAD_REQUEST;
			}
		} catch (Exception ex) {
			result = "Server Error";
			httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<String>(result, httpStatus);
	}
}
