package tp.kits3.comedians.config;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.dao.ISalaryStaffDao;
import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.dto.AccountStaffSalaryRoleDTO;
import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.model.ReportModel;
import tp.kits3.comedians.model.RoleModel;
import tp.kits3.comedians.model.SalaryModelModel;
import tp.kits3.comedians.model.SalaryStaffModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.service.IAccountUserRoleAccountRoleService;
import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.IReportService;
import tp.kits3.comedians.service.ISalaryModelService;
import tp.kits3.comedians.utils.ConvertNumberDayUtil;
import tp.kits3.comedians.utils.GetTimeNowUtil;

@Configuration
@EnableScheduling
public class UpdateSalarySchedule {

	@Autowired
	private IAccountUserRoleAccountRoleService accountUserRoleAccount;

	@Autowired
	private IAccountDao accountDao;

	@Autowired
	private ISalaryStaffDao salaryStaffDao;

	@Autowired
	private IRoleDao roleDao;

	@Autowired
	private IStaffDao staffDao;

	@Autowired
	private ISalaryModelService iSalaryModelService;

	@Autowired
	private IModelService iModelService;
	
	@Autowired
	private IReportService iReportService;

	@Scheduled(cron="0 0 0 1 * ?")
	//@Scheduled(cron = "* * * * * ?")
	public void scheduleUpdateSalary() {

		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		//salary model
		List<ModelModel> listModel = iModelService.findAll();
		SalaryModelModel salaryModel = new SalaryModelModel();
		for (ModelModel model : listModel) {
			salaryModel.setModelid(model.getId());
			salaryModel.setSalary(iSalaryModelService.findSalaryByModelId(model.getId()).getSalary());
			salaryModel.setMonth(month);
			salaryModel.setYear(year);
			iSalaryModelService.insert(salaryModel);
		}
		
		//salary staff
		double salary = 0;

		System.out.println("up");

		List<AccountUserRoleDTO> list = accountUserRoleAccount.findAll();

		for (AccountUserRoleDTO listAccount : list) {
			AccountStaffSalaryRoleDTO accountStaffSalaryRole = new AccountStaffSalaryRoleDTO();
			StaffModel staff = new StaffModel();
			staff = staffDao.findOneByAccountId(listAccount.getId());
			if (staff != null && listAccount.getStatus() > 2) {
				SalaryStaffModel salaryStaff = new SalaryStaffModel();
				accountStaffSalaryRole.setRoles(roleDao.getRolesName(listAccount.getId()));
				List<RoleModel> listRole = roleDao.findAll();

				List<String> lists = accountStaffSalaryRole.getRoles();
				for (String l : lists) {
					for (RoleModel lr : listRole) {
						if (l.equalsIgnoreCase(lr.getName())) {
							salary = salary + lr.getSalary();
						}
					}
				}

				int numberOfDayWork = ConvertNumberDayUtil.covertDay(listAccount.getCreatedate());

				Date createdata = GetTimeNowUtil.getTimeNow();
				String note = "UP SALARY";
				Date modifieddate = GetTimeNowUtil.getTimeNow();

				accountDao.updateCreateAccountToSetSalary(note, createdata, "SYSTEM", modifieddate,
						listAccount.getId());

				accountStaffSalaryRole.setSalary(numberOfDayWork * salary * staff.getCoefficients_salary());

				salaryStaff.setAccountid(listAccount.getId());
				salaryStaff.setMonth(month);
				salaryStaff.setSalary(accountStaffSalaryRole.getSalary());
				salaryStaff.setYear(year);
				salaryStaffDao.insertSalaryEveryMonth(salaryStaff);
				System.out.println(month);
				System.out.println(year);

			}
		}
		//report
		ReportModel reportModel = new ReportModel();
		reportModel.setSpending(iReportService.findSpendingByMonth(month).getSpending());
		reportModel.setIncome(iReportService.findIncomeByMonth(month).getIncome());
		reportModel.setProfit(reportModel.getIncome()-reportModel.getSpending());
		reportModel.setMonth(month);
		reportModel.setYear(year);
		iReportService.insert(reportModel);

	}

//	//@Scheduled(cron = "0 0 0 1 * ?")
//	@Scheduled(cron="* * * * * ?")
//	public void modelUpdateSalary() {
//		List<ModelModel> listModel = iModelService.findAll();
//		SalaryModelModel salaryModel = new SalaryModelModel();
//		for (ModelModel model : listModel) {
//			Calendar cal = Calendar.getInstance();
//			int month = cal.get(Calendar.MONTH) + 1;
//			int year = cal.get(Calendar.YEAR);
//			salaryModel.setModelid(model.getId());
//			salaryModel.setSalary(iSalaryModelService.findSalaryByModelId(model.getId()).getSalary());
//			salaryModel.setMonth(month);
//			salaryModel.setYear(year);
//			iSalaryModelService.insert(salaryModel);
//		}
//	}
	
	//@Scheduled(cron = "0 0 0 1 * ?")
//	@Scheduled(cron="* * * * * ?")
//	public void report() {
//		Calendar cal = Calendar.getInstance();
//		int month = cal.get(Calendar.MONTH) + 1;
//		int year = cal.get(Calendar.YEAR);
//		ReportModel reportModel = new ReportModel();
//		reportModel.setSpending(iReportService.findSpendingByMonth(month).getSpending());
//		reportModel.setIncome(iReportService.findIncomeByMonth(month).getIncome());
//		reportModel.setProfit(reportModel.getIncome()-reportModel.getSpending());
//		reportModel.setMonth(month);
//		reportModel.setYear(year);
//		iReportService.insert(reportModel);
//	}

}
