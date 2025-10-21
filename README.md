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

## Prerequisites

* JDK 17 or newer
* Apache Maven
* MySQL Server
* A Java Servlet Container (like Apache Tomcat 9 or 10)

## Setup and Installation

### 1. Database Setup

1.  Ensure your MySQL server is running.
2.  Create the database and tables by executing the provided `db-init.sql` script. This will:
    * Create the `foodorderdb` database.
    * Create the `users`, `food`, and `orders` tables.
    * Insert a default user (`admin` / `1234`).
    * Insert sample food items (Burger, Pizza, etc.).

### 2. Configure Database Connection

You must update the database credentials in the project's connection manager.

1.  Open the file: `src/main/java/com/foodorder/db/DBConnection.java`.
2.  Modify the `USER` and `PASS` constants to match your MySQL username and password.

    ```java
    // ...
    private static final String USER = "your-mysql-username"; // <--- change this
    private static final String PASS = "your-mysql-password"; // <--- change this
    // ...
    ```

### 3. Build the Project

1.  Open a terminal in the project's root directory (where `pom.xml` is located).
2.  Run the Maven command to build the project:
    ```sh
    mvn clean package
    ```
3.  This will compile the code and create a `FoodOrderApp.war` file inside the `target/` directory.

### 4. Deploy the Application

1.  Start your Apache Tomcat server.
2.  Copy the `target/FoodOrderApp.war` file into the `webapps` directory of your Tomcat installation.
3.  Tomcat will automatically deploy the application.

## How to Use

1.  Open your web browser and navigate to the application's URL. This is typically:
    `http://localhost:8080/FoodOrderApp/`

2.  You will be redirected to the login page (`login.jsp`).

3.  Use the default credentials created by the SQL script to log in:
    * **Username**: `admin`
    * **Password**: `1234`

4.  Upon successful login, you will be redirected to the menu (`home.jsp`) where you can add items to your cart.

5.  You can view your cart (`cart.jsp`) and place the order. After ordering, you will see a success message (`orderSuccess.jsp`).
