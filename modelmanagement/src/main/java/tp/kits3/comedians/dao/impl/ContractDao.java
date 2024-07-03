/**
 * @author dung
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContractDao;
import tp.kits3.comedians.model.ContractModel;
@Repository
public class ContractDao extends CommonDao<ContractModel> implements IContractDao{

	@Override
	public List<ContractModel> findAll() {
		// TODO Auto-generated method stub
		return query("contractMapper", "selectAll");
	}

	@Override
	public int insert(ContractModel contractModel) {
		insert("contractMapper", "insert", contractModel);
		return contractModel.getId();
	}

	@Override
	public void update(ContractModel contractModel) {
		// TODO Auto-generated method stub
		query("contractMapper", "update", contractModel);
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		query("contractMapper", "delete", ids);
	}

	@Override
	public ContractModel findOneById(int id) {
		// TODO Auto-generated method stub
		return query("contractMapper", "selectById", id).isEmpty()? null: query("contractMapper", "selectById", id).get(0) ;
	}

	@Override
	public void updatePrice(int contractid) {
		updateField("contractMapper", "updatePrice", contractid);
	}

	@Override
	public int findContractIdByAccountIdAndModelId(int accountid, int modelid) {
		List<Integer> list = queryInt("contractMapper", "selectContractIdByAccountIdAndModelId", accountid, modelid);
		return list.isEmpty() ? 0 : list.get(0);
	}

}
