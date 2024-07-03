package tp.kits3.comedians.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.payment.PaymentService;

/**
 * Servlet implementation class ReviewPaymentServlet
 */
//@WebServlet("/review_payment")
public class ReviewPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		try {
			PaymentService paymentService = new PaymentService();
			Payment payment = paymentService.getPaymentDetails(paymentId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			//ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			//request.setAttribute("shippingAddress", shippingAddress);
			
			String url = "WEB-INF/views/web/review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
			request.getRequestDispatcher(url).forward(request, response);
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", "Invalid Payment Details");
			ex.printStackTrace();
			request.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
		}
	}

}
