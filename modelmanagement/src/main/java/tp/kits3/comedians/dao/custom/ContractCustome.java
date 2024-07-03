/**
 * @author dung
 */
package tp.kits3.comedians.dao.custom;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContractDaoCustome;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.ContractDTO;
@Repository
public class ContractCustome extends CommonDao<ContractDTO> implements IContractDaoCustome {

	@Override
	public List<ContractDTO> findAllDTO() {
		// TODO Auto-generated method stub
		return query("contractMapper", "selectAllDTO");
	}

	@Override
	public ContractDTO findById(int id) {
		// TODO Auto-generated method stub
		return query("contractMapper", "selectOneDTOById", id).isEmpty()? null:query("contractMapper", "selectOneDTOById", id).get(0) ;
	}

}
