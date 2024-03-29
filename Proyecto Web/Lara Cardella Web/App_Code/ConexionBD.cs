﻿using System;
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
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
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

    /// <summary>
    /// Retorna la lista de todos los calzados
    /// </summary>
    /// <returns></returns>
    public List<Calzado> getCalzados()
    {
        con = ObtenerConexion();
        DataSet ds = new DataSet();
        List<Calzado> listaCalzados = new List<Calzado>();
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT c.idCalzado, c.codigo, c.nombre, c.descripcion, c.idColeccion ,i.pathGrande, i.pathChica FROM calzado c, imagen i WHERE c.idCalzado=i.idCalzado", con);
            cmd.CommandType = CommandType.Text;
            OdbcDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Calzado calzado = new Calzado();
                calzado.IdCalzado = dr.GetInt32(0);
                calzado.Codigo = dr.GetString(1);
                calzado.Nombre = dr.GetString(2);
                calzado.Descripcion = dr.GetString(3);
                calzado.IdColeccion = dr.GetInt32(4);
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

    /// <summary>
    /// Retorna la lista de todas los accesorios
    /// </summary>
    /// <returns></returns>
    public List<Accesorio> getAccesorios()
    {
        con = ObtenerConexion();
        DataSet ds = new DataSet();
        List<Accesorio> listaAccesorio = new List<Accesorio>();
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT a.idAccesorio, a.codigo, a.descripcion, a.idColeccion ,i.pathGrande, i.pathChica FROM accesorio a, imagen i WHERE a.idAccesorio=i.idAccesorio", con);
            cmd.CommandType = CommandType.Text;
            OdbcDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Accesorio accesorio = new Accesorio();
                accesorio.IdAccesorio = dr.GetInt32(0);
                accesorio.Codigo = dr.GetString(1);
                accesorio.Descripcion = dr.GetString(2);
                accesorio.IdColeccion = dr.GetInt32(3);
                accesorio.PathImagenGrande = dr.GetString(4);
                accesorio.PathImagenChica = dr.GetString(5);

                listaAccesorio.Add(accesorio);
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
        return listaAccesorio;
    }

    public DataSet getDatasetCalzados()
    {
        con = ObtenerConexion();
        DataSet ds = new DataSet();
        List<Calzado> listaCalzados = new List<Calzado>();
        try
        {
            OdbcCommand cmd = new OdbcCommand("SELECT c.idCalzado, c.codigo, c.nombre, c.descripcion, c.idColeccion ,i.pathGrande, i.pathChica FROM calzado c, imagen i WHERE c.idCalzado=i.idCalzado", con);
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
