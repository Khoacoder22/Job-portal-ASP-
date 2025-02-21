﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineJobPortal.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                // Sử dụng tên stored procedure
                cmd = new SqlCommand("InsertContact", con); 
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@Name", name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "Thanks for reaching out. We will read your sent infor!";
                    lbMsg.CssClass = "alert alert-success";
                    clear();
                }
                else
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "Cannot save record right now, please try again later.";
                    lbMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }


        private void clear()
        {
            name.Value = string.Empty;
            email.Value = string.Empty;
            subject.Value = string.Empty;
            message.Value = string.Empty;
        }
    }
}