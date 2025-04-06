<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Checkout" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="FinalProject.Checkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h2 class="text-center mb-5">Checkout</h2>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" />
        <div class="card p-4 shadow-sm my-4">
            <div class="row g-4">

                <div class="col-md-6">
                    <h4>Contact Information</h4>
                    <div class="form-group mb-3">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" />
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName" />
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email Address" AssociatedControlID="txtEmail" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone Number" AssociatedControlID="txtPhone" />
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is required." CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>

                <div class="col-md-6">
                    <h4>Billing Address</h4>
                    <div class="form-group mb-3">
                        <asp:Label ID="lblAddress" runat="server" Text="Address" AssociatedControlID="txtAddress" />
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="txtCity" />
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblProvince" runat="server" Text="Province" AssociatedControlID="ddlProvince" />
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select Province--" Value="" />
                            <asp:ListItem>Alberta</asp:ListItem>
                            <asp:ListItem>British Columbia</asp:ListItem>
                            <asp:ListItem>Manitoba</asp:ListItem>
                            <asp:ListItem>New Brunswick</asp:ListItem>
                            <asp:ListItem>Newfoundland and Labrador</asp:ListItem>
                            <asp:ListItem>Nova Scotia</asp:ListItem>
                            <asp:ListItem>Ontario</asp:ListItem>
                            <asp:ListItem>Prince Edward Island</asp:ListItem>
                            <asp:ListItem>Quebec</asp:ListItem>
                            <asp:ListItem>Saskatchewan</asp:ListItem>
                            <asp:ListItem>Northwest Territories</asp:ListItem>
                            <asp:ListItem>Nunavut</asp:ListItem>
                            <asp:ListItem>Yukon</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ControlToValidate="ddlProvince" InitialValue="" ErrorMessage="Province is required." CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code" AssociatedControlID="txtPostalCode" />
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code is required." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Invalid Postal Code (e.g., A1A 1A1)" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d$" />
                    </div>
                </div>
            </div>

            <div class="row mt-4">

                <div class="col-md-6">
                    <h4>Card Information</h4>

                    <div class="form-group mb-3">
                        <label for="txtCardName" class="form-label">Name on Card</label>
                        <asp:TextBox ID="txtCardName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvCardName" runat="server"
                            ControlToValidate="txtCardName"
                            ErrorMessage="Name on card is required."
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label for="txtCardNumber" class="form-label">Card Number</label>
                        <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="16" />
                        <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server"
                            ControlToValidate="txtCardNumber"
                            ErrorMessage="Card number is required."
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revCardNumber" runat="server"
                            ControlToValidate="txtCardNumber"
                            ErrorMessage="Card number must be exactly 16 digits."
                            ValidationExpression="^\d{16}$"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-row d-flex gap-3">
                        <div class="form-group mb-3">
                            <label for="txtExpiry" class="form-label">Expiry Date (MM/YY)</label>
                            <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" placeholder="MM/YY" />
                            <asp:RequiredFieldValidator ID="rfvExpiry" runat="server"
                                ControlToValidate="txtExpiry"
                                ErrorMessage="Expiry date is required."
                                CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revExpiry" runat="server"
                                ControlToValidate="txtExpiry"
                                ErrorMessage="Invalid expiry format. Use MM/YY."
                                ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtCVV" class="form-label">CVV</label>
                            <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" TextMode="Password" MaxLength="3" />
                            <asp:RequiredFieldValidator ID="rfvCVV" runat="server"
                                ControlToValidate="txtCVV"
                                ErrorMessage="CVV is required."
                                CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revCVV" runat="server"
                                ControlToValidate="txtCVV"
                                ErrorMessage="CVV must be 3 digits."
                                ValidationExpression="^\d{3}$"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card p-4 shadow-sm">
                        <h4>Total Payment Summary</h4>
                        <div class="d-flex justify-content-between">
                            <span>Subtotal:</span>
                            <asp:Label ID="lblSubtotal" runat="server" Text="$0.00"></asp:Label>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>Tax (13%):</span>
                            <asp:Label ID="lblTax" runat="server" Text="$0.00"></asp:Label>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between fw-bold">
                            <span>Total:</span>
                            <asp:Label ID="lblTotal" runat="server" Text="$0.00"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>


            <div class="d-flex justify-content-center gap-3">
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary px-5" OnClick="btnCheckout_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn btn-secondary px-5" OnClick="btnCancel_Click" CausesValidation="False" />
            </div>
        </div>
    </main>
</asp:Content>
