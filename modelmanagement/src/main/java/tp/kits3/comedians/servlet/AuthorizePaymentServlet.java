package tp.kits3.comedians.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.model.OrderDetail;
import tp.kits3.comedians.payment.PaymentService;

//@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String total = request.getParameter("subtotal");
		System.out.println(request.getParameter("subtotal"));
		OrderDetail orderDetail = new OrderDetail(total);
		
		try {
			PaymentService paymentServices = new PaymentService();
			String approvalLink = paymentServices.authorizePayment(request, orderDetail);

			response.sendRedirect(approvalLink);
			
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", "Invalid Payment Details");
			ex.printStackTrace();
			request.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
		}
 	}

}
