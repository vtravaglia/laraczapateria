using System;
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
using System.Data;

/// <summary>
/// Descripción breve de ConexionBD
/// </summary>
public class ConexionBD
{
    private static OdbcConnection con;

	public ConexionBD()
	{
		
	}

    public static OdbcConnection ObtenerConexion()
    {
        try
        {
            //con = new OdbcConnection(ConfigurationManager.ConnectionStrings["laracardellaCn"].ConnectionString.ToString());
            con = new OdbcConnection("Driver={MySQL ODBC 5.1 Driver};Server=localhost;Database=laracardella;User=root;Password=admin;");
            
            con.Open();
            return con;
        }
        catch (Exception)
        {

            throw;
        }

    }
    
    public static void cerrarConexion()
    {
        try
        {
            con.Close();
        }
        catch (Exception)
        {

            throw;
        }

    }
}
