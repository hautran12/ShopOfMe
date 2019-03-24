<%-- 
    Document   : contact
    Created on : Mar 18, 2019, 12:36:20 AM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="contact">
                    <h2 class=" contact-in">CONTACT</h2>

                    <div class="col-md-6 contact-top">
                        <h3>Info</h3>
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2017.4089167720717!2d106.67685178522994!3d10.737995756547097!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x31e4d76059405939!2sTroy+University!5e0!3m2!1sen!2s!4v1553396351953" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>s				
                        <ul class="social ">
                            <li><span><i > </i>180 Cao lỗ,Phường 4, quận 8,TP Hồ Chí Minh </span></li>
                            <li><span><i class="down"> </i>+ 00 123 456 7890</span></li>
                            <li><a href="mailto:info@example.com"><i class="mes"> </i>info@example.com</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 contact-top">
                        <h3>Want to work with me?</h3>
                        <div>
                            <span>Your Name </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Your Email </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Subject</span>		
                            <input type="text" value="" >	
                        </div>
                        <div>
                            <span>Your Message</span>		
                            <textarea> </textarea>	
                        </div>
                        <input type="submit" value="SEND" >	
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
