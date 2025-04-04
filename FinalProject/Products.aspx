<%@ Page Title="Products" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FinalProject.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container py-5">
            <h2 class="text-center mb-5">Product Catalog</h2>

            <!-- Category Filter -->
            <div class="row justify-content-center mb-4">
                <div class="col-auto text-center">
                    <asp:Label ID="SelectCategoryLabel" runat="server" Text="Select Category" CssClass="h5 fw-bold me-2" />
                    <asp:DropDownList ID="SelectCategoryDropDownList" runat="server"
                        CssClass="form-select d-inline-block w-auto"
                        AutoPostBack="True"
                        DataSourceID="SelectCategorySqlDataSource"
                        DataTextField="CategoryName"
                        DataValueField="CategoryID" />
                    <asp:SqlDataSource ID="SelectCategorySqlDataSource" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * FROM [Categories]" />
                </div>
            </div>

            <!-- Product Cards -->
            <asp:ListView ID="ProductListView" runat="server" DataSourceID="ProductsSqlDataSource">
                <LayoutTemplate>
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 shadow-sm border-0">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="card-text">
                                    <strong>Brand:</strong> <%# Eval("Brand") %><br />
                                    <strong>Model:</strong> <%# Eval("ModelName") %><br />
                                    <strong>Description:</strong> <%# Eval("Description") %><br />
                                    <strong>Price:</strong> $<%# Eval("Price", "{0:N2}") %>
                                </p>
                            </div>
                            <div class="card-footer bg-white border-0 d-flex justify-content-between">
                                <asp:Button ID="MoreDetailsButton" runat="server" Text="More Details" CssClass="btn btn-outline-primary btn-sm"
                                    OnClientClick='<%# "window.location.href=\"ProductDetail.aspx?ProductID=" + Eval("ProductID") + "\"; return false;" %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="ProductsSqlDataSource" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SelectCategoryDropDownList" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </main>
</asp:Content>
