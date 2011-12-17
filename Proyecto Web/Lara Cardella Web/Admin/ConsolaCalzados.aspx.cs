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
using System.Collections.Generic;
using System.Drawing;
using System.IO;

public partial class Admin_ConsolaCalzados_new : System.Web.UI.Page
{
    List<Imagen> pathImgsToSaveInBD;//lista de los paths de las imagenes GRANDES y CHICAS, para registrarlos en la bd

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            if (!Page.IsPostBack)
            {
                cargarColecciones();
                cargarCalzados();
                limpiarCampos();
                actualizarEstadoBotones(false);
            }
            else
            {
                setSuccessColorOutput(false);
            }
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

    private void limpiarCampos()
    {
        txtId.Text = "";
        txtId.Visible = false;
        txtCodigo.Text = "";
        txtNombre.Text = "";
        txtDesc.Text = "";
        imgPicture.ImageUrl = null;
        grillaImagenes.DataSource = null;
        grillaImagenes.Visible = false;
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        // Initialize variables
        string sSavePath;
        string sThumbExtension;
        int intThumbWidth;
        int intThumbHeight;

        // Set constant values
        sSavePath = "images/calzados/";
        sThumbExtension = "_thumb";
        intThumbWidth = 140;
        intThumbHeight = 107;

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

            sSavePath = "../" + sSavePath;

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
                if (Session["imgCalPathsToSaveInBD"] != null)
                {
                    pathImgsToSaveInBD = (List<Imagen>)Session["imgCalPathsToSaveInBD"];
                }
                img.PathBig = sSavePath + sFilename;
                img.PathSmall = sSavePath + sThumbFile;
                pathImgsToSaveInBD.Add(img);
                Session["imgCalPathsToSaveInBD"] = pathImgsToSaveInBD;

                // Displaying success information
                setSuccessColorOutput(true);
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

    private void setSuccessColorOutput(bool isSuccess)
    {
        if (isSuccess)
        {
            lblOutput.ForeColor = Color.Green;
        }
        else
        {
            lblOutput.ForeColor = Color.Red;
        }
    }

    public bool ThumbnailCallback()
    {
        return false;
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
                pathImgsToSaveInBD = (List<Imagen>)Session["imgCalPathsToSaveInBD"];
                if (txtId.Text.CompareTo("") != 0)
                {
                    //Modifico el calzado existente
                    Calzado.updateCalzado(Convert.ToInt32(txtId.Text), cod, nom, desc, idCol, pathImgsToSaveInBD);
                    setSuccessColorOutput(true);
                    lblOutput.Text = "Calzado actualizado con exito!";
                }
                else
                {
                    //Guardo el nuevo calzado
                    Calzado.insertCalzado(cod, nom, desc, idCol, pathImgsToSaveInBD);
                    setSuccessColorOutput(true);
                    lblOutput.Text = "Calzado registrado con exito!";
                }
                //No limpio los paths de las imagenes en el limpiarCampos() porque el limpiarCampos()
                //se ejecuta en el load y la variable session no se tiene que limpiar ahi.
                Session["imgCalPathsToSaveInBD"] = new List<Imagen>();
                cargarCalzados();
                limpiarCampos();
                grillaCalzados.SelectedIndex = -1;
                btnCancelar.Enabled = false;
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

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        limpiarCampos();
        txtCodigo.Focus();
        btnCancelar.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
        lblOutput.Text = "";
        Session["imgCalPathsToSaveInBD"] = new List<Imagen>();
        grillaImagenes.DataSource = null;
        grillaImagenes.Visible = false;
        grillaCalzados.SelectedIndex = -1;
        disableEditableElements(false);
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        disableEditableElements(false);
    }

    private void cargarImagenesCalzado(int id)
    {
        try
        {
            grillaImagenes.DataSource = Calzado.getPathChicaImagenesCalzado(id);
            grillaImagenes.DataBind();
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            //obtengo solo el idCalzado de la grilla para borrarlo de la BD
            int id = Convert.ToInt32(grillaCalzados.SelectedDataKey.Value);
            //Obtengo todas las imagenes (grandes y chicas) de ese calzado antes de borrarlo de la BD
            List<Imagen> listaImagenes = Calzado.getImagenesCalzado(id);
            Calzado.deleteCalzado(id);
            //luego que borre el calzado de la BD tengo que borrar las imagenes que estan en el server
            eliminarImagenesDelServer(listaImagenes);
            setSuccessColorOutput(true);
            lblOutput.Text = "El calzado fue eliminado con exito";
            cargarCalzados();
            limpiarCampos();
            btnEliminar.Enabled = false;
            btnCancelar.Enabled = false;
            btnModificar.Enabled = false;
            Session["imgCalPathsToSaveInBD"] = new List<Imagen>();
            grillaCalzados.SelectedIndex = -1;
            /* habilito todos los elementos editables */
            disableEditableElements(false);
            txtCodigo.Focus();
        }
        catch (IOException exc)
        {
            lblOutput.Text = "No se pudieron borrar las imagenes en el servidor";
        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.Message;
        }
    }

    private void eliminarImagenesDelServer(Imagen img)
    {
        List<Imagen> listaImagenes = new List<Imagen>();
        listaImagenes.Add(img);
        eliminarImagenesDelServer(listaImagenes);
    }

    private void eliminarImagenesDelServer(List<Imagen> imagenes)
    {
        foreach (Imagen img in imagenes)
        {
            try
            {
                if (img.PathBig.Equals("") == false && img.PathBig.Length > 0)
                {
                    //Antes de borrarla debo validar que no haya otro calzado que este usando la misma imagen grande
                    if (!Imagen.imagenEnUsoPorOtroProducto(img.PathBig))
                    {
                        System.IO.File.Delete(Server.MapPath(img.PathBig));
                    }
                }
                if (img.PathSmall.Equals("") == false && img.PathSmall.Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(img.PathSmall));
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }

    protected void grillaCalzados_SelectedIndexChanged(object sender, EventArgs e)
    {
        actualizarEstadoBotones(true);
        try
        {
            limpiarCampos();
            lblOutput.Text = "";
            //obtengo el id del calzado a modificar
            int id = Convert.ToInt32(grillaCalzados.SelectedDataKey.Value);
            //traigo los datos del calzado de la bd
            DataTable dt = Calzado.getCalzadoById(id);
            //cargo los datos grales del calzado
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

            if (listaImgs != null)
            {
                Session["imgCalPathsToSaveInBD"] = listaImgs;
            }
            else
            {
                lblOutput.Text = "Error al intentar obtener las imagenes";
                return;
            }
            //cargo las imagenes chicas en la grilla
            cargarImagenesCalzado(id);
            grillaImagenes.Visible = true;

            btnCancelar.Enabled = true;

            /*desabilito todos los elementos editables para que no se puedan modificar hasta que hace click
              en Modificar */
            disableEditableElements(true);
        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.Message;
        }
    }

    private void disableEditableElements(bool disable)
    {
        //si disable == true deshabilito los elementos
        if (disable)
        {
            txtCodigo.Enabled = false;
            txtNombre.Enabled = false;
            txtDesc.Enabled = false;
            ddlColeccion.Enabled = false;
            btnUpload.Enabled = false;
            btnGuardar.Enabled = false;
            grillaImagenes.Enabled = false;
        }
        else
        {
            //disable = false, entonces habilito los elementos
            txtCodigo.Enabled = true;
            txtNombre.Enabled = true;
            txtDesc.Enabled = true;
            ddlColeccion.Enabled = true;
            btnUpload.Enabled = true;
            btnGuardar.Enabled = true;
            grillaImagenes.Enabled = true;
        }
    }
    protected void grillaImagenes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grillaImagenes.PageIndex = e.NewPageIndex;
        //obtengo el id del calzado a modificar
        int id = Convert.ToInt32(grillaCalzados.SelectedRow.Cells[1].Text);
        cargarImagenesCalzado(id);
    }

    protected void grillaCalzados_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grillaCalzados.PageIndex = e.NewPageIndex;
        cargarCalzados();
    }
    protected void grillaImagenes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //obtengo el idImagen de la grilla para borrarla de la BD
            int idImg = Convert.ToInt32(grillaImagenes.DataKeys[e.RowIndex].Value);
            lblOutput.Text = "id seleccionado" + idImg.ToString();
            Imagen imgToDelete = Imagen.getImagen(idImg);

            //tengo que borrar la imagen de la bd
            Imagen.deleteImagen(idImg);

            //luego que borre la imagen de la BD tengo que borrarlas del server
            eliminarImagenesDelServer(imgToDelete);

            //por ultimo borro la imagen de la variable de session
            pathImgsToSaveInBD = (List<Imagen>)Session["imgCalPathsToSaveInBD"];
            foreach (Imagen img in pathImgsToSaveInBD)
            {
                if (img.IdImagen == idImg)
                {
                    pathImgsToSaveInBD.Remove(img);
                    break;
                }
            }
            //obtengo solo el idCalzado de la grilla para borrarlo de la BD
            int idAcc = Convert.ToInt32(grillaCalzados.SelectedDataKey.Value);
            cargarImagenesCalzado(idAcc);
            setSuccessColorOutput(true);
            lblOutput.Text = "La imagen fue eliminada con exito";
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void grillaImagenes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //CODIGO QUE AGREGA EL MJE DE CONFIRMACION ANTES DE BORRAR UNA IMAGEN
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    LinkButton button = control as LinkButton;

                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "return confirm('Esta seguro que desea borrar la imagen?');";
                }
            }
        }

    }
}
