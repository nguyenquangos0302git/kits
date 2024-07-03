/**
 * @author all
 */
package tp.kits3.comedians.dao;

import java.util.List;

public interface GenericDao<T> {

	List<T> query(String mapper, String sql,Object... parameters);
	
	List<String> queryString(String mapper, String sql,Object... parameters);

	int insert(String mapper, String sql, T model);
	
	int insertList(String mapper, String sql, Object... parameters);

	int update(String mapper, String sql, T model);
	
	int updateField(String mapper, String sql,Object... parameters);

	void delete(String mapper, String sql, Object... parameters);
	
	int count(String mapper, String sql, Object... parameters);

	List<Integer> queryInt(String mapper, String sql, Object... parameters);
	
	List<Double> queryDouble(String mapper, String sql, Object... parameters);
}




