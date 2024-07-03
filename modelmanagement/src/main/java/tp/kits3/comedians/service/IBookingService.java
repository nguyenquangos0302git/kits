package tp.kits3.comedians.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import tp.kits3.comedians.model.BookingModel;

public interface IBookingService {

	List<BookingModel> findByModelId(HttpServletRequest request, int modelid);
	
	void insert(List<BookingModel> booking, String username);
	
	void delete(int modelid, int accountid);
}
