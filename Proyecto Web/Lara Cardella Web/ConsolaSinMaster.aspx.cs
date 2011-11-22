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
            limpiarCampos();
            actualizarEstadoBotones(false);
        }
    }

    private void actualizarEstadoBotones(bool areEnabled)
    {
        if (areEnabled)
        {
            //el cancelar se activa cuando se hace click en modificar
            btnEliminar.Enabled = true;
            btnModificar.Enabled = true;
        }
        else
        {
            btnCancelar.Enabled = false;
            btnEliminar.Enabled = false;
            btnModificar.Enabled = false;
        }
    }

    private void limpiarCampos()
    {
        txtId.Text = "";
        txtId.Visible = false;
        txtCodigo.Text = "";
        txtNombre.Text = "";
        txtDesc.Text = "";
        lblImagenesCargadas.Text = "";
        imgPicture.ImageUrl = null;
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
        catch (CardellaException e)
        {
            lblOutput.Text = e.Message;
        }
        catch (Exception er)
        {
            lblOutput.Text = er.Message;
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
            lblOutput.Text = er.Message;
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
            try
            {
                pathImgsToSaveInBD = (List<Imagen>)Session["imgPathsToSaveInBD"];
                if (txtId.Text.CompareTo("") != 0)
                {
                    //Modifico el calzado existente
                    Calzado.updateCalzado(Convert.ToInt32(txtId.Text),cod, nom, desc, idCol, pathImgsToSaveInBD);
                    lblOutput.Text = "Calzado actualizado con exito!";
                }
                else
                {
                    //Guardo el nuevo calzado
                    Calzado.insertCalzado(cod, nom, desc, idCol, pathImgsToSaveInBD);
                    lblOutput.Text = "Calzado registrado con exito!";
                }
                //No limpio los paths de las imagenes en el limpiarCampos() porque el limpiarCampos()
                //se ejecuta en el load y la variable session no se tiene que limpiar ahi.
                Session["imgPathsToSaveInBD"] = new List<Imagen>();
                cargarCalzados();
                limpiarCampos();
            }
            catch (pathImgEmptyException imgEx)
            {
                lblOutput.Text = "Ninguna imagen cargada. Debe cargar al menos una imagen para el calzado.";
            }
            catch (Exception ex)
            {
                lblOutput.Text = ex.Message;
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
        if (btnfilUpload.PostedFile != null)
        {
            // Check file size (must not be 0)
            HttpPostedFile myFile = btnfilUpload.PostedFile;
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
                img.PathBig = sSavePath + sFilename;
                img.PathSmall = sSavePath + sThumbFile;
                pathImgsToSaveInBD.Add(img);
                Session["imgPathsToSaveInBD"] = pathImgsToSaveInBD;

                //Actualizo la lista de las imagenes ya cargadas
                lblImagenesCargadas.Text += " " + myFile.FileName;

                // Displaying success information
                lblOutput.Text = "Imagen cargada con exito!";

                // Destroy objects
                myThumbnail.Dispose();
                myBitmap.Dispose();
                //habilito el cancelar por si el usr se arrepiente de guardar
                btnCancelar.Enabled = true;
            }
            catch (ArgumentException errArgument)
            {
                // The file wasn't a valid jpg file
                lblOutput.Text = "El archivo no es una imagen valida";
                System.IO.File.Delete(Server.MapPath(sSavePath + sFilename));
            }
        }
    }

    public bool ThumbnailCallback()
    {
        return false;
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            limpiarCampos();
            lblOutput.Text = "";
            //obtengo el id del calzado a modificar
            int id = Convert.ToInt32(grillaCalzados.SelectedRow.Cells[1].Text);
            //traigo los datos del calzado de la bd
            DataTable dt = Calzado.getCalzadoById(id);
            //cargo los datos grales del calzado
            txtId.Visible = true;
            txtId.Text = dt.Rows[0][0].ToString();
            txtCodigo.Text = dt.Rows[0][1].ToString();
            txtNombre.Text = dt.Rows[0][2].ToString();
            txtDesc.Text = dt.Rows[0][3].ToString();
            ddlColeccion.SelectedIndex = 0;
            for (int i = 0; i < ddlColeccion.Items.Count; i++)
            {
                ddlColeccion.SelectedIndex = i;
                if (ddlColeccion.SelectedValue == dt.Rows[0][4].ToString())
                {
                    break;
                }
            }
            //cargo las imagenes del calzado en la variable session
            List<Imagen> listaImgs = Calzado.getImagenesCalzado(id);
            Session["imgPathsToSaveInBD"] = listaImgs;
            if (listaImgs != null)
            {
                foreach (Imagen img in listaImgs)
                {
                    lblImagenesCargadas.Text += img.PathBig.ToString();
                }
            }
            btnCancelar.Enabled = true;
        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.Message;
        }
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grillaCalzados.SelectedRow.Cells[1].Text);
            Calzado.deleteCalzado(id);
            lblOutput.Text = "El Producto fue eliminado con exito";
            cargarCalzados();
            limpiarCampos();
            btnEliminar.Enabled = false;
        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.Message;
        }
    }
    protected void grillaCalzados_SelectedIndexChanged(object sender, EventArgs e)
    {
        actualizarEstadoBotones(true);
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        limpiarCampos();
        txtCodigo.Focus();
        btnCancelar.Enabled = false;
        lblOutput.Text = "";
    }
}
