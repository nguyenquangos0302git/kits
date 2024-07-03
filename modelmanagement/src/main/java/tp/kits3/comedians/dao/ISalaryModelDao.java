package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.SalaryModelModel;

public interface ISalaryModelDao {
	int insertSalaryEveryMonth(SalaryModelModel param);
	SalaryModelModel findSalaryByModelid(int id);
	void delete(List<Integer> ids);
	List<SalaryModelModel> findByModelid(int id);
	void update(SalaryModelModel salaryModelModel);
}
