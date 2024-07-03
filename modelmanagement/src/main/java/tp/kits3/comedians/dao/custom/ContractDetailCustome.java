/**
 * @author dung
 */
package tp.kits3.comedians.dao.custom;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContractDetailDaoCustome;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.ContractDetailDTO;
@Repository
public class ContractDetailCustome extends CommonDao<ContractDetailDTO> implements IContractDetailDaoCustome{

	@Override
	public List<ContractDetailDTO> findAll() {
		// TODO Auto-generated method stub
		return query("contractDetailMapper", "selectAllDTO");
	}

	@Override
	public List<Integer> findAllIdContract() {
		// TODO Auto-generated method stub
		return queryInt("contractDetailMapper", "selectAllIdContract");
	}

	@Override
	public List<ContractDetailDTO> findByContractid(String name) {
		// TODO Auto-generated method stub
		return query("contractDetailMapper", "selectByContractid", name);
	}

	@Override
	public List<ContractDetailDTO> findAllByContractid(int contractid) {
		return query("contractDetailMapper", "selectAllByContractId", contractid);
	}
	
}
