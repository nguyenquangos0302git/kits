/**
 * @author dung
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.dto.ContractDetailDTO;

public interface IContractDetailDaoCustome extends GenericDao<ContractDetailDTO> {
	List<ContractDetailDTO> findAll();
	List<Integer> findAllIdContract();
	List<ContractDetailDTO> findByContractid(String name);
	List<ContractDetailDTO> findAllByContractid(int contractid);
}
