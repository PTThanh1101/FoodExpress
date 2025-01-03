<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FoodExpress.User.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script> 
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 10;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- book section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>Send your query</h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form_container">
                            <div>
                                <asp:Label ID="lblUserName" runat="server" CssClass="form-control" Text="UserName"></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="lblEmail" runat="server" CssClass="form-control" Text="Email"></asp:Label>
                            </div>                           
                            <div>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is required"
                                     ControlToValidate="txtSubject" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Your Query/Feedback"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is required"
                                     ControlToValidate="txtMessage" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="btn_box">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white"
                                     OnClick="btnSubmit_Click"/>
                            </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- end book section -->


</asp:Content>
