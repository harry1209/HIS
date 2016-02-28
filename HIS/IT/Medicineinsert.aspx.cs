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
        this.GridView2.DataSource = dataOperate.getDataset("select * from Medicine_Information", "Medicine_Information");
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
            if (dt.Columns.Count != 5)
            {
                lbmsg.Text = "Please select right data form!";
                return;
            }
            if (dt.Rows.Count < 1)
            {
                lbmsg.Text = "Please select right data form!";
                return;
            }
            if (dt.Columns[0].ColumnName.ToString() != "MedicineID" || dt.Columns[1].ColumnName.ToString() != "MedicineName" || dt.Columns[2].ColumnName.ToString() != "MedicineType" || dt.Columns[3].ColumnName.ToString() != "MedicinePrice" || dt.Columns[4].ColumnName.ToString() != "MedicineInfo")
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
            string sqlstr = "select * from Medicine_Information";
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
                string sql = "insert into Medicine_Information(MedicineID,MedicineName,MedicineType,MedicinePrice,MedicineInfo) values(@MedicineID,@MedicineName,@MedicineType,@MedicinePrice,@MedicineInfo)";
                string sql1 = "insert into Medicinetype_Information values(@MedicineType)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd1 = new SqlCommand(sql1, conn);
                cmd.Parameters.AddWithValue("@MedicineID", datarow["MedicineID"].ToString());
                cmd.Parameters.AddWithValue("@MedicineName", datarow["MedicineName"].ToString());
                cmd.Parameters.AddWithValue("@MedicineType", datarow["MedicineType"].ToString());
                cmd.Parameters.AddWithValue("@MedicinePrice", datarow["MedicinePrice"].ToString());
                cmd.Parameters.AddWithValue("@MedicineInfo", datarow["MedicineInfo"].ToString());
                
                string sqlclasscount1 = "select count(MedicineID) as b from Medicine_Information";
                string sqlclass1 = "select MedicineID from Medicine_Information";
                DataSet myds1 = new DataSet();
                myds1 = dataOperate.getDataset(sqlclasscount1, "Medicine_Information");
                DataRowView mydrv1 = myds1.Tables["Medicine_Information"].DefaultView[0];
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
                        myds11 = dataOperate.getDataset(sqlclass1, "Medicine_Information");
                        DataRowView mydrv11 = myds11.Tables["Medicine_Information"].DefaultView[i];
                        string sno = Convert.ToString(mydrv11["MedicineID"]);

                        if (sno == datarow["MedicineID"].ToString())
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

                string sqlclasscount = "select count(*) as a from Medicinetype_Information";
                string sqlclass = "select * from Medicinetype_Information";
                DataSet myds = new DataSet();
                myds = dataOperate.getDataset(sqlclasscount, "Medicinetype_Information");
                DataRowView mydrv = myds.Tables["Medicinetype_Information"].DefaultView[0];
                string count = Convert.ToString(mydrv["a"]);
                if (Convert.ToInt32(count) == 0)
                {
                    cmd1.Parameters.AddWithValue("@MedicineType", datarow["MedicineType"].ToString());
                    cmd1.ExecuteNonQuery();
                }
                else
                {
                    int s = 0;
                    for (int i = 0; i < Convert.ToInt32(count); i++)
                    {
                        DataSet myds2 = new DataSet();
                        myds2 = dataOperate.getDataset(sqlclass, "Medicinetype_Information");
                        DataRowView mydrv2 = myds2.Tables["Medicinetype_Information"].DefaultView[i];
                        string clno = Convert.ToString(mydrv2["MedicinetypeName"]);

                        if (clno == datarow["MedicineType"].ToString())
                        {
                            s = 1;
                            break;
                        }
                    }
                    if (s == 0)
                    {
                        cmd1.Parameters.AddWithValue("@MedicineType", datarow["MedicineType"].ToString());
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
