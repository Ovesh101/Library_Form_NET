<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Library.aspx.cs" Inherits="Library_Form.Update_Library" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa; /* Light gray */
            color: #333; /* Dark gray */
        }
        .container {
            background-color: #fff; /* White */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }
        .btn-primary {
            background-color: #007bff; /* Blue */
            border-color: #007bff; /* Blue */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="container mt-5">
            <h2 class="text-center mb-4">Update Author Details</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblAuthorName" Text="Author Name" CssClass="font-weight-bold" />
                        <asp:TextBox runat="server" ID="txtAuthorName" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblBirthYear" Text="Birth Year" CssClass="font-weight-bold" />
                        <asp:TextBox runat="server" ID="txtBirthYear" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblNationality" Text="Nationality" CssClass="font-weight-bold" />
                        <asp:DropDownList runat="server" ID="ddlNationality" CssClass="form-control">
 
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblBiography" Text="Biography" CssClass="font-weight-bold" />
                        <asp:TextBox runat="server" ID="txtBiography" TextMode="MultiLine" Rows="5" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="text-center">
                <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"  />
            </div>
        </div>
    </form>
</body>
</html>
