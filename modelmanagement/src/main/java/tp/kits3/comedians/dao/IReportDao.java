package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.ReportModel;

public interface IReportDao extends GenericDao<ReportModel> {

	List<ReportModel> findAll();
	ReportModel findSpendingByMonth(int month);
	ReportModel findIncomeByMonth(int month);
	void insert(ReportModel reportModel);
}
