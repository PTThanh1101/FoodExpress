<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodExpress.User.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->
    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="reCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box ">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# FoodExpress.Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    &nbsp;</div>
                                    <div class="detail-box">
                                        <h6> <span><%# Eval("Name") %></span></h6>
                                        

                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Order Now
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                        <g>
                                            <g>
                                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                            </g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->

    <!-- about section -->

    <section class="about_section layout_padding-bottom">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../TemplateFiles/images/about-img.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are FoodExpress
              </h2>
                        </div>
                        <p>
                            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration
              in some form, by injected humour, or randomised words which don't look even slightly believable. If you
              are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in
              the middle of text. All
           
                        </p>
                        <a href="About.aspx">Read More About US</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

<!-- client section -->

<section class="client_section layout_padding-bottom pt-5">
    <div class="container">
        <div class="heading_container heading_center psudo_white_primary mb_45">
            <h2>What Did Our Customers Say?</h2>
        </div>
        <div class="carousel-wrap row">
            <div class="owl-carousel client_owl-carousel">
                <!-- Review 1 -->
                <div class="item">
                    <div class="box">
                        <div class="detail-box">
                            <p>
                                The food here is absolutely incredible! Every dish was bursting with flavor, and the presentation was stunning. 
                                The staff was so friendly and attentive, making the experience even better. Highly recommend the grilled salmon and the tiramisu for dessert!
                            </p>
                            <h6>Emily Johnson</h6>
                            <p>Rating: ★★★★★</p>
                        </div>
                        <div class="img-box">
                            <img src="../TemplateFiles/images/client1.jpg" alt="" class="box-img">
                        </div>
                    </div>
                </div>
                <!-- Review 2 -->
                <div class="item">
                    <div class="box">
                        <div class="detail-box">
                            <p>
                                I loved the cozy atmosphere and the variety on the menu. The pasta dishes were delightful, and the dessert options were to die for. 
                                My only complaint is that the service was a bit slow during peak hours.
                            </p>
                            <h6>Mike Hamell</h6>
                            <p>Rating: ★★★★☆</p>
                        </div>
                        <div class="img-box">
                            <img src="../TemplateFiles/images/client2.jpg" alt="" class="box-img">
                        </div>
                    </div>
                </div>
                <!-- Review 3 -->
                <div class="item">
                    <div class="box">
                        <div class="detail-box">
                            <p>
                                The burgers are phenomenal! Juicy, perfectly cooked, and served with the best crispy fries I've ever had. 
                                I'll definitely be coming back to try more from the menu.
                            </p>
                            <h6>James Carter</h6>
                            <p>Rating: ★★★★★</p>
                        </div>
                        <div class="img-box">
                            <img src="../TemplateFiles/images/client3.jpg" alt="" class="box-img">
                        </div>
                    </div>
                </div>
                <!-- Review 4 -->
                <div class="item">
                    <div class="box">
                        <div class="detail-box">
                            <p>
                                The ambiance was great, and the staff was welcoming. However, I found the steak to be slightly under-seasoned. 
                                Overall, a good experience, but there's room for improvement.
                            </p>
                            <h6>Sarah White</h6>
                            <p>Rating: ★★★☆☆</p>
                        </div>
                        <div class="img-box">
                            <img src="../TemplateFiles/images/client4.jpg" alt="" class="box-img">
                        </div>
                    </div>
                </div>
                <!-- Review 5 -->
                <div class="item">
                    <div class="box">
                        <div class="detail-box">
                            <p>
                                Fantastic restaurant! The vegetarian options are some of the best I’ve seen, and the smoothies are a must-try. 
                                The staff was attentive and made excellent recommendations.
                            </p>
                            <h6>Linda Green</h6>
                            <p>Rating: ★★★★★</p>
                        </div>
                        <div class="img-box">
                            <img src="../TemplateFiles/images/client5.jpg" alt="" class="box-img">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end client section -->


</asp:Content>
