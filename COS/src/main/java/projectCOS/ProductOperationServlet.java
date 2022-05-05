package projectCOS;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.*;
import java.sql.*;

@WebServlet(urlPatterns="/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject", "root", "");
			
			HttpSession session = req.getSession();
			String inpass = req.getParameter("pass");
			String usrpass = (String)session.getAttribute("password");
			
			//RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
			
			//getting op for deciding operation
			String op = req.getParameter("operation");
			
			//Adding Category
			if(op.trim().equals("addcategory")) {
				//category-operations
				//taking values from form
				String cTitle = req.getParameter("ctitle");
				String cDesc = req.getParameter("cdesc");
				String cPic = req.getParameter("cpic");
				String cSDesc = cDesc.substring(0,50) + "...";
				//insert query
				String cInsertQ = "INSERT INTO `category` (`cTitle`, `cDescription`,`cPic`,`cSmallDesc`) VALUES (?,?,?,?);";
				
				PreparedStatement p=con.prepareStatement(cInsertQ);
				p.setString(1, cTitle);
				p.setString(2, cDesc);
				p.setString(3, cPic);
				p.setString(4, cSDesc);
				p.executeUpdate();
				
				//session.setAttribute("email", "@tcs.com");
				session.setAttribute("message", "Category Added Successfully!!! "+cTitle);
				
				res.sendRedirect("admin.jsp");
			}

			//Adding Product
			else if(op.trim().equals("addproduct")) {
				//product-operations
				//taking values from form
				String pTitle = req.getParameter("pTitle");
				String pDesc = req.getParameter("pDesc");
				String pPic = req.getParameter("pPic");
				float pPrice = Float.parseFloat(req.getParameter("pPrice"));
				float pDiscount = Float.parseFloat(req.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
				int cId = Integer.parseInt(req.getParameter("flexRadioDefault"));
				String pSDesc = pDesc.substring(0,50) + "...";
				
				Float pDiscPrice;
				
				pDiscPrice = pPrice-((pDiscount/100)*pPrice);
				
				//insert query
				String pInsertQ = "INSERT INTO `myproject`.`product` (`pTitle`, `pDescription`, `pPic`, `pPrice`, `pDiscount`, `pQuantity`, `cId`,`pSmallDesc`,`pDiscPrice`) VALUES (?,?,?,?,?,?,?,?,?);";
				
				PreparedStatement p=con.prepareStatement(pInsertQ);
				p.setString(1, pTitle);
				p.setString(2, pDesc);
				p.setString(3, pPic);
				p.setFloat(4, pPrice);
				p.setFloat(5, pDiscount);
				p.setInt(6, pQuantity);
				p.setInt(7, cId);
				p.setString(8, pSDesc);
				p.setFloat(9, pDiscPrice);
				p.executeUpdate();
				
				session.setAttribute("message", "Product Added Successfully!!! "+pTitle);
				res.sendRedirect("admin.jsp");
			}
			
			else if(op.trim().equals("modproduct")) {
				
				String in_pid = req.getParameter("modprod");
				int in_col = Integer.parseInt(req.getParameter("colname"));
				String in_data = req.getParameter("data");
				String colname="";
				switch(in_col) {
				case 1:
					colname="pTitle";
					break;
				case 2:
					colname="pPrice";
					break;
				case 3:
					colname="pQuantity";
					break;
				case 4:
					colname="pPic";
					break;
				}
				
				String pUpdateQ = "UPDATE `myproject`.`product` SET `"+colname+"`='"+in_data+"' where `pId`='"+in_pid+"';";
				//System.out.println(pUpdateQ);
				if(usrpass.equals(inpass)) {
				PreparedStatement p=con.prepareStatement(pUpdateQ);
				p.executeUpdate();
				
				session.setAttribute("message", "Product Updated Successfully!!!");
				
				res.sendRedirect("admin.jsp");
				}
				else {
					session.setAttribute("message", "Product Not Updated !!!");
					res.sendRedirect("admin.jsp");
				}
				
			}
			
			else if(op.trim().equals("modcategory")) {
				
				String in_cid = req.getParameter("modcat");
				int in_col = Integer.parseInt(req.getParameter("colname"));
				String in_data = req.getParameter("data");
				String colname="";
				switch(in_col) {
				case 1:
					colname="cTitle";
					break;
				case 2:
					colname="cPic";
					break;
				}
				
				String cUpdateQ = "UPDATE `myproject`.`category` SET `"+colname+"`='"+in_data+"' where `cId`='"+in_cid+"';";
				//System.out.println(cUpdateQ);
				if(usrpass.equals(inpass)) {
				PreparedStatement p=con.prepareStatement(cUpdateQ);
				p.executeUpdate();
				
				session.setAttribute("message", "Category Updated Successfully!!!");
				
				res.sendRedirect("admin.jsp");
				}
				else {
					session.setAttribute("message", "Category Not Updated !!!");
					res.sendRedirect("admin.jsp");
				}
				
			}
			
			//Deleting Category
			else if(op.trim().equals("delcategory")) {
				
				String in_cid = req.getParameter("incid");
				String cDeleteQ = "DELETE FROM `category` where cId="+in_cid+";";
				
				if(usrpass.equals(inpass)) {
				PreparedStatement p=con.prepareStatement(cDeleteQ);
				p.executeUpdate();
				
				session.setAttribute("message", "Category Deleted Successfully!!!");
				
				res.sendRedirect("admin.jsp");
				}
				else {
					session.setAttribute("message", "Category Not Deleted !!!");
					res.sendRedirect("admin.jsp");
				}
				
			}
			
			//Deleting Product
			else if(op.trim().equals("delproduct")) {
				
				String in_pid = req.getParameter("inpid");
				String pDeleteQ = "DELETE FROM `product` where pId="+in_pid+";";
				
				if(usrpass.equals(inpass)) {
				PreparedStatement p=con.prepareStatement(pDeleteQ);
				p.executeUpdate();
				
				session.setAttribute("message", "Product Deleted Successfully!!! ");
				res.sendRedirect("admin.jsp");
				}
				else {
					session.setAttribute("message", "Product Not Deleted !!!");
					res.sendRedirect("admin.jsp");
				}
			}
			else {
				session.setAttribute("message", "Unknown Error");
				res.sendRedirect("admin.jsp");
			}
			con.close();
		}
		catch(Exception e) {
			System.out.println("Exception ==> "+e);
			res.sendRedirect("Error.jsp");
		}
		
	}

}
