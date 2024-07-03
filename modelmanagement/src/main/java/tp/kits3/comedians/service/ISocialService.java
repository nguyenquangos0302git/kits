/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.SocialModel;

public interface ISocialService {
	List<SocialModel> findAll();
	SocialModel selectOne(int id);
	void insert(SocialModel param);
	void update(SocialModel param);
	void delete(int id);
}
