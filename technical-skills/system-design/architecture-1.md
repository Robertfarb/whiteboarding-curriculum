# Web Architecture (Part I)

### Basic Configuration of a Web App
![basic-setup](images/00-basic-setup.jpg)

The above image represents a simple set up of a web app. Let's imagine that we have a toy app called myfacebook.com. Let's observe how this app is set up:

1. When the user goes to the browser and types in "www.myfacebook.com", it instantiates a DNS lookup to find the correct IP address to get the website associated with that domain (you can think of DNS as a phone book for the internet).

2. Then, an HTTP request is made from the user to a web server (typically Puma). The web server's only job is to speak HTTP.

3. The web server communicates with the application server (Rails, Sinatra) using Rack to determine what to put in the body of the response back to the user.

4. Meanwhile, there's also a database server running. The application talks to the database through a TCP connection. (Conceivably, the application and database servers could live on different machines, but for this simple set up, let's assume that they exist on the same machine.) The application sends SQL requests for the database to execute, and then the database sends the response back.

5. The database makes read and write operations to the RAM (Random-access memory) and hard disk of the machine based on the SQL that the application sends. RAM is fast to read and write from, but it does not persist once the machine is turned off. On the other hand, data in the hard disk does persist, but operations are much slower.

### Basic App Performance
Let's analyze the performance of our basic web app, myfacebook.com, which was built on Rails and uses a PostgreSQL database.

#### Rails
In general, Ruby excutes slowly in comparison to other languages like C and Java. You could configure Ruby to use the JRuby interpreter (which is written in Java) instead of its default MRI interpreter (which is written in C).

Some of JRuby's advantages 
