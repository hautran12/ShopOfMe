<%-- 
    Document   : footer
    Created on : Mar 18, 2019, 12:05:45 AM
    Author     : HauTran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Page</title>
    </head>
    <body>
        <div class="footer">
            <div class="footer-top">
                <div class="container"> 
                    <div class="clearfix"></div>
                </div>
            </div>
            <!---->
            <div class="footer-middle">
                <div class="container">
                    <div class="footer-middle-in">
                        <h6>Về Chúng Tôi</h6>
                        <p>lớp căng thẳng và tiếng cười. Trò chuyện sốt, súp hoặc các yếu tố phát triển, nhưng bây giờ chỉ có nồi buồn, và đôi khi miễn phí buồn nói chung. casino đại học. Sản xuất lorem tiêu dùng.</p>
                    </div>
                    <div class="footer-middle-in">
                        <h6>Thông tin</h6>
                        <ul>
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Thông tin giao hàng</a></li>
                            <li><a href="#">Chính sách bảo hành</a></li>
                            <li><a href="#">Điều khoản và dịch vụ</a></li>
                        </ul>
                    </div>
                    <div class="footer-middle-in">
                        <h6>Dịch vụ khách hàng</h6>
                        <ul>
                            <li><a href="contact.jsp">Liên Hệ Chúng Tôi</a></li>
                            <li><a href="#">Đổi trả</a></li>
                            <li><a href="#">trang web</a></li>
                        </ul>
                    </div>
                    <div class="footer-middle-in">
                        <h6>Tài khoản</h6>
                        <ul>
                            <li><a href="login.jsp">Đăng Nhập</a></li>
                            <li><a href="checkout.jsp">lịch sử đơn hàng</a></li>
                        </ul>
                    </div>
                    <div class="footer-middle-in">
                        <h6>Ngoài ra</h6>
                        <ul>
                            <li><a href="#">Nhãn hiệu</a></li>
                            <li><a href="#">Phiếu quà tặng</a></li>
                            <li><a href="#">Chi nhánh</a></li>
                            <li><a href="#">Đặc biệt</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <p class="footer-class">Template by  <a href="https://www.facebook.com/profile.php?id=100008391887383" target="_blank">Me</a> </p>
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                     var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear' 
                     };
                     */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            <script>
                (function (s, u, b, i, z) {
                    u[i] = u[i] || function () {
                        u[i].t = +new Date();
                        (u[i].q = u[i].q || []).push(arguments);
                    };
                    z = s.createElement('script');
                    var zz = s.getElementsByTagName('script')[0];
                    z.async = 1;
                    z.src = b;
                    z.id = 'subiz-script';
                    zz.parentNode.insertBefore(z, zz);
                })(document, window, 'https://widgetv4.subiz.com/static/js/app.js', 'subiz');
                subiz('setAccount', 'acqhdrriizcvkvwrabyi');
            </script>
        </div>
    </body>
</html>
