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
using System.Data.SqlClient;
using System.Data.Odbc;

public class Seguridad : ConexionBD
{
    public Seguridad()
    {

    }
    public static Int32 validarUsuario(String usr, String pass)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT idUsuario FROM usuario " +
                                              "WHERE user='" + usr.ToString() +"'" +
                                              "AND   password='" + pass.ToString() +"'", ObtenerConexion());

            Int32 idUser = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Connection.Close();

            return idUser;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static string ObtenerRol(Int32 idUsuario)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT rol FROM usuario " +
                                              "WHERE idUsuario=" + idUsuario.ToString(), ObtenerConexion());

            String rol = cmd.ExecuteScalar().ToString();
            cmd.Connection.Close();

            return rol;
        }
        catch (Exception)
        {
            throw;
        }

    }
}
