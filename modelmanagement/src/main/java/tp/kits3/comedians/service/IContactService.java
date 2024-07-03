/**
 * @author dung, minh
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.ContactModel;

public interface IContactService {
	List<ContactModel> findAll();
	
	List<ContactModel> findAllByName(String name);

	int insert(ContactModel contact);
	
	void delete(List<Integer> id);

	ContactModel selectOne(int id);
	
}
