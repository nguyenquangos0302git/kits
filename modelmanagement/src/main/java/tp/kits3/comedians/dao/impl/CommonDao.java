/**
 * @author all
 */
package tp.kits3.comedians.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import tp.kits3.comedians.connection.Connection;
import tp.kits3.comedians.dao.GenericDao;

public class CommonDao<T> implements GenericDao<T> {

	@Override
	public List<T> query(String mapper, String sql, Object... parameter) {
		SqlSession session = Connection.getInstance().openSession();
		List<T> list = new ArrayList<>();
		if(parameter == null ||parameter.length > 1 || parameter.length == 0) {			
			list = session.selectList("mappers." + mapper + "." + sql, parameter);
		} else {
			list = session.selectList("mappers." + mapper + "." + sql, parameter[0]);
		}
		session.close();
		return list;
	}	
	@Override
	public List<String> queryString(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession();
		List<String> list = new ArrayList<String>();
		if(parameters.length > 1 || parameters.length == 0) {			
			list = session.selectList("mappers." + mapper + "." + sql, parameters);
		} else {
			list = session.selectList("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return list;
	}

	@Override
	public int insert(String mapper, String sql, T model) {
		SqlSession session = Connection.getInstance().openSession(true);
		int result = session.insert("mappers." + mapper + "." + sql, model);
		session.close();
		return result;
	}

	@Override
	public int update(String mapper, String sql, T model) {
		SqlSession session = Connection.getInstance().openSession(true);
		int result = session.update("mappers." + mapper + "." + sql, model);
		session.close();
		return result;
	}

	@Override
	public void delete(String mapper, String sql, Object... parameter) {
		SqlSession session = Connection.getInstance().openSession(true);
		if(parameter == null || parameter.length > 1 || parameter.length == 0) {			
			session.delete("mappers." + mapper + "." + sql, parameter);
		} else {
			session.delete("mappers." + mapper + "." + sql, parameter[0]);
		}
		session.close();
	}

	@Override
	public int updateField(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession(true);
		int result = 0;
		if(parameters == null || parameters.length > 1 || parameters.length == 0) {			
			result = session.update("mappers." + mapper + "." + sql, parameters);
		} else {
			result = session.update("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return result;
	}

	@Override
	public int count(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession(true);
		int result = 0;
		if(parameters == null || parameters.length > 1 || parameters.length == 0) {			
			result = session.selectOne("mappers." + mapper + "." + sql, parameters);
		} else {
			result = session.selectOne("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return result;
	}

	@Override
	public List<Integer> queryInt(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession();
		List<Integer> list = new ArrayList<>();
		if(parameters == null ||parameters.length > 1 || parameters.length == 0) {			
			list = session.selectList("mappers." + mapper + "." + sql, parameters);
		} else {
			list = session.selectList("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return list;
	}
	@Override
	public List<Double> queryDouble(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession();
		List<Double> list = new ArrayList<>();
		if(parameters == null ||parameters.length > 1 || parameters.length == 0) {			
			list = session.selectList("mappers." + mapper + "." + sql, parameters);
		} else {
			list = session.selectList("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return list;
	}
	@Override
	public int insertList(String mapper, String sql, Object... parameters) {
		SqlSession session = Connection.getInstance().openSession();
		int result = 0;
		if(parameters == null ||parameters.length > 1 || parameters.length == 0) {			
			result = session.insert("mappers." + mapper + "." + sql, parameters);
		} else {
			result = session.insert("mappers." + mapper + "." + sql, parameters[0]);
		}
		session.close();
		return result;
	}

	
}
