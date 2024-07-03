/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.CartDTO;
import tp.kits3.comedians.model.CartModel;

public interface ICartService {
	List<CartModel> findAll();

	CartModel findById(int id);
	
	List<CartDTO> findAllByAccountId(int accountid);
	
	int countCartByAccountId(int accountId);

	boolean insert(CartModel cartModel, String username, int accountid);

	void update(CartModel cartModel, String username);

	void delete(int modelid, int accountid);
}
