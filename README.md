## JPACRUDProject

## Description
This individual dynamic full-stack application utilizes Java, the Relational DataBase Management System(RDMS) MySql, MySQL workbench, Java Database Connectivity(JDBC), Jakarta Persistence API(JPA), Hibernate, Gradle Dependency Management, Jakarta Server Pages (JSP), HTML, CSS and Spring Boot framework to allow users to search, create, update, and delete baseball players objects from a MySql database. This application also employs Object Relational Mapping(ORM) and a Data Access Object(DAO) patterns to execute the CRUD operations. 

#### MySQL WorkBench

MySQL WorkBench was used in this application to create and maintain the relational database with the sole table of player. Within the player table are ten columns holding the primary key of ID, various information about the player, various hitting stats of the player, and a VARCHAR that holds the URL for a photo of that player in the form of text. The database is preset with 5 players each displaying various aspects of the datatypes permitted by the database. For example, id number 4, Didi Gregorius, has a negative wins above replacement value indicating that column is a signed column. The other stat columns are unsigned since they can never be negative numbers. The id, first_name, last_name, team, and position columns are all designated NOT NULL. This is because it would not be possible for a player to exist in the table without these categories. Players are required to have names and they cannot fundamentally be baseball players without a position. However, in reality, players can not be on a team, but they are considered free agents and must be designated that way not as null. Five players were created for the base of this database.

#### Jakarta Persistence API

 JPA is the core persistence mechanic of this application and allows for the sole entity of this application, "Player", to persist through my created MySQL database. It achieves persistence of baseball players through ORM which translates the player table column's into a Java class and associated fields. JPA has many dependencies to allow for the connection to the database. These dependencies include the JDBC driver which allows for communication to the database, its persistence provider hibernate which implements its interfaces to manage the connection with an entity manager, and hibernates dependency c3p0 which keeps the connection open. All of these dependencies are housed in the build.gradle file of the JPA portion of the project. 

###### Player

The sole entity of this project is the player class. This class is annotated as an entity to allow JPA to understand that it will house the information received from the database in the form of an object. The player class is also annotated with id and generated value annotations on the id field. This tells the JPA that the id field should be mapped to the primary key of the database and should be autoincremented each time a new instance of the class is created. Once the JPA recognizes the class and its fields, it stores the information from the relational database as an instance of the class. It is crucial to also make sure that the player class is included as an entity in the persistence.xml of the JPA project so that it can be recognized by the persistence unit. 

###### Persistence Unit

The persistence unit is housed in the persistence.xml file and is named JPABaseballPlayers matching the project. In this file, we also configure specific information for the project like declaring the persistence provider as hibernate and hibernates dependency as c3p0. We must also use the property tag to specify information about the MySQL database such as the URL it can be found at as well as the username, password, and driver for MySQL. As mentioned previously this is also where we declare the entities to be managed by JPA and the entity manager.

#### JUNIT Testing

JUnit testing our entities is crucial for ensuring that the correct information is being passed from our database. In our JUnit test, I establish a static entity manager factory to create the entity manager that will be used to retrieve the data from the database. This factory is created before all tests and closed after all tests to keep the cost of connection low. It is also important to note that the persistince unit name is used here to link the manager to the entity. The manager itself is created before and after each test, of which there is only one in this case. If there were multiple though, this would be necessary to ensure we are testing entities separately from each other and no information is being carried from one test to another. 

#### Spring Boot Framework

###### Gradle

Spring boot is integrated into this application to perform the main CRUD functions and to display the HTML and JSPs in the web browser. This integration is done through both the gradle files where the name of the project is included as a dependency. The build.gradle file also holds the dependencies for using JSPs, MySQL, and the spring framework. Although, the URL, username and password for the MySQL database are stored in the application.properties file. 


#### JSPs and HTML

###### home.jsp

There are multiple JSPs in the project for sending user input data to the controller and displaying information to the user. These begin with the home.jsp page which is the landing page for the application. The landing page displays a nav bar using some bootstrap, HTML, and CSS elements. The code for this nav bar is enclosed in its own JSP, navbar.jsp, and is placed within the home.jsp using the jsp:include element of the tag library. This is also the case for the bootstrap style sheet and script which are in the bootstrapheader and bootstrapfooter respectively. These JSPs are also placed in every JSP file of this application.  

###### viewPlayer.jsp

The home page also displays a welcome message and a table of the current players included in the database. This table is displayed through JSTL elements, and is styled using the table bootstrap class with a minor modification to the width of the table so it did not fill the entire page. The user can either select a player from the table or select an option from the nav bar. If they choose from the table they are taken to the viewplayer.jsp by the findPlayerDataById.do path. This also occurs the same way if a user decides to use the text input in the nav bar to search for a player. The user is returned the stats of the player and a photo of that player if available.

The user can select to update or delete the player from the database as well as make any selection from the nav bar.

###### update.jsp and updateSuccessful.jsp

If the user elects to update the player they are taken to update.jsp where they will be displayed the player's current information in the database and are allowed to make changes. Any change that the user makes on this page will be persisted in the database. There are HTML limitations in place to ensure that only the correct information is allowed to be placed in the input boxes on this page. Once the player is updated the user is redirected to updateSuccessful.jsp where the new information is displayed. Here the user can select to delete the player, update them again, or make a selection from the nav bar.

###### Deletion 

If a user elects to delete the player they will be redirected to deleteSuccessful.jsp. This function removes the player from the database. If the user uses the back-arrow and tries to delete the player again, they will be routed to deleteError.jsp since the player id is now null in the database. 

###### Creation 

The sole static HTML page is the create.html page that is used for the creation of a player. This page was created as an HTML instead of as a JSP because it is a solely static web page that has no purpose of being used as a JSP since the nav bar was intentionally left off of this page. This HTML page actions the create.do path in the controller with a post request once the user inputs the data they would like to for the player. 

 Once a user successfully creates a player they are redirected to playerCreated.jsp where their player's information is displayed as well as a picture if they chose to include one. This player's information is persisted in the database. If the user fails to create a player for any number of reasons, they are directed to the createError.jsp where they are able to make a selection from the nav bar.


###### DAO

The DAO pattern is crucial to the CRUD portion of this application. The CRUD methods are housed in the interface PlayerStatDAO and implemented in the PlayerStatDAOImpl class. As opposed to previous projects, the DAO implementations are much simpler because of the Spring Boot Framework and JPA. 

The framework allows for the use of Java POJOs as Spring beans throughout the project through the component scan. This scans the classpath for annotated classes that will be automatically created as Spring beans. This is achieved through the Service tag. The class is also annotated as Transactional meaning that anytime a method begins in the DAO class a transaction is automatically started. Transactions will automatically commit or roll back the transaction depending successful completion of the method. A final annotation of PersistenceContext is added to the Entity manager field. This allows for the use of CRUD methods like find, persist, and remove to achieve creating, reading, updating, and deleting from the database.

The methods themselves now have much less code in them because it is no longer necessary to directly query the database with SQL language. This is thanks to the JPA and the entity manager's crud operations methods. 

###### Controller 

The controller class works in conjunction with the DAO to impact database information by intaking information from the user and then also routing the user to the page where the information can be displayed. The class is annotated as a controller allowing for it to be autoscanned by the spring framework which allows for autowiring of the DAO through dependency injection. This is why it is necessary for the DAO to be annotated as a Service type component. The DAO functions very much the same as it has in previous projects. Intaking information from JSP and HTML forms, sending that information to the DAO for CRUD operations to occur, storing the returned data in a model, and then either displaying that data directly via a GET or redirecting the user from a POST request to ensure there are not multiple forms submitted. 

## Technologies Used
* Java
* MySQL (MySQL WorkBench)
* JDBC
* Gradle
* Spring Boot
* JPA
* JSP
* Spring Tool Suite
* CSS
* HTML
* JPQL

## Lessons Learned

The new springboot framework is a welcome advancement in the full-stack process. Although, learning what goes on behind the scenes for it to execute the process is quite challenging. I have been going through the process step-by-step while writing this README to try to develop a better understanding of what is happening.

Another welcome surprise was the use of more CSS in this project. CSS is not something that we have gone into very much detail about during the course so far, so it was great to be able to take some time to learn and relearn how to make the web pages a little more interesting. 

Finally, learning how to use MySQL workbench to create the database was very useful. It is interesting to see how a database, although small, is created as opposed to simply accessing and changing the information. 