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
/// Accesorio representa a una cartera, cinto, etc.
/// </summary>
public class Accesorio : ConexionBD
{
    private int idAccesorio;
    private String codigo;
    private int idColeccion;
    private String descripcion;
    private String pathImagenChica;
    private String pathImagenGrande;

    public Accesorio()
    {
    }

    public int IdAccesorio
    {
        get { return idAccesorio; }
        set { idAccesorio = value; }
    }
    
    public String Codigo
    {
        get { return codigo; }
        set { codigo = value; }
    }

    public int IdColeccion
    {
        get { return idColeccion; }
        set { idColeccion = value; }
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

    //Obtengo todos los accesorios de base de datos
    public static DataTable getAccesorios()
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT ac.idAccesorio, ac.codigo, ac.descripcion, co.nombre as coleccion " +
                                              "FROM accesorio ac, coleccion co " +
                                              "WHERE co.idColeccion = ac.idColeccion", ObtenerConexion());

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

    //Obtengo un accesorio de base de datos por su id
    public static DataTable getAccesorioById(int id)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT ac.idAccesorio, ac.codigo, ac.descripcion, ac.idColeccion " +
                                              "FROM accesorio ac " +
                                              "WHERE ac.idAccesorio=" + id.ToString(), ObtenerConexion());

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

    //Inserto un nuevo accesorio
    public static void insertAccesorio(String cod, String desc, int col, List<Imagen> pathsImgList)
    {
        OdbcConnection conexion = null;
        try
        {
            if (pathsImgList == null || pathsImgList.Count == 0)
            {
                throw new pathImgEmptyException();
            }
            conexion = ObtenerConexion();
            //Guardo los datos del accesorio
            String sentenciaAccesorio = "insert into accesorio (codigo, descripcion, idColeccion) values ('" + cod + "', '" + desc + "'," + col.ToString() + ")";
            OdbcCommand cmd = new OdbcCommand(sentenciaAccesorio, conexion);

            cmd.ExecuteNonQuery();

            //Obtengo el id del accesorio que acabo de insertar
            String sentenciaLastAccesorio = "Select  LAST_INSERT_ID()";
            cmd = new OdbcCommand(sentenciaLastAccesorio, conexion);
            int lastIdAccesorio = Convert.ToInt32(cmd.ExecuteScalar());

            //Guardo los path de las imagenes
            String sentenciaImg;
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "insert into imagen (idAccesorio, pathGrande, pathChica) values ('" + lastIdAccesorio + "', '" + img.PathBig + "', '" + img.PathSmall + "')";
                cmd = new OdbcCommand(sentenciaImg, conexion);
                cmd.ExecuteNonQuery();
            }
            conexion.Close();
        }
        catch (pathImgEmptyException imgEx)
        {
            throw imgEx;
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    //Modifico un accesorio existente
    public static void updateAccesorio(int id, String cod, String desc, int col, List<Imagen> pathsImgList)
    {
        OdbcConnection conexion = null;
        try
        {
            if (pathsImgList == null || pathsImgList.Count == 0)
            {
                throw new pathImgEmptyException();
            }
            conexion = ObtenerConexion();
            //Actualizo los datos del accesorio
            String sentenciaAccesorio = "update accesorio set codigo='" + cod + "', descripcion='" + desc + 
                                        "',idColeccion=" + col.ToString() +
                                        " where idAccesorio=" + id.ToString();
            OdbcCommand cmd = new OdbcCommand(sentenciaAccesorio, conexion);

            cmd.ExecuteNonQuery();

            //Borro los path de las imagenes
            String sentenciaImg;
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "delete from imagen where idAccesorio=" + id.ToString();
                cmd = new OdbcCommand(sentenciaImg, conexion);
                cmd.ExecuteNonQuery();
            }

            //Registro los path de las imagenes todos de nuevo
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "insert into imagen (idAccesorio, pathGrande, pathChica) values ('" + id + "', '" + img.PathBig + "', '" + img.PathSmall + "')";
                cmd = new OdbcCommand(sentenciaImg, conexion);
                cmd.ExecuteNonQuery();
            }
            conexion.Close();
        }
        catch (pathImgEmptyException imgEx)
        {
            throw imgEx;
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    //Obtengo las imagenes de un accesorio de base de datos
    public static List<Imagen> getImagenesAccesorio(int idAccesorio)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT pathGrande, pathChica, idImagen " +
                                              "FROM imagen " +
                                              "WHERE idAccesorio=" + idAccesorio.ToString(), ObtenerConexion());

            OdbcDataAdapter da = new OdbcDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cmd.Connection.Close();
            List<Imagen> listaImagenes = new List<Imagen>();
            Imagen img;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                img = new Imagen();
                img.PathBig = dt.Rows[i]["pathGrande"].ToString();
                img.PathSmall = dt.Rows[i]["pathChica"].ToString();
                img.IdImagen = Convert.ToInt32(dt.Rows[i]["idImagen"].ToString());
                listaImagenes.Add(img);
            }
            return listaImagenes;
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    //elimino un accesorio de la bd y sus imagenes asociadas
    public static void deleteAccesorio(int idAccesorio)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("DELETE FROM imagen " +
                                              "WHERE idAccesorio=" + idAccesorio.ToString(), ObtenerConexion());

            cmd.ExecuteNonQuery();

            cmd.CommandText = "DELETE FROM accesorio WHERE idAccesorio=" + idAccesorio.ToString();

            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    /**
     * Obtengo los path de las imagenes chicas para cargar las imagenes en la grilla
     * y permitir su eliminacion.
     */
    public static object getPathChicaImagenesAccesorio(int idAccesorio)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT idImagen, pathChica " +
                                              "FROM imagen " +
                                              "WHERE idAccesorio =" + idAccesorio.ToString(), ObtenerConexion());

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
