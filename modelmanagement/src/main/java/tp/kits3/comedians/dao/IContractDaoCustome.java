package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.dto.ContractDTO;

public interface IContractDaoCustome {
	List<ContractDTO> findAllDTO();
	ContractDTO findById(int id);
}
