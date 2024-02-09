<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library_Form.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Author Details</title>
    
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
            margin-top:20px;
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


   .gridview-container {
      margin-top: 20px;
  }

  .table-responsive {
      overflow-x: auto;
  }

  .gridview {
      width: 100%;
      margin-bottom: 1rem;
      background-color: transparent;
      border-collapse: collapse;
  }

  .gridview th,
  .gridview td {
      padding: .75rem;
      vertical-align: top;
      border-top: 1px solid #dee2e6;
  }

  .gridview thead th {
      vertical-align: bottom;
      border-bottom: 2px solid #dee2e6;
  }

  .gridview tbody + tbody {
      border-top: 2px solid #dee2e6;
  }

  .gridview .table-hover tbody tr:hover {
      background-color: #f8f9fa;
  }

    </style>

</head>
<body>
    <form id="form1" runat="server">
          <div class="container mt-5">
            <h2 class="text-center mb-4">Author Details</h2>
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblAuthorName" Text="Author Name" CssClass="font-weight-bold" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAuthorName" ErrorMessage="Enter Author Name" ForeColor="#CC0000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" ID="txtAuthorName" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblBirthYear" Text="Birth Year" CssClass="font-weight-bold" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBirthYear" ErrorMessage="Enter Birth Year" ForeColor="#CC0000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" ID="txtBirthYear" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblNationality" Text="Nationality" CssClass="font-weight-bold" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlNationality" Display="Dynamic" ErrorMessage="Enter Nationality" ForeColor="#CC0000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:DropDownList runat="server" ID="ddlNationality" CssClass="form-control">
                          
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblBiography" Text="Biography" CssClass="font-weight-bold" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBiography" ErrorMessage="Biography Required" ForeColor="#CC0000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" ID="txtBiography" TextMode="MultiLine" Rows="5" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="text-center">
                <asp:Button runat="server" ID="btnSubmit" Text="ADD" CssClass="btn btn-primary" OnClick="btnAdd"  />
                 <asp:Button runat="server" ID="Button1" Text="RESET" CssClass="btn btn-primary" OnClick="btnClear"  />
            </div>
        </div>

        <%-- Grid View --%>

     <div class="container">
        <div class="gridview-container">
    <asp:GridView 
        ID="GridView1"  
        CssClass="table table-striped table-bordered table-hover gridview"
        DataKeyNames="author_id"
        AutoGenerateColumns="False" 
        runat="server"
        AllowPaging="True"
        PageSize="5"
         OnPageIndexChanging="GridView1_PageIndexChanging"
         OnRowDeleting ="OnRowDelete"
        OnRowEditing ="OnRowEdit"
        >
     <Columns>
     <asp:TemplateField HeaderText="Author ID" ItemStyle-Width="150">
         <ItemTemplate>
             <asp:Label ID="lblAuthor_id" runat="server" Text='<%# Eval("author_id") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtAuthor_id" runat="server" Text='<%# Eval("author_id") %>' Width="140"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Author Name" ItemStyle-Width="150">
         <ItemTemplate>
             <asp:Label ID="lblAuthor_name" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtAuthor_name" runat="server" Text='<%# Eval("author_name") %>' Width="140"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Birth Year" ItemStyle-Width="150">
         <ItemTemplate>
             <asp:Label ID="lblBirth_year" runat="server" Text='<%# Eval("birth_year") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtBirth_year" runat="server" Text='<%# Eval("birth_year") %>' Width="140"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Nationality" ItemStyle-Width="150">
         <ItemTemplate>
             <asp:Label ID="lblNationality" runat="server" Text='<%# Eval("nationality") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtNationality" runat="server" Text='<%# Eval("nationality") %>' Width="140"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Biography" ItemStyle-Width="150">
         <ItemTemplate>
             <asp:Label ID="lblBiography" runat="server" Text='<%# Eval("biography") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox ID="txtBiography" runat="server" Text='<%# Eval("biography") %>' Width="140"></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>


     <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
         ItemStyle-Width="150" />
 </Columns>
</asp:GridView>


     </div>
 </div>
   
    </form>
</body>
</html>
