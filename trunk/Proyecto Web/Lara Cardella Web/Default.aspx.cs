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
    private String listaCalzadosOI;
    private String listaCalzadosPV;
    private String listaAccesoriosOI;
    private String listaAccesoriosPV;

    private int cantZapOI;
    private int cantZapPV;
    private int cantAccOI;
    private int cantAccPV;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            listaCalzadosOI = "";
            listaCalzadosPV = "";
            listaAccesoriosOI = "";
            listaAccesoriosPV = "";

            cantZapOI=0;
            cantZapPV=0;
            cantAccOI=0;
            cantAccPV=0;

            gestor = new ConexionBD();

            //Obtengo la lista de imagenes de los calzados (imagenChica1 : imagenGrande1 : desc1, imagenChica2 : imagenGrande2 : desc2)
            cargarListaCalzados();
            cargarListaAccesorios();

            this.listaCalzadosOtoInv.Value = listaCalzadosOI;
            this.listaCalzadosPriVer.Value = listaCalzadosPV;
            this.listaAccesoriosOtoInv.Value = listaAccesoriosOI;
            this.listaAccesoriosPriVer.Value = listaAccesoriosPV;

            this.cantZapOtoInv.Value = cantZapOI.ToString();
            this.cantZapPriVer.Value = cantZapPV.ToString();
            this.cantAccOtoInv.Value = cantAccOI.ToString();
            this.cantAccPriVer.Value = cantAccPV.ToString();
        }
        catch (CardellaException ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void cargarListaCalzados()
    {
        foreach (Calzado calzado in gestor.getCalzados())
        {
            if (calzado.IdColeccion == 1)
            {
                cantZapOI++;
                listaCalzadosOI += calzado.PathImagenChica + " : " + calzado.PathImagenGrande + " : " + calzado.Descripcion + ",";
            }
            else
            {
                cantZapPV++;
                listaCalzadosPV += calzado.PathImagenChica + " : " + calzado.PathImagenGrande + " : " + calzado.Descripcion + ",";
            }
            
        }
    }

    private void cargarListaAccesorios()
    {
        foreach (Accesorio accesorio in gestor.getAccesorios())
        {
            if (accesorio.IdColeccion == 1)
            {
                cantAccOI++;
                listaAccesoriosOI += accesorio.PathImagenChica.Substring(3) + " : " + accesorio.PathImagenGrande.Substring(3) + " : " + accesorio.Descripcion + ",";
            }
            else 
            {
                cantAccPV++;
                listaAccesoriosPV += accesorio.PathImagenChica.Substring(3) + " : " + accesorio.PathImagenGrande.Substring(3) + " : " + accesorio.Descripcion + ",";
            }
            
        }
    }
}
