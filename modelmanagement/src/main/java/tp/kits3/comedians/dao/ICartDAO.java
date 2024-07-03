/**
 * @author giang
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.CartModel;

public interface ICartDAO extends GenericDao<CartModel> {

	CartModel findOneByModelIdAndAccountId(int modelid, int accountid);
	
	List<CartModel> findOneByAccountId(int accountid);
	
	int countCartByAccountId(int accountId);
	
	void insert(CartModel cartModel);
	
	void update(CartModel cartModel);
	
	void delete(int modelid, int accountid);
}
