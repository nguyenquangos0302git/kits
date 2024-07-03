/**
 * @author loi, minh
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IContact;
import tp.kits3.comedians.model.ContactModel;

@Repository
public class ContactDao extends CommonDao<ContactModel> implements IContact {

	@Override
	public List<ContactModel> findAll() {
		return query("contactMapper", "selectAll");
	}

	@Override
	public int insert(ContactModel contact) {
		int result = insert("contactMapper", "insert", contact);

		return result;
	}

	@Override
	public List<ContactModel> findAllByName(String name) {
		return query("contactMapper", "selectAllByName", name);
	}

	@Override
	public ContactModel findById(ContactModel contact) {
		List<ContactModel> list = query("contactMapper", "selectById", contact);
		return list.isEmpty() ? null : list.get(0);
		
	}

	@Override
	public void delete(List<Integer> id) {
		// TODO Auto-generated method stub
		delete("contactMapper", "delete", id);
	}

}
