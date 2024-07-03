package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IReportDao;
import tp.kits3.comedians.model.ReportModel;

@Repository
public class ReportDao extends CommonDao<ReportModel> implements IReportDao {

	@Override
	public List<ReportModel> findAll() {
		return query("reportMapper", "selectAll");
	}

	@Override
	public ReportModel findSpendingByMonth(int month) {
		// TODO Auto-generated method stub
		return query("reportMapper", "selectSpendingByMonth", month).isEmpty()? null:query("reportMapper", "selectSpendingByMonth", month).get(0) ;
	}

	@Override
	public ReportModel findIncomeByMonth(int month) {
		// TODO Auto-generated method stub
		return query("reportMapper", "selectIncomeByMonth", month).isEmpty()? null:query("reportMapper", "selectIncomeByMonth", month).get(0) ;
	}

	@Override
	public void insert(ReportModel reportModel) {
		// TODO Auto-generated method stub
		query("reportMapper", "insert", reportModel);
		System.out.println("insert report complete!");
	}
}
