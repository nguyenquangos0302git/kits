package tp.kits3.comedians.dao.custom;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContractDetailDaoCustom;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.ContractDetailDTO;
@Repository
public class ContractDetailCustom extends CommonDao<ContractDetailDTO> implements IContractDetailDaoCustom{

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
	
}
