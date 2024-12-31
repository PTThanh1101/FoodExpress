<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FoodExpress.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container">

      <div class="row">
        <div class="col-md-6">
          <div class="img-box">
            <img src="../TemplateFiles/images/about-img.png" alt="About FoodExpress">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>Welcome to FoodExpress</h2>
            </div>
            <p>
              At <strong>FoodExpress</strong>, we are passionate about delivering delicious, high-quality food to your doorstep. 
              Our mission is to make dining easy, convenient, and enjoyable for everyone. Whether you're craving a hearty meal, 
              a quick snack, or something sweet, FoodExpress is here to serve you with the best.
            </p>
            <h3>Our Mission</h3>
            <p>
              To connect people with the food they love, ensuring top-notch quality, fast delivery, and exceptional customer service.
            </p>
            <h3>Our Vision</h3>
            <p>
              To be the leading online food delivery platform, bringing joy and convenience to food lovers everywhere.
            </p>
            <h3>Why Choose Us?</h3>
            <ul>
              <li><strong>Wide Selection:</strong> Explore a diverse range of cuisines and dishes to satisfy your cravings.</li>
              <li><strong>Fast Delivery:</strong> Our efficient delivery system ensures your food arrives hot and fresh.</li>
              <li><strong>Top Quality:</strong> We partner with the best restaurants to bring you premium-quality meals.</li>
              <li><strong>24/7 Support:</strong> Our customer service team is always ready to assist you.</li>
            </ul>
            <h3>Join Us</h3>
            <p>
              Be part of the FoodExpress family and enjoy the convenience of online food delivery. Whether you're ordering for yourself, 
              your family, or your office, we ensure a seamless experience every time.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end about section -->

</asp:Content>
