/**
 * @author giang
 */
package tp.kits3.comedians.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.service.IAccountService;
import tp.kits3.comedians.service.ICartService;
import tp.kits3.comedians.utils.SessionUtil;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private IAccountService accountService;
	
	@Autowired
	private ICartService cartService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String token = request.getParameter("authorization");
		AccountUserRoleDTO account =  (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		if(token != null) {
			if(account == null) {
				AccountUserRoleDTO user = accountService.loginByToken(token);
				user.setCountCart(cartService.countCartByAccountId(user.getId()));
				SessionUtil.getInstance().putValue(request, "ACCOUNT", user);
			}
		}else {
			// client delete token in browser cookie
			if(account != null && account.isRemember()) {				
				SessionUtil.getInstance().removeValue(request, "ACCOUNT");
			}
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		if(account != null) {
			account.setCountCart(cartService.countCartByAccountId(account.getId()));
			SessionUtil.getInstance().putValue(request, "ACCOUNT", account);
		}
	}
	
}
