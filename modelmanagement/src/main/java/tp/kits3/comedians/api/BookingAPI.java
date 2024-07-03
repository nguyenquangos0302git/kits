package tp.kits3.comedians.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.BookingModel;
import tp.kits3.comedians.service.IBookingService;
import tp.kits3.comedians.utils.SessionUtil;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BookingAPI {

	@Autowired
	private IBookingService bookingService;
	
	@GetMapping("/api-model/model-detail/{id}")
	public Object getBookingFindByModelId(HttpServletRequest request, @PathVariable("id") int id) {
		List<BookingModel> list = null;
		try {
			list = bookingService.findByModelId(request, id);
			return new ResponseEntity<List<BookingModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/api-booking/booking/insert")
	public Object addBooking(HttpServletRequest request, @RequestBody List<BookingModel> booking) {
		try {
			AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
			bookingService.insert(booking, account.getUsername());
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
}
