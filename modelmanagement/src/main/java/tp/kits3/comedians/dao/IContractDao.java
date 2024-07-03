package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.ContractModel;

public interface IContractDao {
	List<ContractModel> findAll();

	ContractModel findOneById(int id);
	
	int findContractIdByAccountIdAndModelId(int accountid, int modelid);

	int insert(ContractModel contractModel);

	void update(ContractModel contractModel);
	
	void updatePrice(int contractid);

	void delete(List<Integer> ids);
}
