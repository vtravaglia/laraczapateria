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

            //Obtengo la lista de imagenes de los calzados (imagenChica1 : imagenGrande1 : desc1, imagenChica2 : imagenGrande2 : desc2)
            this.listaCalzadosOtoInv.Value = getListaCalzados();
            this.listaAccesoriosOtoInv.Value = getListaAccesorios();
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
            listaCalzado += calzado.PathImagenChica+" : "+calzado.PathImagenGrande+" : "+calzado.Descripcion+",";
        }
        return listaCalzado;
    }

    private String getListaAccesorios()
    {
        String listaAccesorios = "";
        foreach (Accesorio accesorio in gestor.getAccesorios())
        {
            listaAccesorios += accesorio.PathImagenChica + " : " + accesorio.PathImagenGrande +" : "+accesorio.Descripcion+",";
        }
        return listaAccesorios;
    }
}
