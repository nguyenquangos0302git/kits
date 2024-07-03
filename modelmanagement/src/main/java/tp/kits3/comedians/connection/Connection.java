/**
 * @author quang
 */
package tp.kits3.comedians.connection;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class Connection{

	private static SqlSessionFactory factory = null;

	public static SqlSessionFactory getInstance() {
		if (factory == null) {
			try {
				Reader resource = Resources.getResourceAsReader("mybatis/mybatis-config.xml");
				factory = new SqlSessionFactoryBuilder().build(resource);
				resource.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return factory;
	}

}
