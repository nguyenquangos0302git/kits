/**
 * @author dung
 */
package tp.kits3.comedians.dao.custom;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IReportCustomDao;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.ReportDTO;
@Repository
public class ReportCustomDAO extends CommonDao<ReportDTO> implements IReportCustomDao {

	@Override
	public ReportDTO reportWeek() {
		// TODO Auto-generated method stub
		return query("reportMapper", "week").isEmpty()? null :query("reportMapper", "week").get(0) ;
	}

	@Override
	public ReportDTO reportBeforeWeek() {
		// TODO Auto-generated method stub
		return query("reportMapper", "beforeWeek").isEmpty()? null :query("reportMapper", "beforeWeek").get(0) ;
	}

}
