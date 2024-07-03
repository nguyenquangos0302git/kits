/**
 * @author loi, minh
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.ContactModel;

public interface IContact extends GenericDao<ContactModel> {
	
	List<ContactModel> findAll();
	
	int insert(ContactModel contact);

	List<ContactModel> findAllByName(String name);
	
	ContactModel findById(ContactModel contact);

	void delete(List<Integer> id);
}
