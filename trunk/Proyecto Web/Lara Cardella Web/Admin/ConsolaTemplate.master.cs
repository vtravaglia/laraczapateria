using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Admin_ConsolaTemplate : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            lblUsrLogueado.Text = HttpContext.Current.User.Identity.Name;
        }
    }
    protected void btnCerrarSesion_Click(object sender, EventArgs e)
    {
        // Eliminar la cookie
        Context.Response.Cookies[".laracardella"].Expires = DateTime.Now;
        // Terminar la sesion
        FormsAuthentication.SignOut();
        Response.Redirect("../Default.aspx");
    }
}
