package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IBookingDao;
import tp.kits3.comedians.model.BookingModel;

@Repository
public class BookingDao extends CommonDao<BookingModel> implements IBookingDao {

	@Override
	public List<BookingModel> findByModelId(int modelid) {
		return query("bookingMapper", "selectByModelId", modelid);
	}

	@Override
	public int insert(BookingModel booking) {
		int result = insert("bookingMapper", "insert", booking);
		result = booking.getId();
		return result;
	}

	@Override
	public List<BookingModel> findByModelAndAccount(int modelid, int accountid) {
		return query("bookingMapper", "selectByModelAndAccount", modelid, accountid);
	}

	@Override
	public void delete(int modelid, int accountid) {
		delete("bookingMapper", "delete", modelid, accountid);
	}

	@Override
	public List<BookingModel> findByAccountId(int accountid) {
		return query("bookingMapper", "selectByAccountId", accountid);
	}

	@Override
	public BookingModel findByModelAndAccountAndDate(int modelid, int accountid, int startdate, int startmonth,
			int startyear) {
		List<BookingModel> list = query("bookingMapper", "selectByModelAndAccountAndDate", modelid, accountid,startdate,startmonth,startyear);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void update(BookingModel booking) {
		update("bookingMapper", "update", booking);
	}

	@Override
	public void updateStatus(int modelid, int accountid) {
		updateField("bookingMapper", "updateStatus", modelid,accountid);
	}

}
