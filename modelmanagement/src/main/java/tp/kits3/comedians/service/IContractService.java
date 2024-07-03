/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.Date;
import java.util.List;

import tp.kits3.comedians.dto.ContractDTO;
import tp.kits3.comedians.model.ContractModel;

public interface IContractService {
	List<ContractModel> findAll();

	List<ContractDTO> findAllDTO();

	ContractDTO findById(int id);

	ContractModel selectOneById(int id);

	void insert(int accountid, String username);

	void update(ContractModel contractModel);

	void delete(List<Integer> ids);

	List<ContractDTO> findByCreatedate(Date date);

	List<ContractDTO> findByModefieddate(Date date);
}
