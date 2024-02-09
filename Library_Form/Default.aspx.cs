using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Form
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) {
                if (Session["CurrentPageIndex"] != null)
                {
                    GridView1.PageIndex = Convert.ToInt32(Session["CurrentPageIndex"]);
                }
                BindGrid();
                BindDropDownNationality();
            }

        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
            string query = "SELECT * FROM Authors";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void btnAdd(object sender, EventArgs e)
        {
            string AuthorName = txtAuthorName.Text;
           int year = Convert.ToInt32(txtBirthYear.Text);
            string Nationality = ddlNationality.SelectedItem.Text;
            string Biography = txtBiography.Text;
           
            txtAuthorName.Text = "";
            txtBirthYear.Text = "";
            txtBiography.Text = "";
            ddlNationality.SelectedItem.Text = "--select--";

            string query = "INSERT INTO Authors VALUES( @author_name, @birth_year, @nationality,  @biography)";
            string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {

                    cmd.Parameters.AddWithValue("@author_name", AuthorName);
                    cmd.Parameters.AddWithValue("@birth_year", year);
                    cmd.Parameters.AddWithValue("@nationality", Nationality);
                    cmd.Parameters.AddWithValue("@biography", Biography);
                    
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();

        }

        protected void btnClear(object sender, EventArgs e)
        {
            txtAuthorName.Text = "";
            txtBirthYear.Text = "";
            txtBiography.Text = "";
            ddlNationality.SelectedItem.Text = "--select--";

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
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

        protected void OnRowDelete(object sender, GridViewDeleteEventArgs e)
        {
            Session["CurrentPageIndex"] = GridView1.PageIndex;
            int author_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string query = "Delete from Authors where author_id = @author_id";
            string constr = ConfigurationManager.ConnectionStrings["libraryConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@author_id", author_id);
            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            this.BindGrid();
        }

        protected void OnRowEdit(object sender, GridViewEditEventArgs e)
        {
            Session["CurrentPageIndex"] = GridView1.PageIndex;
            int author_id = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);
            Response.Redirect($"Update_Library.aspx?AuthorID="+author_id);

        }
    }
}