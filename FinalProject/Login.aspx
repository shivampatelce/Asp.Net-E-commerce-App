<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProject.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="card p-4 shadow-lg" style="max-width: 400px; width: 100%;">
                <div class="d-flex flex-column align-items-center text-center w-100">
                    <h3 class="mb-4">Login</h3>
                    <div class="w-75 text-start">
                        <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="FirstName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" CssClass="text-danger" runat="server" ControlToValidate="FirstName" ErrorMessage="You must enter a first name."></asp:RequiredFieldValidator>
                    </div>

                    <div class="w-75 text-start">
                        <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="LastName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" CssClass="text-danger" runat="server" ControlToValidate="LastName" ErrorMessage="You must enter a last name."></asp:RequiredFieldValidator>
                    </div>

                    <div class="d-grid w-75">
                        <asp:Button ID="LoginButton" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="LoginButton_Click" />
                    </div>

                    <div class="d-grid w-75 mt-2">
                        <asp:Button ID="CancelButton" CssClass="btn btn-secondary" runat="server" Text="Cancel" OnClientClick="window.location.href='Default'; return false;" />
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
