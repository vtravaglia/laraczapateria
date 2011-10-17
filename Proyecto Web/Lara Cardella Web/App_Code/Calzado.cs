using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Odbc;

/// <summary>
/// Descripción breve de Calzado
/// </summary>
public class Calzado
{
    private int idCalzado;

    public int IdCalzado
    {
        get { return idCalzado; }
        set { idCalzado = value; }
    }
    private String codigo;

    public String Codigo
    {
        get { return codigo; }
        set { codigo = value; }
    }
    private String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    private String pathImagenChica;

    public String PathImagenChica
    {
        get { return pathImagenChica; }
        set { pathImagenChica = value; }
    }

    private String pathImagenGrande;

    public String PathImagenGrande
    {
        get { return pathImagenGrande; }
        set { pathImagenGrande = value; }
    }

	public Calzado()
	{
	}
}
