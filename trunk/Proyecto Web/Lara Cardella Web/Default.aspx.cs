using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
    private ConexionBD gestor;
    public List<Calzado> listaCalzados;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            gestor = new ConexionBD();

            listaCalzados=gestor.getCalzados();
        }
        catch (CardellaException ex)
        {
            lblError.Text = ex.Message;
        }
    }


}
