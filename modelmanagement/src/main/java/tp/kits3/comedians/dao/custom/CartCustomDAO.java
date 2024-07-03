package tp.kits3.comedians.dao.custom;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ICartCustomDAO;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.CartDTO;

@Repository
public class CartCustomDAO extends CommonDao<CartDTO> implements ICartCustomDAO {

	@Override
	public List<CartDTO> findAllByAccountId(int accountid) {
		return query("cartMapper", "selectAllByAccountId", accountid);
	}

}
