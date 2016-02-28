using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        this.GridView2.DataSource = dataOperate.getDataset("select * from Member_Information", "Member_Information");
        this.GridView2.DataBind();
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        if (fuload.FileName == "")
        {
            lbmsg.Text = "Please select file!";
            return;
        }
        string fileExtenSion;
        fileExtenSion = Path.GetExtension(fuload.FileName);
        if (fileExtenSion.ToLower() != ".xls" && fileExtenSion.ToLower() != ".xlsx")
        {
            lbmsg.Text = "File type you update is wroing!";
            return;
        }
        try
        {
            string FileName = Path.GetFileName(fuload.FileName);
            if (File.Exists(Server.MapPath(FileName)))
            {
                File.Delete(Server.MapPath(FileName));
            }
            fuload.SaveAs(Server.MapPath(FileName));
            //HDR=Yes，这代表第一行是标题，不做为数据使用 ，如果用HDR=NO，则表示第一行不是标题，做为数据来使用。系统默认的是YES
            string connstr2003 = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(FileName) + ";Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'";
            string connstr2007 = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath(FileName) + ";Extended Properties=\"Excel 12.0;HDR=YES\"";
            OleDbConnection conn;
            if (fileExtenSion.ToLower() == ".xls")
            {
                conn = new OleDbConnection(connstr2003);
            }
            else
            {
                conn = new OleDbConnection(connstr2007);
            }
            conn.Open();
            string sql = "select * from [Sheet1$]";
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            DataTable dt = new DataTable();
            OleDbDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            sdr.Close();
            conn.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (dt.Columns.Count != 10)
            {
                lbmsg.Text = "Please select right data form!";
                return;
            }
            if (dt.Rows.Count < 1)
            {
                lbmsg.Text = "Please select right data form!";
                return;
            }
            if (dt.Columns[0].ColumnName.ToString() != "MemberID" || dt.Columns[1].ColumnName.ToString() != "MemberName" || dt.Columns[2].ColumnName.ToString() != "MemberGender" || dt.Columns[3].ColumnName.ToString() != "MemberAge" || dt.Columns[4].ColumnName.ToString() != "MemberDepartment" || dt.Columns[5].ColumnName.ToString() != "MemberEmail" || dt.Columns[6].ColumnName.ToString() != "MemberTel" || dt.Columns[7].ColumnName.ToString() != "MemberAddress" || dt.Columns[8].ColumnName.ToString() != "MemberComment" || dt.Columns[9].ColumnName.ToString()!="MemberInfo")
            {
                lbmsg.Text = "Please select right data form!";
                return;
            }
            if (ImportTableToDB(dt))
            {
                lbmsg.Text = "Import Successful!";
                File.Delete(Server.MapPath(FileName));
            }
            else
            {
                lbmsg.Text = "Import Failed!";
            }
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            cnn.Open();
            string sqlstr = "select * from Member_Information";
            SqlCommand select_cmd = new SqlCommand(sqlstr, cnn);
            SqlDataReader select_sdr = select_cmd.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(select_sdr);
            select_sdr.Close();
            cnn.Close();
            GridView2.DataSource = table;
            GridView2.DataBind();
        }
        catch
        {
            // lbmsg.Text = "数据错误！";
        }
    }
    public bool ImportTableToDB(DataTable dtImp)
    {
        try
        {
            foreach (DataRow datarow in dtImp.Rows)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string sql = "insert into Member_Information(MemberID,MemberName,MemberGender,MemberAge,MemberDepartment,MemberEmail,MemberTel,MemberAddress,MemberComment,MemberInfo) values(@MemberID,@MemberName,@MemberGender,@MemberAge,@MemberDepartment,@MemberEmail,@MemberTel,@MemberAddress,@MemberComment,@MemberInfo)";
                string sql1 = "insert into Department_Information values(@MemberDepartment)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd1 = new SqlCommand(sql1, conn);
                cmd.Parameters.AddWithValue("@MemberID", datarow["MemberID"].ToString());
                cmd.Parameters.AddWithValue("@MemberName", datarow["MemberName"].ToString());
                cmd.Parameters.AddWithValue("@MemberGender", datarow["MemberGender"].ToString());
                cmd.Parameters.AddWithValue("@MemberAge", datarow["MemberAge"].ToString());
                cmd.Parameters.AddWithValue("@MemberDepartment", datarow["MemberDepartment"].ToString());
                cmd.Parameters.AddWithValue("@MemberEmail", datarow["MemberEmail"].ToString());
                cmd.Parameters.AddWithValue("@MemberTel", datarow["MemberTel"].ToString());
                cmd.Parameters.AddWithValue("@MemberAddress", datarow["MemberAddress"].ToString());
                cmd.Parameters.AddWithValue("@MemberComment", datarow["MemberComment"].ToString());
                cmd.Parameters.AddWithValue("@MemberInfo", datarow["MemberInfo"].ToString());
                
                
                string sqlclasscount1 = "select count(MemberID) as b from Member_Information";
                string sqlclass1 = "select MemberID from Member_Information";
                DataSet myds1 = new DataSet();
                myds1 = dataOperate.getDataset(sqlclasscount1, "Member_Information");
                DataRowView mydrv1 = myds1.Tables["Member_Information"].DefaultView[0];
                string count1 = Convert.ToString(mydrv1["b"]);
                if (Convert.ToInt32(count1) == 0)
                {
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    int s1 = 0;
                    for (int i = 0; i < Convert.ToInt32(count1); i++)
                    {
                        DataSet myds11 = new DataSet();
                        myds11 = dataOperate.getDataset(sqlclass1, "Member_Information");
                        DataRowView mydrv11 = myds11.Tables["Member_Information"].DefaultView[i];
                        string sno = Convert.ToString(mydrv11["MemberID"]);

                        if (sno == datarow["MemberID"].ToString())
                        {
                            s1 = 1;
                            break;
                        }
                    }
                    if (s1 == 0)
                    {
                        cmd.ExecuteNonQuery();
                    }
                }

                string sqlclasscount = "select count(*) as a from Department_Information";
                string sqlclass = "select * from Department_Information";
                DataSet myds = new DataSet();
                myds = dataOperate.getDataset(sqlclasscount, "Department_Information");
                DataRowView mydrv = myds.Tables["Department_Information"].DefaultView[0];
                string count = Convert.ToString(mydrv["a"]);
                if (Convert.ToInt32(count) == 0)
                {
                    cmd1.Parameters.AddWithValue("@MemberDepartment", datarow["MemberDepartment"].ToString());
                    cmd1.ExecuteNonQuery();
                }
                else
                {
                    int s = 0;
                    for (int i = 0; i < Convert.ToInt32(count); i++)
                    {
                        DataSet myds2 = new DataSet();
                        myds2 = dataOperate.getDataset(sqlclass, "Department_Information");
                        DataRowView mydrv2 = myds2.Tables["Department_Information"].DefaultView[i];
                        string clno = Convert.ToString(mydrv2["DepartmentName"]);

                        if (clno == datarow["MemberDepartment"].ToString())
                        {
                            s = 1;
                            break;
                        }
                    }
                    if (s == 0)
                    {
                        cmd1.Parameters.AddWithValue("@MemberDepartment", datarow["MemberDepartment"].ToString());
                        cmd1.ExecuteNonQuery();
                    }
                }

                conn.Close();
            }

            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool isNum(string str)
    {
        foreach (char ch in str)
        {
            if (!char.IsDigit(ch))
            {
                return false;
            }
        }
        return true;
    }

}
