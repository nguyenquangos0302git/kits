/**
 * @author dung
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IReportCustomDao;
import tp.kits3.comedians.dao.IReportDao;
import tp.kits3.comedians.dto.ReportDTO;
import tp.kits3.comedians.model.ReportModel;
import tp.kits3.comedians.service.IReportService;

@Service
public class ReportService implements IReportService {

	@Autowired
	private IReportDao reportDao;
	
	@Autowired
	private IReportCustomDao reportCustomDao;
	
	@Override
	public List<ReportModel> findAll() {
		return reportDao.findAll();
	}

	@Override
	public ReportModel selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(ReportModel reportModel) {
		// TODO Auto-generated method stub
		reportDao.insert(reportModel);
	}

	@Override
	public void update(ReportModel param) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReportModel findSpendingByMonth(int month) {
		// TODO Auto-generated method stub
		return reportDao.findSpendingByMonth(month);
	}

	@Override
	public ReportModel findIncomeByMonth(int month) {
		// TODO Auto-generated method stub
		return reportDao.findIncomeByMonth(month);
	}

	@Override
	public ReportDTO reportWeek() {
		// TODO Auto-generated method stub
		ReportDTO week = reportCustomDao.reportWeek();
		ReportDTO befor = reportCustomDao.reportBeforeWeek();
		ReportDTO report = new ReportDTO();
		report.setWeekOrders(week.getWeekOrders());
		report.setWeekSales(week.getWeekSales());
		report.setBeforeWeekOrders(befor.getBeforeWeekOrders());
		report.setBeforeWeekSales(befor.getBeforeWeekSales());
		if(report.getBeforeWeekOrders()!=0) {
			report.setCompareOrders(Math.round((report.getWeekOrders()-report.getBeforeWeekOrders())*10000/report.getBeforeWeekOrders())/100d);
		}if(report.getBeforeWeekSales()!=0){
			report.setCompareSales(Math.round((report.getWeekSales()-report.getBeforeWeekSales())*10000/report.getBeforeWeekSales())/100d);
		}
		return report;
	}

}
