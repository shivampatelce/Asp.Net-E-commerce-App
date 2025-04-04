<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Cart" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FinalProject.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h2 class="text-center mb-5">Cart</h2>

        <div class="table-responsive">
            <asp:Table ID="CartTable" CssClass="table table-bordered text-center" runat="server"></asp:Table>
        </div>

        <div class="d-flex justify-content-center my-3">
            <asp:Button ID="EmptyCart" CssClass="btn btn-danger" runat="server" Text="Empty Cart" OnClick="EmptyCart_Click" />
        </div>

        <div id="BillingSummaryBlock" runat="server" class="card p-4 shadow-sm mb-4">
            <h2 class="text-center">Billing Summary</h2>
            <div class="card-body">
                <div class="mb-2 d-flex justify-content-between">
                    <asp:Label ID="AmountBillLabel" runat="server" Text="Amount: " Font-Bold="True"></asp:Label>
                    <asp:Label ID="Amount" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
                <div class="mb-2 d-flex justify-content-between">
                    <asp:Label ID="TaxLable" runat="server" Text="Tax (13%): " Font-Bold="True"></asp:Label>
                    <asp:Label ID="Tax" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
                <div class="mb-2 d-flex justify-content-between">
                    <asp:Label ID="DiscountLabel" runat="server" Text="Discount: " Font-Bold="True"></asp:Label>
                    <asp:Label ID="Discount" runat="server" Text="$0.00" Font-Bold="True"></asp:Label>
                </div>
                <hr>
                <div class="mb-2 d-flex justify-content-between">
                    <asp:Label ID="TotalAmountLable" runat="server" Text="Total: " Font-Bold="True" CssClass="fw-bold fs-5"></asp:Label>
                    <asp:Label ID="TotalAmount" runat="server" Text="$50" Font-Bold="True" CssClass="fw-bold fs-5"></asp:Label>
                </div>
                <div class="d-flex justify-content-center mt-3">
                    <asp:Button ID="CountinueShopping" CssClass="btn btn-secondary m-2" runat="server" Text="Continue Shopping" OnClick="CountinueShopping_Click" />
                    <asp:Button ID="CheckOut" CssClass="btn btn-primary m-2" runat="server" Text="Check Out" OnClick="CheckOut_Click" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
