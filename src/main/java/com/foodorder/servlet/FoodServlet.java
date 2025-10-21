package com.foodorder.servlet;

import com.foodorder.dao.FoodDao;
import com.foodorder.model.FoodItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/food")
public class FoodServlet extends HttpServlet {
    private final FoodDao dao = new FoodDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<FoodItem> foods = dao.getAllFoods();
        req.setAttribute("foods", foods);
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }
}
