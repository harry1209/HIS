using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lawyer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
            this.bianhao.Text = Convert.ToString(Session["IDLogin"]);
            this.xingming.Text = Convert.ToString(Session["NameLogin"]);
            this.shenfen.Text = Convert.ToString(Session["DepartmentLogin"]);
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label5.Text = DateTime.Now.ToString();
    }

}
