using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string sqlallMember = "select * from Appointment_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Appointment_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            string sql = "select * from Appointment_Information";

            if (dataOperate.seleSQL(sql) > 0)
            {
                this.GridView1.DataSource = dataOperate.getDataset(sql, "DoctorID");
                this.GridView1.DataBind();

                for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    DataSet myds = new DataSet();
                    myds = dataOperate.getDataset("select * from Appointment_Information where DoctorID='" + GridView1.Rows[i].Cells[1].Text + "' and SubmitTime='" + GridView1.Rows[i].Cells[2].Text + "'", "Appointment_Information");
                    if (myds.Tables["Appointment_Information"].Rows.Count > 0)
                    {
                        DataRowView mydrv = myds.Tables["Appointment_Information"].DefaultView[0];
                        string score = Convert.ToString(mydrv["Info"]);
                        if (score == "1")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Proved";

                        }
                        else if (score == "2")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Deny";

                        }
                    }

                }
            }


            string sql1 = "select * from Member_Information where MemberDepartment='Doctor'";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql1, "Member_Information");
            DataView rowview1 = ds1.Tables["Member_Information"].DefaultView;
            DropDownList3.DataSource = rowview1;
            DropDownList3.DataValueField = "MemberID";
            DropDownList3.DataBind();

            this.Label10.Visible = false;
            this.Label11.Visible = false;

            Session["ID"] = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Appointment_Information";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Appointment_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
 
    protected void Button2_Click(object sender, EventArgs e)
    {

        string id = DropDownList3.SelectedValue.ToString();
        string time = DateTime.Now.ToString();
        string ct = md.Text;


        string sqltj1 = "insert into Appointment_Information(DoctorID,PatientID,SubmitTime,AppointmentInfo,Info) values('"+id+"','"+Convert.ToString(Session["IDLogin"])+"','"+time+"','"+ct+"','0')";
        if (dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Add member successful！')</script>");

            string sqlallMember = "select * from Appointment_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Appointment_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            string sql = "select * from Appointment_Information";

            if (dataOperate.seleSQL(sql) > 0)
            {
                this.GridView1.DataSource = dataOperate.getDataset(sql, "DoctorID");
                this.GridView1.DataBind();

                for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    DataSet myds = new DataSet();
                    myds = dataOperate.getDataset("select * from Appointment_Information where DoctorID='" + GridView1.Rows[i].Cells[1].Text + "' and SubmitTime='" + GridView1.Rows[i].Cells[2].Text + "'", "Appointment_Information");
                    if (myds.Tables["Appointment_Information"].Rows.Count > 0)
                    {
                        DataRowView mydrv = myds.Tables["Appointment_Information"].DefaultView[0];
                        string score = Convert.ToString(mydrv["Info"]);
                        if (score == "1")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Proved";

                        }
                        else if (score == "2")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Deny";

                        }
                    }

                }
            }


            string sql1 = "select * from Member_Information where MemberDepartment='Doctor'";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql1, "Member_Information");
            DataView rowview1 = ds1.Tables["Member_Information"].DefaultView;
            DropDownList3.DataSource = rowview1;
            DropDownList3.DataValueField = "MemberID";
            DropDownList3.DataBind();

            this.Label10.Visible = false;
            this.Label11.Visible = false;
            //Response.Write("<script>alert('添加学生成功！');location.href='xuesheng.aspx';</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add member failed！')</script>");
            string sqlallMember = "select * from Appointment_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Appointment_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            string sql = "select * from Appointment_Information";

            if (dataOperate.seleSQL(sql) > 0)
            {
                this.GridView1.DataSource = dataOperate.getDataset(sql, "DoctorID");
                this.GridView1.DataBind();

                for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    DataSet myds = new DataSet();
                    myds = dataOperate.getDataset("select * from Appointment_Information where DoctorID='" + GridView1.Rows[i].Cells[1].Text + "' and SubmitTime='" + GridView1.Rows[i].Cells[2].Text + "'", "Appointment_Information");
                    if (myds.Tables["Appointment_Information"].Rows.Count > 0)
                    {
                        DataRowView mydrv = myds.Tables["Appointment_Information"].DefaultView[0];
                        string score = Convert.ToString(mydrv["Info"]);
                        if (score == "1")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Proved";

                        }
                        else if (score == "2")
                        {
                            GridView1.Rows[i].Cells[3].Text = "Deny";

                        }
                    }

                }
            }


            string sql1 = "select * from Member_Information where MemberDepartment='Doctor'";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql1, "Member_Information");
            DataView rowview1 = ds1.Tables["Member_Information"].DefaultView;
            DropDownList3.DataSource = rowview1;
            DropDownList3.DataValueField = "MemberID";
            DropDownList3.DataBind();

            this.Label10.Visible = false;
            this.Label11.Visible = false;
        }
 
    }
    

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(Convert.ToString(Session["search"]), "Member_Information");
        this.GridView1.DataBind();
    }





   


    protected void DSD_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string did = GridView1.Rows[i].Cells[1].Text;
                string sbt = GridView1.Rows[i].Cells[3].Text;

                string sqlr = "Delete Appointment_Information where DoctorID='"+did+"' and PatientID='"+Convert.ToString(Session["IDLogin"])+"' and SubmitTime='"+sbt+"'";
                int a = 0;
                a = dataOperate.SqlENQ(sqlr);
                if (a > 0 && dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Delete Successful！')</script>");

                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Delete failed！')</script>");

                }

            }
        }

        string sqlallMember = "select * from Appointment_Information";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Appointment_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
        string sql = "select * from Appointment_Information";

        if (dataOperate.seleSQL(sql) > 0)
        {
            this.GridView1.DataSource = dataOperate.getDataset(sql, "DoctorID");
            this.GridView1.DataBind();

            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                DataSet myds = new DataSet();
                myds = dataOperate.getDataset("select * from Appointment_Information where DoctorID='" + GridView1.Rows[i].Cells[1].Text + "' and SubmitTime='" + GridView1.Rows[i].Cells[2].Text + "'", "Appointment_Information");
                if (myds.Tables["Appointment_Information"].Rows.Count > 0)
                {
                    DataRowView mydrv = myds.Tables["Appointment_Information"].DefaultView[0];
                    string score = Convert.ToString(mydrv["Info"]);
                    if (score == "1")
                    {
                        GridView1.Rows[i].Cells[3].Text = "Proved";

                    }
                    else if (score == "2")
                    {
                        GridView1.Rows[i].Cells[3].Text = "Deny";

                    }
                }

            }
        }


        string sql1 = "select * from Member_Information where MemberDepartment='Doctor'";
        DataSet ds1 = new DataSet();
        ds1 = dataOperate.getDataset(sql1, "Member_Information");
        DataView rowview1 = ds1.Tables["Member_Information"].DefaultView;
        DropDownList3.DataSource = rowview1;
        DropDownList3.DataValueField = "MemberID";
        DropDownList3.DataBind();
        Session["search"] = sqlallMember;
    }


}