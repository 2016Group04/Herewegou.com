package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.OrderFormServiceImpl;
import com.util.PaymentUtil;
import com.vo.OrderForm;
  
public class CallbackServlet extends HttpServlet {  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        String p1_MerId = request.getParameter("p1_MerId");  
        String r0_Cmd = request.getParameter("r0_Cmd");  
        String r1_Code = request.getParameter("r1_Code");  
        String r2_TrxId = request.getParameter("r2_TrxId");  
        String r3_Amt = request.getParameter("r3_Amt");  
        String r4_Cur = request.getParameter("r4_Cur");  
        String r5_Pid = request.getParameter("r5_Pid");  
        String r6_Order = request.getParameter("r6_Order");  
        String r7_Uid = request.getParameter("r7_Uid");  
        String r8_MP = request.getParameter("r8_MP");  
        String r9_BType = request.getParameter("r9_BType");  
        String rb_BankId = request.getParameter("rb_BankId");  
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");  
        String rp_PayDate = request.getParameter("rp_PayDate");  
        String rq_CardNo = request.getParameter("rq_CardNo");  
        String ru_Trxtime = request.getParameter("ru_Trxtime");  
        String hmac = request.getParameter("hmac");  
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(  
                "keyValue");  
  
        // 验证请求是否来自于 第三方支付公司  
        boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,  
                r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,  
                r8_MP, r9_BType, keyValue);  
        response.setContentType("text/html;charset=utf-8");  
        PrintWriter out = response.getWriter();  
        if (isValid) {  
            // 数据有效  
            if ("1".equals(r9_BType)) {  
                out.println("支付成功！");
                
                OrderFormServiceImpl service = new OrderFormServiceImpl();
                Long odernum = new Long(r6_Order);
                OrderForm of = service.getOrderByOrdernum(odernum);
                of.setState("已付款");
                
                OrderFormServiceImpl service2 = new OrderFormServiceImpl();
                service2.updateOrder(of);
                
                request.getRequestDispatcher("paySuccess.jsp").forward(request, response);;
                
            } else if ("2".equals(r9_BType)) {  
                System.out.println("付款成功！"); 
                
                OrderFormServiceImpl service = new OrderFormServiceImpl();
                Long odernum = new Long(r6_Order);
                OrderForm of = service.getOrderByOrdernum(odernum);
                of.setState("已付款");
                
                OrderFormServiceImpl service2 = new OrderFormServiceImpl();
                service2.updateOrder(of);
            }  
        } else {  
            // 数据无效  
            out.println("数据被篡改！");  
            
            
        }  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        doGet(request, response);  
    }  
  
}  