/**
 * @author dung
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContractDetailDao;
import tp.kits3.comedians.model.ContractDetailModel;
@Repository
public class ContractDetailDao extends CommonDao<ContractDetailModel> implements IContractDetailDao {

	@Override
	public List<ContractDetailModel> findAll() {
		// TODO Auto-generated method stub
		return query("contractDetailMapper", "selectAll");
	}

	@Override
	public ContractDetailModel findById(int id) {
		// TODO Auto-generated method stub
		List<ContractDetailModel> model = query("contractDetailMapper", "selectById", id);
		return model.isEmpty()? null: model.get(0) ;
	}

	@Override
	public void insert(ContractDetailModel contractDetailModel) {
		// TODO Auto-generated method stub
		insert("contractDetailMapper", "insert", contractDetailModel);
	}

	@Override
	public void update(ContractDetailModel contractDetailModel) {
		query("contractDetailMapper", "update", contractDetailModel);
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		query("contractDetailMapper", "delete", ids);
	}

	@Override
	public void insertList(List<ContractDetailModel> contractDetailModel) {
		
		insertList("contractDetailMapper", "insertList", contractDetailModel);
	}
	
}
