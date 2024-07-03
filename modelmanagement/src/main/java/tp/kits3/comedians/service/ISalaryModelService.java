package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.SalaryModelModel;

public interface ISalaryModelService {
	List<SalaryModelModel> findAll();
	SalaryModelModel findSalaryByModelId(int id);
	void insert(SalaryModelModel salaryModelModel);
	void delete(List<Integer> ids);
	List<SalaryModelModel> findByModelid(int id);
	void update(SalaryModelModel salaryModelModel);
}
