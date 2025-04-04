<%@ Page Title="Admin" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalProject.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container py-4">
            <h2 class="text-center mb-4">Admin</h2>

            <!-- Category Dropdown -->
            <div class="card p-4 mb-4 shadow-sm">
                <div class="mb-3">
                    <label for="CategoryDropDownList" class="form-label">Select Category</label>
                    <asp:DropDownList ID="CategoryDropDownList" CssClass="form-select text-center" runat="server" AutoPostBack="True" DataSourceID="CategoriesAdminSqlDataSource" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                </div>
            </div>
            <asp:SqlDataSource ID="CategoriesAdminSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>

            <!-- Filtered Products Table -->
            <div class="table-responsive my-4">
                <asp:GridView ID="ProductGrid" CssClass="table table-striped table-bordered table-hover" runat="server" DataSourceID="ProductsAdminGridViewSqlDataSource" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                        <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="ProductsAdminGridViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CategoryDropDownList" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- Categories CRUD -->
            <div class="card p-4 my-4 shadow-sm">
                <h5 class="mb-3">Manage Categories</h5>
                <div class="table-responsive">
                    <asp:GridView ID="CategoryGridView" CssClass="table table-bordered table-hover" runat="server" DataSourceID="CategoryGridViewSqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ReadOnly="True" SortExpression="CategoryID" />
                            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:SqlDataSource ID="CategoryGridViewSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @original_CategoryID AND [CategoryName] = @original_CategoryName"
                InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName]) VALUES (@CategoryID, @CategoryName)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Categories]"
                UpdateCommand="UPDATE [Categories] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @original_CategoryID AND [CategoryName] = @original_CategoryName">
                <DeleteParameters>
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                    <asp:Parameter Name="original_CategoryName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="CategoryName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                    <asp:Parameter Name="original_CategoryName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <!-- Product List with Select -->
            <div class="card p-4 my-4 shadow-sm">
                <h5 class="mb-3">Select Product</h5>
                <div class="table-responsive">
                    <asp:GridView ID="ProductGridView" CssClass="table table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ProductsGridSqlDataSource" DataKeyNames="ProductID">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:SqlDataSource ID="ProductsGridSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [Brand] = @original_Brand AND [ModelName] = @original_ModelName AND [Description] = @original_Description AND [Price] = @original_Price AND [CategoryID] = @original_CategoryID"
                InsertCommand="INSERT INTO [Products] ([ProductID], [Name], [Brand], [ModelName], [Description], [Price], [CategoryID]) VALUES (@ProductID, @Name, @Brand, @ModelName, @Description, @Price, @CategoryID)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Products]"
                UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Brand] = @Brand, [ModelName] = @ModelName, [Description] = @Description, [Price] = @Price, [CategoryID] = @CategoryID WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [Brand] = @original_Brand AND [ModelName] = @original_ModelName AND [Description] = @original_Description AND [Price] = @original_Price AND [CategoryID] = @original_CategoryID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Brand" Type="String" />
                    <asp:Parameter Name="original_ModelName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Brand" Type="String" />
                    <asp:Parameter Name="original_ModelName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <!-- Product Details View -->
            <div class="card p-4 my-4 shadow-sm">
                <h5 class="mb-3">Product Details</h5>
                <asp:DetailsView ID="ProductDetailView" CssClass="table table-striped table-hover" runat="server" DataSourceID="ProductDetailSqlDataSource">
                    <Fields>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
            <asp:SqlDataSource ID="ProductDetailSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [Brand] = @original_Brand AND [ModelName] = @original_ModelName AND [Description] = @original_Description AND [Price] = @original_Price AND [CategoryID] = @original_CategoryID"
                InsertCommand="INSERT INTO [Products] ([ProductID], [Name], [Brand], [ModelName], [Description], [Price], [CategoryID]) VALUES (@ProductID, @Name, @Brand, @ModelName, @Description, @Price, @CategoryID)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)"
                UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Brand] = @Brand, [ModelName] = @ModelName, [Description] = @Description, [Price] = @Price, [CategoryID] = @CategoryID WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [Brand] = @original_Brand AND [ModelName] = @original_ModelName AND [Description] = @original_Description AND [Price] = @original_Price AND [CategoryID] = @original_CategoryID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Brand" Type="String" />
                    <asp:Parameter Name="original_ModelName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProductGridView" Name="ProductID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Brand" Type="String" />
                    <asp:Parameter Name="ModelName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Brand" Type="String" />
                    <asp:Parameter Name="original_ModelName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_CategoryID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </main>
</asp:Content>
