/**
 * @author giang
 */
package tp.kits3.comedians.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import tp.kits3.comedians.handler.CustomHttpServletRequest;
import tp.kits3.comedians.utils.CookieUtil;

public class RemoteAddHeader implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String token = CookieUtil.checkCookieAuthor((HttpServletRequest) request);
		if(!token.isEmpty()) {
			CustomHttpServletRequest req = new CustomHttpServletRequest((HttpServletRequest) request);
			req.addHeader("authorization", token);
			chain.doFilter(req, response);
		}else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
