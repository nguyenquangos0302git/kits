/**
 * @author giang
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ICartDAO;
import tp.kits3.comedians.model.CartModel;

@Repository
public class CartDAO extends CommonDao<CartModel> implements ICartDAO {

	@Override
	public void insert(CartModel cartModel) {
		insert("cartMapper", "insert", cartModel);
	}

	@Override
	public void update(CartModel cartModel) {
		update("cartMapper", "update", cartModel);
	}

	@Override
	public void delete(int modelid, int accountid) {
		delete("cartMapper", "delete", modelid, accountid);
	}

	@Override
	public int countCartByAccountId(int accountId) {
		return count("cartMapper", "countCartByAccountId", accountId);
	}

	@Override
	public CartModel findOneByModelIdAndAccountId(int modelid, int accountid) {
		List<CartModel> list = query("cartMapper", "selectOneByModelId", modelid, accountid);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<CartModel> findOneByAccountId(int accountid) {
		return query("cartMapper", "selectOneByAccountId", accountid);
	}

}
