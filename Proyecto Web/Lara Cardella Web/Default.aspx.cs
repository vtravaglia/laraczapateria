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

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            gestor = new ConexionBD();

            //Obtengo la lista de imagenes de los calzados (imagenChica1 : imagenGrande1 , imagenChica2 : imagenGrande2)
            this.listaCalzados.Value = getListaCalzados();
        }
        catch (CardellaException ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private String getListaCalzados()
    {
        String listaCalzado = "";
        foreach (Calzado calzado in gestor.getCalzados())
        {
            listaCalzado += calzado.PathImagenChica+" : "+calzado.PathImagenGrande+",";
        }
        return listaCalzado;
    }
}
