/**
 * @author giang
 */
package tp.kits3.comedians.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class CustomHttpServletRequest extends HttpServletRequestWrapper {

	private Map<String, String> customHeaderMap = null;

	public CustomHttpServletRequest(HttpServletRequest request) {
		super(request);
		customHeaderMap = new HashMap<String, String>();
	}

	public void addHeader(String name, String value) {
		customHeaderMap.put(name, value);
	}
	
	@Override
	public String getParameter(String name) {
		String parameterValue = super.getParameter(name);
		if (parameterValue == null) {
			parameterValue = customHeaderMap.get(name);
		}
		return parameterValue;
	}

}
