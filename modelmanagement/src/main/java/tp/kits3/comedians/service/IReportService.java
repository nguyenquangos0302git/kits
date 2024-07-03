/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.ReportDTO;
import tp.kits3.comedians.model.ReportModel;

public interface IReportService {
	
	List<ReportModel> findAll();
	
	ReportModel selectOne(int id);
	
	void insert(ReportModel reportModel);
	
	void update(ReportModel param);
	
	void delete(int id);
	
	ReportModel findSpendingByMonth(int month);
	
	ReportModel findIncomeByMonth(int month);
	
	ReportDTO reportWeek();
	
}
