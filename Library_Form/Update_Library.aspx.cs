using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Library_Form
{
    public partial class Update_Library : System.Web.UI.Page
    {
        private int AuthorID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            AuthorID = Convert.ToInt32(Request.QueryString["AuthorID"]);
            if (!IsPostBack)
            {
                BindDropDownNationality();


                if (Request.QueryString["AuthorID"] != null)
                {
                    string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
                    string query = "SELECT * FROM Authors WHERE author_id = @AuthorID";
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                        {
                            sda.SelectCommand.Parameters.AddWithValue("@AuthorID", AuthorID);

                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    DataRow dataRow = dt.Rows[0];

                                    txtAuthorName.Text = dataRow["author_name"].ToString();
                                    txtBirthYear.Text = dataRow["birth_year"].ToString();

                                    txtBiography.Text = dataRow["biography"].ToString();
                                    string nationality = dataRow["nationality"].ToString();
                                   
                                    
                                    if (ddlNationality.Items.FindByText(nationality) != null)
                                    {
                                       ddlNationality.SelectedValue = ddlNationality.Items.FindByText(nationality).Value;   
                                    }

                                }
                            }
                        }
                    }
                }
            }
        }

        protected void BindDropDownNationality()
        {
            string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
            SqlConnection con = new SqlConnection(constr);
            string com = "select -1 as NationalityID, '--select--' as NationalityName union all Select * from Nationality";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlNationality.DataSource = dt;
            ddlNationality.DataTextField = "NationalityName";
            ddlNationality.DataValueField = "NationalityID";
            ddlNationality.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string updateAuthorName = txtAuthorName.Text;
            int updatedBirthYear = Convert.ToInt32(txtBirthYear.Text);
            string updatedBiography = txtBiography.Text;
            string updatedNationality = ddlNationality.SelectedItem.Text;
           

            string query = "UPDATE Authors SET author_name=@updatedAuthorName, birth_year=@updatedBirthYear, nationality=@updatedNationality, biography = @updatedBiography  WHERE author_id=@AuthorID";
            string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {

                    cmd.Parameters.AddWithValue("@updatedAuthorName", updateAuthorName);
                    cmd.Parameters.AddWithValue("@updatedBirthYear", updatedBirthYear);
                    cmd.Parameters.AddWithValue("@updatedNationality", updatedNationality);
                    cmd.Parameters.AddWithValue("@AuthorID", AuthorID);
                    cmd.Parameters.AddWithValue("@updatedBiography", updatedBiography);
                  

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Default.aspx");

                }

            }

        }
    }
}