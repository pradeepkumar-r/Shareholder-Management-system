<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

        <title>Share market</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!..bootstrap link..>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"><!..*w3-css link*..>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    top:0;
    width:100%;
}
.carousel-indicators {
    position: absolute;
    bottom: 10px;
    left: 50%;
    z-index: 15;
    width: 60%;
    padding-left: 0;
    margin-left: 0%;
    text-align: center;
    list-style: none;
}
li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover {
    background-color: #111;
}

</style>
</head>
<body style="background-color:#212529">
     <%String username=(String)session.getAttribute("username");
%>
<!--Nav bar-->
<ul>
  <li><a title="About" href="#about">About</a></li>
  <li><a title="Achievements" data-toggle="modal" data-target="#achievements">Achievements</a></li>
  <li><a title="Salary" data-toggle="modal" data-target="#salary">Salary</a></li>
<!--  <li><a href="#about">Sell shares</a></li>-->
  <li><a title="Region"  data-toggle="modal" data-target="#region" title="My Clients">Region</a></li>
  <li><a data-toggle="modal" data-target="#clients" title="My Clients">My clients</a></li>
  <li style="float:right" title="Logout"><a href="signout.do">log out</span></a></li>
  <li style="float:right" title="Your name"><a href="signout.do"><%=username%></span></a></li>
  
</ul>
<!--slide images-->
<br>
<br>
<br>
<div class="container">
  <div id="myCarousel"  class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" style="width:100%">

       <div class="item ">
        <img src="https://s3.ap-southeast-1.amazonaws.com/cdn.deccanchronicle.com/sites/default/files/BSE-Sensex_0.jpg" >
        <div class="carousel-caption">
          <h2 class="w3-opacity"><b>INVEST HERE</b></h2>
          <p><b>GET MORE MONEY</b></p>
        </div>
        </div>

      <div class="item active">
        <img src="https://s3.envato.com/files/127188905/Stock%20market%20Preview.jpg" style="width:100%"; >
        <div class="carousel-caption">
          <h2 class="w3-opacity"><b>OUR FORMULA</b></h2>
          <p><b>TRUST OURSELF</b></p>
        </div>
      </div>
    
          <div class="item">
        <img src="https://www.intel.com/content/dam/www/public/us/en/images/photography-consumer/16x9/how-to-increase-wifi-speed.jpg.rendition.intel.web.1648.927.jpg">
        
        <div class="carousel-caption">
          <h2 class="w3-opacity"><b>INTERESTING ONE</b></h2>
          <p><b>IN SHAREMARKET ONE INVEST ,ANOTHER ONE BUYS A SAME</b></p>
         </div>
  
         </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
<br>
<div id="about">
<h1 class="w3-opacity-max w3-text-white" style="text-align:center;">BUILD YOUR OWN DREAMS</h1>
<h4 class="w3-opacity w3-text-white" style="text-align:center;font-family:verdana;"><b>This company tells about current company shares and their status.we start this service in 1999.Our other achiements are app@here.Our company's owner studied in canada but they worked here for years to make our country wealth
</b></h4>
</div>
<br>
<br>
  <div class="modal fade" id="achievements" role="dialog">
      <%
          try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         int value=0;
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        ResultSet resultset = statement.executeQuery("select count from maxclients where brokergmail='"+username+"'");
        if (resultset.next()) {
            value = Integer.parseInt(resultset.getString("count"));
        }
          %>
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Achievements</h4>
        </div>
        <div class="modal-body">
            <p class="bg-info">you got <%=value%> clients</p>
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
   <%  }
       catch(Exception e)  {
           Logger.getLogger("brokererIndex").log(Level.SEVERE,"Error in view query");
           }
   %>
    
  </div>
   
   <div class="modal fade" id="salary" role="dialog">
          <%
          try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         double value=0;
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        System.out.println("Above Flow is correct");
        ResultSet resultset = statement.executeQuery("SELECT salary FROM stockbroker WHERE brokergmail ='"+username+"'");
        System.out.println("Flow is correct");
        if (resultset.next()) {
            System.out.println("Flow is correct in if " +resultset.getDouble(1));
          value =resultset.getDouble(1);
        }
          %>
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Salary</h4>
        </div>
        <div class="modal-body">
            <p class="bg-info">you got a salary of <%=(value)%> rupees !!!! Keep Rocking</p>
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
   <% }
       catch(Exception e)  {
           Logger.getLogger("brokererIndex").log(Level.SEVERE,"Error in view query");
           }
   %>
    
  </div>
   
   <div class="modal fade" id="clients" role="dialog">
        
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">My Clients</h4>
        </div>
        <div class="modal-body">
              <table class="table table-condensed">
    <thead>
      <tr>
        <th>Holder name</th>
        <th>Holder gmail</th>
        <th>Company Name</th>
      </tr>
    </thead>
    <tbody>
          <%
          try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        boolean clientStatus=true;
        ResultSet resultset = statement.executeQuery("SELECT brokersassigned.holdergmail,shareholder.holdername, company.cname FROM ((brokersassigned INNER JOIN shareholder ON brokersassigned.holdergmail=shareholder.holdergmail and brokersassigned.brokergmail='"+username+"') INNER JOIN company ON brokersassigned.cid = company.cid)");
        while (resultset.next()) {
            clientStatus=false;
            System.out.println("Flow is correct in if ");

          %>
      <tr>
          <td><%=resultset.getString("holdername")%></td>
        <td><%=resultset.getString("holdergmail")%></td>
        <td> <%=resultset.getString("cname")%> </td>
      </tr>
        <% }
        if(clientStatus){
        %>
         <tr class="bg-info">There is  no clients for you </tr>
        <%
}    
}
catch(Exception e)  {
           Logger.getLogger("brokererIndex").log(Level.SEVERE,"Error in table query");
           }
   %>
   </tbody>
  </table>         
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
 
  </div>
   
   
    
   <div class="modal fade" id="region" role="dialog">
        
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">My Clients</h4>
        </div>
        <div class="modal-body">
              <table class="table table-condensed">
    <thead>
      <tr>
        <th>City </th>
        <th>Number of clients</th>
      </tr>
    </thead>
    <tbody>
          <%
          try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        ResultSet resultset = statement.executeQuery("select count(holdergmail) as count,city from shareholder group by city");
        while (resultset.next()) {
            
          %>
      <tr>
          <td><%=resultset.getString("city")%></td>
        <td><%=resultset.getInt("count")%></td>
      </tr>
        <% }    
}
catch(Exception e)  {
           Logger.getLogger("brokererIndex").log(Level.SEVERE,"Error in table query");
           }
   %>
   </tbody>
  </table>         
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
 
  </div>
</body>
</html>
