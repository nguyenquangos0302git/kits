package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.dto.CartDTO;

public interface ICartCustomDAO extends GenericDao<CartDTO> {

	List<CartDTO> findAllByAccountId(int accountid);
	
}
