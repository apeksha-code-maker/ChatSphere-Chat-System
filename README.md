 💬 ChatSphere – Simple Chat System

 🚀 Overview

ChatSphere is a web-based chat application developed using **Java, Servlets, JSP, and JDBC**.
It allows users to register, login, and exchange messages with other users while maintaining chat history in a MySQL database.

---

 🛠️ Technologies Used

* Java (Advanced Java)
* Servlets & JSP
* JDBC (Java Database Connectivity)
* MySQL
* Apache Tomcat

---

 ✨ Features

* 🔐 User Registration and Login
* 👤 Session Management
* 💬 Send and Receive Messages
* 🗂️ Chat History Storage in Database
* 🧩 MVC Architecture Implementation

---

 🗄️ Database Design

Users Table

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50)
);
```

 Messages Table

```sql
CREATE TABLE messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    receiver_id INT,
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---
 ▶️ How to Run the Project

1. Install **XAMPP / MySQL**
2. Import the SQL tables into your database
3. Open project in **Eclipse / NetBeans**
4. Configure **Apache Tomcat Server**
5. Run the project
6. Open in browser:
   👉 `http://localhost:8080/ChatSphere`
---
 
 📂 Project Structure

```
ChatSphere-Chat-System/
│
├── src/
│   ├── com/chatapp/servlet/
│   ├── com/chatapp/dao/
│   ├── com/chatapp/util/
│
├── WebContent/
│   ├── login.jsp
│   ├── register.jsp
│   ├── chat.jsp
│   ├── users.jsp
│
├── sql/
│   └── schema.sql
│
├── README.md
└── .gitignore
```

---

 📌 Future Enhancements

* Real-time chat using WebSockets
* Improved UI/UX
* Group chat functionality
* File sharing feature

---

 🎯 Key Concepts Used

* JDBC for database connectivity
* Servlets for backend logic
* JSP for dynamic UI
* Session handling for authentication
* MVC design pattern

---

