package com.foodorder.servlet;

import com.foodorder.dao.FoodDao;
import com.foodorder.model.FoodItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final FoodDao dao = new FoodDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // add to cart
        int id = Integer.parseInt(req.getParameter("id"));
        int qty = 1;
        try {
            qty = Integer.parseInt(req.getParameter("qty"));
        } catch (Exception ignored) {
        }

        FoodItem item = dao.getById(id);
        if (item == null) {
            resp.sendRedirect(req.getContextPath() + "/food");
            return;
        }

        HttpSession s = req.getSession(true);
        Object cartObj = s.getAttribute("cart");
        List<Map<String, Object>> cart;
        if (cartObj instanceof List) {
            cart = new ArrayList<>();
            List<?> raw = (List<?>) cartObj;
            for (Object o : raw) {
                if (o instanceof Map) {
                    @SuppressWarnings("unchecked")
                    Map<String, Object> m = (Map<String, Object>) o;
                    cart.add(m);
                }
            }
        } else {
            cart = new ArrayList<>();
        }

        // simple cart item map
        Map<String, Object> map = new HashMap<>();
        map.put("id", item.getId());
        map.put("name", item.getName());
        map.put("price", item.getPrice());
        map.put("qty", qty);

        cart.add(map);
        s.setAttribute("cart", cart);
        resp.sendRedirect(req.getContextPath() + "/cart.jsp");
    }
}
