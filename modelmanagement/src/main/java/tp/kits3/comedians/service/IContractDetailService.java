/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.ContractDetailDTO;
import tp.kits3.comedians.model.ContractDetailModel;

public interface IContractDetailService {
	List<ContractDetailModel> findAll();
	ContractDetailModel findById(int id);
	List<ContractDetailDTO> findAllDTO();
	List<ContractDetailDTO> findByContractid(String id);
	List<ContractDetailDTO> findAllByContractid(int contractid);
	void insert(ContractDetailModel param);
	void update(ContractDetailModel param);
	void delete(List<Integer> ids);
}
