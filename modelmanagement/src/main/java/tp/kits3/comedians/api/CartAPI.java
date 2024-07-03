/**
 * @author giang
 */
package tp.kits3.comedians.api;

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
import tp.kits3.comedians.model.CartModel;
import tp.kits3.comedians.service.IBookingService;
import tp.kits3.comedians.service.ICartService;
import tp.kits3.comedians.utils.SessionUtil;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin")
public class CartAPI {

	@Autowired
	private ICartService cartService;
	
	@Autowired
	private IBookingService bookingService;
	
	@PostMapping("/cart/add")
	public Object addCart(@RequestBody CartModel cartModel, HttpServletRequest req) {
		try {
			AccountUserRoleDTO user = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
			if(cartService.insert(cartModel, user.getUsername(), user.getId())){
				return new ResponseEntity<Boolean>(true, HttpStatus.OK);
			}else {
				return new ResponseEntity<Boolean>(false, HttpStatus.OK);
			}
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(false, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/cart/delete")
	public Object deleteCart(@RequestBody CartModel cartModel, HttpServletRequest req) {
		try {
			cartService.delete(cartModel.getModelid(), cartModel.getAccountid());
			bookingService.delete(cartModel.getModelid(), cartModel.getAccountid());
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(false, HttpStatus.BAD_GATEWAY);
		}
	}
}
