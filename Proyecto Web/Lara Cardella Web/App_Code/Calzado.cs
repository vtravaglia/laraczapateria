﻿using System;
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
    private int idColeccion;
    private String descripcion;
    private String pathImagenChica;
    private String pathImagenGrande;

    public Calzado()
    {
    }
    public int IdColeccion
    {
        get { return idColeccion; }
        set { idColeccion = value; }
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
            OdbcCommand cmd = new OdbcCommand("SELECT ca.idCalzado, ca.codigo, ca.nombre, ca.descripcion, co.nombre as coleccion "+  
                                              "FROM calzado ca, coleccion co "+
                                              "WHERE co.idColeccion = ca.idColeccion", ObtenerConexion());

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

    //Obtengo un calzado de base de datos por su id
    public static DataTable getCalzadoById(int id)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT ca.idCalzado, ca.codigo, ca.nombre, ca.descripcion, ca.idColeccion " +
                                              "FROM calzado ca " +
                                              "WHERE ca.idCalzado="+id.ToString(), ObtenerConexion());

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
    public static void insertCalzado(String cod, String nom, String desc, int col, List<Imagen> pathsImgList)
    {
        OdbcConnection conexion = null;
        try
        {
            if (pathsImgList == null || pathsImgList.Count == 0)
            {
                throw new pathImgEmptyException();
            }
            conexion = ObtenerConexion();
            //Guardo los datos del calzado
            String sentenciaCalzado = "insert into calzado (codigo, nombre, descripcion, idColeccion) values ('" + cod + "', '" + nom + "', '" + desc + "'," + col.ToString() + ")";
            OdbcCommand cmd = new OdbcCommand(sentenciaCalzado, conexion);

            cmd.ExecuteNonQuery();

            //Obtengo el id del calzado que acabo de insertar
            String sentenciaLastCalzado = "Select  LAST_INSERT_ID()";
            cmd = new OdbcCommand(sentenciaLastCalzado, conexion);
            int lastIdCalzado = Convert.ToInt32(cmd.ExecuteScalar());

            //Guardo los path de las imagenes
            String sentenciaImg;
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "insert into imagen (idCalzado, pathGrande, pathChica) values ('" + lastIdCalzado + "', '" + img.PathBig + "', '" + img.PathSmall + "')";
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

    //Modifico un calzado existente
    public static void updateCalzado(int id, String cod, String nom, String desc, int col, List<Imagen> pathsImgList)
    {
        OdbcConnection conexion = null;
        try
        {
            if (pathsImgList == null || pathsImgList.Count == 0)
            {
                throw new pathImgEmptyException();
            }
            conexion = ObtenerConexion();
            //Actualizo los datos del calzado
            String sentenciaCalzado = "update calzado set codigo='"+cod+"', nombre='" + nom + 
                                        "', descripcion='" + desc + "',idColeccion=" + col.ToString() + 
                                        " where idCalzado=" + id.ToString();
            OdbcCommand cmd = new OdbcCommand(sentenciaCalzado, conexion);

            cmd.ExecuteNonQuery();

            //Borro los path de las imagenes
            String sentenciaImg;
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "delete from imagen where idCalzado=" + id.ToString();
                cmd = new OdbcCommand(sentenciaImg, conexion);
                cmd.ExecuteNonQuery();
            }

            //Registro los path de las imagenes todos de nuevo
            foreach (Imagen img in pathsImgList)
            {
                sentenciaImg = "insert into imagen (idCalzado, pathGrande, pathChica) values ('" + id + "', '" + img.PathBig + "', '" + img.PathSmall + "')";
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

    //Obtengo las imagenes de un calzado de base de datos
    public static List<Imagen> getImagenesCalzado(int idCalzado)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT pathGrande, pathChica, idImagen " +
                                              "FROM imagen " +
                                              "WHERE idCalzado=" + idCalzado.ToString(), ObtenerConexion());

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

    //elimino un calzado de la bd y sus imagenes asociadas
    public static void deleteCalzado(int idCalzado)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("DELETE FROM imagen " +
                                              "WHERE idCalzado=" + idCalzado.ToString(), ObtenerConexion());

            cmd.ExecuteNonQuery();

            cmd.CommandText="DELETE FROM calzado WHERE idCalzado=" + idCalzado.ToString();

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
    public static object getPathChicaImagenesCalzado(int idCalzado)
    {
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT idImagen, pathChica " +
                                              "FROM imagen " +
                                              "WHERE idCalzado =" + idCalzado.ToString(), ObtenerConexion());

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
