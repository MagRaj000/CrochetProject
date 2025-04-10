# Crochet Project

### Description

This project is a website for browsing and managing crochet patterns. It's a Spring Boot application vith JSP views based on [SB Admin 2 dashboard template](https://github.com/StartBootstrap/startbootstrap-sb-admin-2). If you want to use the API directly, please go to this [repository](https://github.com/MagRaj000/CrochetAPI).

On the website, any user can filter patterns by their category, difficulty and yarn weight. They can also browse all patterns and access their step-by-step instructions. Logged in users are able to save patterns to their libraries, track their progress following the pattern, and add custom notes.

### Application set-up

Before running the application, make sure to establish the database connection. It can be done in two ways:
1. Add an _.env_ file to the project root

It should look like this:
```
DB_USERNAME=""
DB_PASSWORD=""
```
> [!IMPORTANT]
>Provide your real MySQL username and password **inside** the quotation marks

2. Change _application.properties_ directly

Modify those two lines to include your username and password **without** quotation marks:
```
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
```
You can find this file in _src/main/resources/_


Remember to create a crochetStore schema and import the data from _dump.sql_ into it. Alternatively, you can use a different schema after changing <ins>spring.datasource.url</ins> in _application.properties_


> [!NOTE]
>If all is set-up correctly, the application will be available under http://localhost:8080/home
