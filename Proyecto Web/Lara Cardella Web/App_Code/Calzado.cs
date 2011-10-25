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
using System.Collections.Generic;

/// <summary>
/// Descripción breve de Calzado
/// </summary>
[Serializable]
public class Calzado:ConexionBD
{
    private int idCalzado;
    private String codigo;
    private String nombre;
    private String descripcion;
    private String pathImagenChica;
    private String pathImagenGrande;

    public Calzado()
    {
    }
    public int IdCalzado
    {
        get { return idCalzado; }
        set { idCalzado = value; }
    }
    
    public String Codigo
    {
        get { return codigo; }
        set { codigo = value; }
    }

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    public String PathImagenChica
    {
        get { return pathImagenChica; }
        set { pathImagenChica = value; }
    }

    public String PathImagenGrande
    {
        get { return pathImagenGrande; }
        set { pathImagenGrande = value; }
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

    //Inserto un nuevo calzado
    public static bool insertCalzado(String cod, String nom, String desc, int col, List<Imagen> pathsImgList)
    {
        OdbcConnection conexion = null;
        try
        {
            conexion = ObtenerConexion();
            //Guardo los datos del calzado
            String sentenciaCalzado = "insert into Calzado (codigo, nombre, descripcion, idColeccion) values ('" + cod + "', '" + nom + "', '" + desc + "'," + col.ToString() + ")";
            OdbcCommand cmd = new OdbcCommand(sentenciaCalzado, conexion);

            cmd.ExecuteNonQuery();

            //Obtengo el id del calzado que acabo de insertar
            String sentenciaLastCalzado = "Select  LAST_INSERT_ID()";
            cmd = new OdbcCommand(sentenciaLastCalzado, conexion);
            int lastIdCalzado = Convert.ToInt32(cmd.ExecuteScalar());

            //Guardo los path de las imagenes grandes
            String sentenciaImg;
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "insert into imagen (idCalzado, pathGrande, pathChica) values ('" + lastIdCalzado + "', '" + img.PathBig + "', '" + img.PathSmall + "')";
                cmd = new OdbcCommand(sentenciaImg, conexion);
                cmd.ExecuteNonQuery();
            }
            //cierro la conexion
            conexion.Close();

            return true;
        }
        catch (Exception)
        {
            //cierro la conexion
            conexion.Close();
        }
        return false;
    }
}
