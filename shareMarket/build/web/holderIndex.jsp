<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

li {
    float: left;
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

.modal-body {
  overflow-x: auto;
  overflow-y: auto;
}


</style>
</head>
<body style="background-color:#212529">
    <%String username=(String)session.getAttribute("username");
%>

<!--Nav bar-->
<ul>
  <li><a title="contact" href="#contact">Contact</a></li>
  <li><a title="about" href="#about">About</a></li>
  <li><a title="Buy" data-toggle="modal" data-target="#buymodal">Buy</a></li>
  <li><a title="Sell" data-toggle="modal" data-target="#sellmodal">Sell</a></li>
  <li><a title="My status" data-toggle="modal" data-target="#mybrokermodal">My Shares</a></li>
   <li><a title="Sell status" data-toggle="modal" data-target="#mysellmodal">Sold Shares</a></li>
  
<!--  <li><a data-toggle="modal" data-target="#mysharemodal"></a></li>-->
   <li title="Logout" style="float:right"><a href="signout.do">log out</span></a></li>
    <li title="Welcome<%=username%>" style="float:right"><a><%=username%></a></li>
</ul>

<!--<!..slide images..>-->
<br>
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
<br>
<div id="about">
<h1 class="w3-opacity-max w3-text-white" style="text-align:center;">BUILD YOUR OWN DREAMS</h1>
<h4 class="w3-opacity w3-text-white" style="text-align:center;font-family:verdana;"><b>This company tells about current company shares and their status.we start this service in 1999.Our other achiements are app@here.Our company's owner studied in canada but they worked here for years to make our country wealth
</b></h4>
</div>
<br>
</br>
<div align="center">
<form id="contact" class=" w3-card-4 w3-light-grey w3-text-black w3-margin " style="width:70%;">
<h2 class="w3-center">Any queries</h2>
 
<div class="w3-row w3-section">
  <div class="w3-col" style="width:70px"><i class="glyphicon glyphicon-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="first" type="text" placeholder="First Name">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:70px"><i class="glyphicon glyphicon-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="last" type="text" placeholder="Last Name">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:70px"><i class="glyphicon glyphicon-envelope"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="email" type="text" placeholder="Email">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:70px"><i class="glyphicon glyphicon-phone"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="phone" type="text" placeholder="Phone">
    </div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:70px"><i class="glyphicon glyphicon-pencil"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="message" type="text" placeholder="Message">
    </div>
</div>

<button class="w3-button w3-block w3-section w3-light-grey w3-ripple w3-padding w3-container">Send</button>

</form>
</diV>

 <!-- buyModal -->
  <div class="modal fade" id="buymodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Share Market</h4>
        </div>
        <div class="modal-body">
 <form class="w3-container" method="post" action="holderIndexController.do">
 <p>Brokergmail</p>
  <input class="w3-input w3-animate-input" type="email" style="width:135px" autofocus  name="brokeremail" required><br>
  <p>Companyid</p>
  <input class="w3-input  w3-animate-input" type="text" name="cid" style="width:135px"  required><br>
  <p>Amount</p>
  <input class="w3-input  w3-animate-input" type="int" style="width:135px" name="rupee"  required><br>
   <input type="hidden" name="holdergmail" value=${username}>
  <input type="hidden" name="hiddeninput" value="buyShare">
  <p></p>
   <input type="submit" class="w3-button w3-black" value="Buy">
</form>
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!--sellmodal -->
  <div class="modal fade" id="sellmodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Share Market</h4>
        </div>
        <div class="modal-body">
 <form class="w3-container" method="post" action="sell.do">
 <p>Brokergmail</p>
  <input class="w3-input w3-animate-input" type="email" style="width:135px" autofocus  name="email" required><br>
  <p>Companyid</p>
  <input class="w3-input  w3-animate-input" type="text" name="cid" style="width:135px"  required><br>
  <p>Amount</p>
  <input class="w3-input  w3-animate-input" type="int" style="width:135px" name="sellamount" required><br>
  <p></p>
   <input type="hidden" name="holdergmail" value=${username}>
   <input type="submit" class="w3-button w3-black" value="Sell">
</form>
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="mybrokermodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Brokers List</h4>
        </div>
        <div class="modal-body">
             <table class="table table-condensed">
    <thead>
      <tr>
        <th>Broker name</th>
        <th>Broker Gmail</th>
        <th>Company Name</th>
        <th>Date of Buy</th>
        <th>Purchased Amount</th>
        <th>Predicated Sell Amount</th>
      </tr>
    </thead>
    <tbody>
     <% 
      try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        ResultSet resultset = statement.executeQuery("SELECT brokersassigned.brokergmail,stockbroker.brokername, company.cname, BROKERSASSIGNED.RUPEE as buyAmount, BROKERSASSIGNED.DOFSELL, sellAmount.SellAmount FROM (((brokersassigned INNER JOIN stockbroker ON brokersassigned.brokergmail=stockbroker.brokergmail and brokersassigned.holdergmail='"+username+"')INNER JOIN company ON brokersassigned.cid = company.cid) INNER JOIN sellamount ON BROKERSASSIGNED.CID = SELLAMOUNT.CID)");
        while (resultset.next()) {

     %>
      <tr>
          <td><%=resultset.getString("brokername")%></td>
        <td><%=resultset.getString("brokergmail")%></td>
        <td> <%=resultset.getString("cname")%> </td>
        <td> <%=resultset.getDate("DofSell")%> </td>
        <td> <%=resultset.getDouble("buyamount")%> </td>
        <td> <%=resultset.getDouble("sellAmount")%> </td>
      </tr>
      <%
          }
}catch(Exception e){
Logger.getLogger("holderIndex").log(Level.SEVERE,"Error in join query");
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
   
      <div class="modal fade" id="mysharemodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Brokers List</h4>
        </div>
        <div class="modal-body">
             <table class="table table-condensed">
    <thead>
       <tr>
        <th>share id</th>
        <th>company id</th>
        <th>quantity</th>
	 <th>Amount</th>
      </tr>      
    </thead>
    <tbody>
     <% %>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
            
    </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
      

 <div class="modal fade" id="mysellmodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:green">Sold Shares List</h4>
        </div>
        <div class="modal-body">
             <table class="table table-condensed">
    <thead>
      <tr>
        <th>Broker name</th>
         <th>Broker gmail</th>
        <th>Company Name</th>
        <th>Date of Sell</th>
        <th>Sold Amount</th>
      </tr>
    </thead>
    <tbody>
     <% 
      try {
         Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
        ResultSet resultset = statement.executeQuery("SELECT sell.brokergmail,sell.RUPEE,sell.DOFSELL,stockbroker.brokername, company.cname FROM ((sell INNER JOIN stockbroker ON sell.brokergmail=stockbroker.brokergmail and sell.holdergmail='"+username+"') INNER JOIN company ON sell.cid = company.cid) order by sell.DOFSELL");
        while (resultset.next()) {

     %>
      <tr>
          <td><%=resultset.getString("brokername")%></td>
        <td><%=resultset.getString("brokergmail")%></td>
        <td> <%=resultset.getString("cname")%> </td>
        <td> <%=resultset.getDate("DOFSELL")%> </td>
        <td> <%=resultset.getDouble("RUPEE")%> </td>
      </tr>
      <%
          }
}catch(Exception e){
Logger.getLogger("holderIndex").log(Level.SEVERE,"Error in sell join query");
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

