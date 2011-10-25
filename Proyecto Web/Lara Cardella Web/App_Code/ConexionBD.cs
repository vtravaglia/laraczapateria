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
using System.Collections.Generic;
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
            if (con == null)
            {
                con = new OdbcConnection(ConfigurationManager.ConnectionStrings["laracardellaCn"].ConnectionString.ToString());
            }
           // con = new OdbcConnection("Driver={MySQL ODBC 5.1 Driver};Server=localhost;Database=laracardella;User=root;Password=admin;");
            
            con.Open();
            return con;
        }
        catch (Exception e)
        {
            throw new CardellaException("Ocurrio un problema con la conexión a la base de datos" + e.Message);
        }

    }
    
    public static void cerrarConexion()
    {
        try
        {
            con.Close();
        }
        catch (Exception e)
        {
            throw new CardellaException("Ocurrio un problema al cerrar la conexión a la base de datos" + e.Message);
        }
    }

    public List<Calzado> getCalzados()
    {
        con = ObtenerConexion();
        DataSet ds = new DataSet();
        List<Calzado> listaCalzados = new List<Calzado>();
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT c.idCalzado, c.codigo, c.nombre, c.descripcion, c.idColeccion ,i.pathGrande, i.pathChica FROM laracardella.calzado c, laracardella.imagen i WHERE c.idCalzado=i.idCalzado", con);
            cmd.CommandType = CommandType.Text;
            OdbcDataReader dr = cmd.ExecuteReader();
   
            while(dr.Read())
            {
                Calzado calzado = new Calzado();
                calzado.IdCalzado=dr.GetInt32(0);
                calzado.Codigo = dr.GetString(1);
                calzado.Nombre = dr.GetString(2);
                calzado.Descripcion = dr.GetString(3);
                calzado.PathImagenGrande = dr.GetString(5);
                calzado.PathImagenChica = dr.GetString(6);
                
                listaCalzados.Add(calzado);
            }
        }
        catch (Exception e)
        {
            throw new CardellaException("Ocurrio un problema al intentar obtener todos los zapatos de la base de datos. " + e.Message);
        }
        finally
        {
            con.Close();
        }
        return listaCalzados;
    }

    public DataSet getDatasetCalzados()
    {
        con = ObtenerConexion();
        DataSet ds = new DataSet();
        List<Calzado> listaCalzados = new List<Calzado>();
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT c.idCalzado, c.codigo, c.nombre, c.descripcion, c.idColeccion ,i.pathGrande, i.pathChica FROM laracardella.calzado c, laracardella.imagen i WHERE c.idCalzado=i.idCalzado", con);
            cmd.CommandType = CommandType.Text;

            OdbcDataAdapter da = new OdbcDataAdapter(cmd);
            da.Fill(ds, "Conferencias");
        }
        catch (Exception e)
        {
            throw new CardellaException("Ocurrio un problema al intentar obtener todos los zapatos de la base de datos. " + e.Message);
        }
        finally
        {
            con.Close();
        }
        return ds;
    }
}
