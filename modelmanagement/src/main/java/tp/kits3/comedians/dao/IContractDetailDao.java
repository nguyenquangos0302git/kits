/**
 * @author dung
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.ContractDetailModel;

public interface IContractDetailDao extends GenericDao<ContractDetailModel> {
	List<ContractDetailModel> findAll();

	ContractDetailModel findById(int id);

	void insert(ContractDetailModel contractDetailModel);

	void insertList(List<ContractDetailModel> contractDetailModel);

	void update(ContractDetailModel contractDetailModel);

	void delete(List<Integer> ids);
}
