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
/// Coleccion representa las colecciones de los Calzados o Accesorios 
/// (Por Ej: Otonio-Invierno o Primavera-Verano). Si el Calzado o Accesorio
/// esta fuera de temporada la coleccion es Sin coleccion.
/// </summary>
public class Coleccion:ConexionBD
{
	public Coleccion()
	{
	}

    //Obtengo todas las colecciones de base de datos
    public static DataTable getColecciones()
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT * FROM coleccion", ObtenerConexion());

            OdbcDataAdapter da = new OdbcDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.Connection.Close();

            return dt;
        }
        catch (CardellaException e)
        {
            throw e;
        }
        catch (Exception)
        {

            throw;
        }

    }
}
