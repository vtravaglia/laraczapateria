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
public class Calzado : ConexionBD
{
	public Calzado()
	{
	}

    //Obtengo todos los calzados de base de datos
    public static DataTable getCalzados()
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT * FROM Calzado", ObtenerConexion());

            OdbcDataAdapter da = new OdbcDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.Connection.Close();

            return dt;
        }
        catch (Exception)
        {

            throw;
        }

    }
}
