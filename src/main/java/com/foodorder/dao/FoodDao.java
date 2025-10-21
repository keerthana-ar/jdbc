package com.foodorder.dao;

import com.foodorder.db.DBConnection;
import com.foodorder.model.FoodItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodDao {
    public List<FoodItem> getAllFoods() {
        List<FoodItem> list = new ArrayList<>();
        String sql = "SELECT id, name, price FROM food";
        try (Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new FoodItem(rs.getInt("id"), rs.getString("name"), rs.getDouble("price")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public FoodItem getById(int id) {
        String sql = "SELECT id, name, price FROM food WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next())
                    return new FoodItem(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
