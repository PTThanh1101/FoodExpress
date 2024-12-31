<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderUserControl.ascx.cs" Inherits="FoodExpress.User.SliderUserControl" %>

<section class="slider_section">
  <div id="customCarousel1" class="carousel slide" data-ride="carousel">
    <!-- Carousel Indicators -->
    <div class="container">
      <ol class="carousel-indicators">
        <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
        <li data-target="#customCarousel1" data-slide-to="1"></li>
        <li data-target="#customCarousel1" data-slide-to="2"></li>
      </ol>
    </div>

    <!-- Carousel Items -->
    <div class="carousel-inner">
      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="container">
          <div class="row">
            <div class="col-md-7 col-lg-6">
              <div class="detail-box">
                <h1>Fast Food Restaurant</h1>
                <p>
                  Experience the best in fast food with delicious, freshly prepared meals delivered to your table or your home. 
                  Quality and speed, all in one!
                </p>
                <div class="btn-box">
                  <a href="Default.aspx" class="btn1">Food Express</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-md-7 col-lg-6">
              <div class="detail-box">
                <h1>Quick & Delicious</h1>
                <p>
                  Craving something quick and satisfying? Look no further. Our menu is designed to cater to your tastes at any time.
                </p>
                <div class="btn-box">
                  <a href="Menu.aspx" class="btn1">Check Our Menu</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Slide 3 -->
 <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-md-7 col-lg-6">
              <div class="detail-box">
                <h1>Contact Us</h1>
                <p>
                  Have questions or need assistance? We're here to help! Reach out to us via our contact page, and we'll get back to you as soon as possible.
                </p>
                <div class="btn-box">
                  <a href="Contact.aspx" class="btn1">Get in Touch</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Carousel Controls -->
    <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</section>
