/**
 * @author giang
 */
package tp.kits3.comedians.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.utils.SessionUtil;

public class Authorization implements Filter {
	
	@SuppressWarnings("unused")
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String url = req.getRequestURI();
		url = url.replace(req.getContextPath(), "");
		if (url.startsWith("/admin")) {
			AccountUserRoleDTO model = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
			if (model != null) {
				if (model.getRoles().contains("ADMIN")) {
					chain.doFilter(req, resp);
				} else if (model.getRoles().contains("STAFF")) {
					if (checkRole(url)) {
						chain.doFilter(req, resp);
					} else {
						resp.sendRedirect(req.getContextPath());
					}
				} else if (model.getRoles().contains("USER")) {
					resp.sendRedirect(req.getContextPath() + "/login?accessDenied");
				}
			} else {
				if(req.getParameter("authorization") == null) {
					resp.sendRedirect(req.getContextPath() + "/login?accessDenied");
				}else {
					chain.doFilter(req, resp);
				}
			}
		} else {
			chain.doFilter(req, resp);
		}
	}

	public boolean checkRole(String url) {
		String[] staffRequired = {"/admin-home", "/admin-model", "/admin-account" };

		for (String checkURL : staffRequired) {
			if (url.contains(checkURL)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
