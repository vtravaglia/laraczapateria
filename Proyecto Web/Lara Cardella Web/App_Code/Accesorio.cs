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
            OdbcCommand cmd = new OdbcCommand("SELECT * FROM Accesorio", ObtenerConexion());

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