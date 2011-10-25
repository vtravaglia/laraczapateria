using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Odbc;
using System.Drawing;
using System.Collections.Generic;

public partial class ConsolaSinMaster : System.Web.UI.Page
{
    List<Imagen> pathImgsToSaveInBD;//lista de los paths de las imagenes GRANDES y CHICAS, para registrarlos en la bd

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarColecciones();
            cargarCalzados();
            //inicializo la variable de session
            Session["imgPathsToSaveInBD"] = new List<Imagen>();
        }
    }

    private void cargarColecciones()
    {
        try
        {
            DataTable dt = Coleccion.getColecciones();
            ddlColeccion.DataSource = dt;
            ddlColeccion.DataTextField = dt.Columns["nombre"].ToString();
            ddlColeccion.DataValueField = dt.Columns["idColeccion"].ToString();
            ddlColeccion.DataBind();
        }
        catch (Exception er)
        {
            //lblError.Text = er.Message;
        }
    }

    private void cargarCalzados()
    {
        try
        {
            grillaCalzados.DataSource = Calzado.getCalzados();
            grillaCalzados.DataBind();
        }
        catch (Exception er)
        {
            //lblError.Text = er.Message;
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        String cod, nom, desc;
        int idCol = Convert.ToInt32(ddlColeccion.SelectedValue);

        if (Page.IsValid)
        {
            cod = txtCodigo.Text;
            nom = txtNombre.Text;
            desc = txtDesc.Text;
            pathImgsToSaveInBD = (List<Imagen>)Session["imgPathsToSaveInBD"];
            if (Calzado.insertCalzado(cod, nom, desc, idCol, pathImgsToSaveInBD))
            {
                //CALZADO GUARDADO CON EXITO!!!
                lblOutput.Text = "Calzado guardado con exito!";
            }
            else
            {
                //ERROR AL GUARDAR EL CALZADO
                lblOutput.Text = "Error al guardar el calzado";
            }

        }
        else
        {
            lblOutput.Text = "Page not valid. Error al guardar el calzado";
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        // Initialize variables
        string sSavePath;
        string sThumbExtension;
        int intThumbWidth;
        int intThumbHeight;

        // Set constant values
        sSavePath = "images/imagenesZapatos/";
        sThumbExtension = "_thumb";
        intThumbWidth = 160;
        intThumbHeight = 120;

        // If file field is not empty
        if (filUpload.PostedFile != null)
        {
            // Check file size (must not be 0)
            HttpPostedFile myFile = filUpload.PostedFile;
            int nFileLen = myFile.ContentLength;
            if (nFileLen == 0)
            {
                lblOutput.Text = "Ningun archivo fue cargado.";
                return;
            }

            // Check file extension (must be JPG)
            if (System.IO.Path.GetExtension(myFile.FileName).ToLower() != ".jpg")
            {
                lblOutput.Text = "El archivo debe tener una extension JPG";
                return;
            }

            // Read file into a data stream
            byte[] myData = new Byte[nFileLen];
            myFile.InputStream.Read(myData, 0, nFileLen);

            // Make sure a duplicate file does not exist.  If it does, keep on appending an 

            // incremental numeric until it is unique
            string sFilename = System.IO.Path.GetFileName(myFile.FileName);
            int file_append = 0;
            while (System.IO.File.Exists(Server.MapPath(sSavePath + sFilename)))
            {
                file_append++;
                sFilename = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName)
                                 + file_append.ToString() + ".jpg";
            }

            //Ubico la imagen segun a la coleccion a la que corresponda el calzado
            if ("oto-inv".Equals(ddlColeccion.SelectedItem.Text))//agrego el folder "oto-inv"
            {
                sSavePath += "oto-inv/";
            }
            else
            {
                if ("pri-ver".Equals(ddlColeccion.SelectedItem.Text))//agrego el folder "pri-ver"
                {
                    sSavePath += "pri-ver/";
                }
            }

            // Save the stream to disk
            System.IO.FileStream newFile
                    = new System.IO.FileStream(Server.MapPath(sSavePath + sFilename),
                                               System.IO.FileMode.Create);
            newFile.Write(myData, 0, myData.Length);
            newFile.Close();

            // Check whether the file is really a JPEG by opening it
            System.Drawing.Image.GetThumbnailImageAbort myCallBack =
                           new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
            Bitmap myBitmap;
            try
            {
                myBitmap = new Bitmap(Server.MapPath(sSavePath + sFilename));

                // If jpg file is a jpeg, create a thumbnail filename that is unique.
                file_append = 0;
                string sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName)
                                                         + sThumbExtension + ".jpg";
                while (System.IO.File.Exists(Server.MapPath(sSavePath + sThumbFile)))
                {
                    file_append++;
                    sThumbFile = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName) +
                                   file_append.ToString() + sThumbExtension + ".jpg";
                }

                // Save thumbnail and output it onto the webpage
                System.Drawing.Image myThumbnail
                        = myBitmap.GetThumbnailImage(intThumbWidth,
                                                     intThumbHeight, myCallBack, IntPtr.Zero);
                myThumbnail.Save(Server.MapPath(sSavePath + sThumbFile));
                imgPicture.ImageUrl = sSavePath + sThumbFile;

                //Agrego los path (GRANDE Y CHICA) de la imagen guardada para registrarlos en la BD
                pathImgsToSaveInBD = new List<Imagen>();
                Imagen img = new Imagen();
                if (Session["imgPathsToSaveInBD"] != null)
                {
                    pathImgsToSaveInBD = (List<Imagen>)Session["imgPathsToSaveInBD"];
                }
                img.PathBig = Server.MapPath(sSavePath + sFilename);
                img.PathSmall = Server.MapPath(sSavePath + sThumbFile);
                pathImgsToSaveInBD.Add(img);
                Session["imgPathsToSaveInBD"] = pathImgsToSaveInBD;

                //Actualizo la lista de las imagenes ya cargadas
                lblImagenesCargadas.Text += " " + myFile.FileName;

                // Displaying success information
                lblOutput.Text = "Imagen cargada con exito!";

                // Destroy objects
                myThumbnail.Dispose();
                myBitmap.Dispose();
            }
            catch (ArgumentException errArgument)
            {
                // The file wasn't a valid jpg file
                lblOutput.Text = "The file wasn't a valid jpg file.";
                System.IO.File.Delete(Server.MapPath(sSavePath + sFilename));
            }
        }
    }

    public bool ThumbnailCallback()
    {
        return false;
    } 
}
