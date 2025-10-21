# FoodOrderApp - Java Servlet & JDBC Project

This is a simple web application for ordering food, built using Java Servlets, JSP, and plain JDBC for database connectivity. It serves as a foundational example of a dynamic, database-driven web application without using modern frameworks like Spring or Hibernate.

The application allows users to log in, view a menu of food items, add items to a shopping cart, and place an order.

## Features

* **User Authentication**: Secure login for users stored in the database.
* **Food Menu**: Dynamically displays a list of available food items and prices from the database.
* **Shopping Cart**: Session-based shopping cart to add/manage items before ordering.
* **Place Order**: Persists the user's cart items into an `orders` table in the database.
* **Database Integration**: Uses plain JDBC for all database operations (Create, Read).

## Technologies Used

* **Backend**: Java 17
* **Web**: Java Servlets 4.0.1, JavaServer Pages (JSP) 2.3.3
* **Database**: MySQL
* **Driver**: `mysql-connector-java` (8.0.33)
* **Build**: Apache Maven
* **Server**: Runs on any Servlet 4.x container (e.g., Apache Tomcat 9+)

## Project Structure
