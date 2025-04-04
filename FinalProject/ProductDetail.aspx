<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Product Details" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="FinalProject.ProductDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container d-flex justify-content-center align-items-center vh-96">
            <div class="row justify-content-center w-100">
                <div class="col-md-10 col-lg-8">
                    <div class="card shadow-lg border-0 text-center p-4">
                        <h2 class="mb-4">Product Details</h2>

                        <div class="w-100">
                            <div class="p-3">
                                <h3 class="mb-3"></h3>
                                <p class="text-muted mb-1">
                                    <strong>Brand:</strong>
                                    <asp:Label ID="BrandName" runat="server" Text="" />
                                </p>
                                <p class="text-muted mb-1">
                                    <strong>Model:</strong>
                                    <asp:Label ID="Model" runat="server" Text="" />
                                </p>
                                <p class="text-muted mb-3">
                                    <strong>Description:</strong><br />
                                    <asp:Label ID="Description" runat="server" Text="" />
                                </p>
                                <h4 class="text-primary mb-4">$<asp:Label ID="Price" runat="server" Text="" /></h4>

                                <p class="h6 m-2 text-muted">
                                    <strong>Quantity</strong>
                                </p>
                                <div class="d-flex justify-content-center align-items-center my-3">
                                    <asp:Button ID="DecreaseQuantity" CssClass="btn btn-outline-secondary" runat="server" Text="-" UseSubmitBehavior="false" OnClick="DecreaseQuantity_Click" />
                                    <asp:TextBox ID="Quantity" CssClass="form-control mx-2 text-center" runat="server" Text="1" ReadOnly="True" Style="width: 50px;" />
                                    <asp:Button ID="IncreaseQuantity" CssClass="btn btn-outline-secondary" runat="server" Text="+" UseSubmitBehavior="false" OnClick="IncreaseQuantity_Click" />
                                </div>

                                <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CssClass="btn btn-primary mb-4"
                                    CommandName="AddToCart" OnClick="AddToCartButton_Click" />

                                <asp:Button ID="RemoveFromCart" Visible="false" runat="server" Text="Remove From Cart" CssClass="btn btn-danger mb-4"
                                    CommandName="RemoveFromCart" OnClick="RemoveFromCart_Click" />
                                <br />
                                <a href="Products.aspx" class="btn btn-outline-secondary me-2">Back to Products</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource
                ID="ProductDetailSqlDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </main>
</asp:Content>
