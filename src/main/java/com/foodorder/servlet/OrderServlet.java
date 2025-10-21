package com.foodorder.servlet;

import com.foodorder.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        int userId = (int) s.getAttribute("userId");
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> cart = (List<Map<String, Object>>) s.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/food");
            return;
        }

        String sql = "INSERT INTO orders (user_id, food_id, quantity) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            for (Map<String, Object> item : cart) {
                ps.setInt(1, userId);
                ps.setInt(2, (int) item.get("id"));
                ps.setInt(3, (int) item.get("qty"));
                ps.addBatch();
            }
            ps.executeBatch();
            s.removeAttribute("cart");
            resp.sendRedirect(req.getContextPath() + "/orderSuccess.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/cart.jsp?error=1");
        }
    }
}
