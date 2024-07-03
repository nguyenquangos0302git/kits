/**
 * @author dung, minh
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.impl.ContactDao;
import tp.kits3.comedians.model.ContactModel;
import tp.kits3.comedians.service.IContactService;

@Service
public class ContactService implements IContactService {
	
	@Autowired
	private ContactDao contactDao;

	@Override
	public List<ContactModel> findAll() {
		return contactDao.findAll();
	}

	@Override
	public int insert(ContactModel contact) {
		
		return contactDao.insert(contact);
		
	}

	@Override
	public List<ContactModel> findAllByName(String name) {
		return contactDao.findAllByName(name);
	}

	@Override
	public void delete(List<Integer> id) {
		
		contactDao.delete(id);
	}
	
	@Override
	public ContactModel selectOne(int id) {
		ContactModel contact = new ContactModel();
		contact.setId(id);
		return contactDao.findById(contact);
	}

}
