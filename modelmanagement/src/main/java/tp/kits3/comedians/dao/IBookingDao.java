package tp.kits3.comedians.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.model.BookingModel;

@Repository
public interface IBookingDao extends GenericDao<BookingModel> {

	List<BookingModel> findByModelId(int modelid);
	
	List<BookingModel> findByAccountId(int accountid);
	
	List<BookingModel> findByModelAndAccount(int modelid, int accountid);
	
	BookingModel findByModelAndAccountAndDate(int modelid, int accountid, int startdate, int startmonth, int startyear);
	
	int insert(BookingModel booking);
	
	void update(BookingModel booking);
	
	void updateStatus(int modelid, int accountid);
	
	void delete(int modelid, int accountid);
	
}
