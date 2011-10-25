<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsolaSinMaster.aspx.cs" Inherits="ConsolaSinMaster" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABM Calzados</title>
    <link href="css/ABM_Calzados.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div id="middle_general_container">
        <div id="middle_center_container">
        <h1>Consola Administrativa</h1>
                <hr />
                <h3 class="style1">ABM Calzados</h3>
        
        <p>Codigo<asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqValidCodigo" runat="server" 
                ControlToValidate="txtCodigo" Display="Dynamic" ErrorMessage="Codigo requerido"></asp:RequiredFieldValidator>
                </p>
        <p>Nombre<asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqValidNombre" runat="server" 
                ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
                </p>
        <p>Descripcion<asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></p>
        <p>Coleccion<asp:DropDownList ID="ddlColeccion" runat="server"></asp:DropDownList></p>
                <p>Imagen:
                    <input id="filUpload" type="file" runat="server" onclick="return filUpload_onclick()" />
                    <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" 
                        Text="Cargar Imagen" />
                </p>
                <p>
                <asp:Image ID="imgPicture" runat="server" Height="107px" Width="140px" />
            &nbsp;<asp:Label ID="lblOutput" runat="server" Text="mensaje"></asp:Label>
                </p>
                <p><b>Imagenes Cargadas:</b></p>
                <p>
                    <asp:Label ID="lblImagenesCargadas" runat="server" Text="imgcargadas"></asp:Label>
                </p>
                <p>&nbsp;</p>
                <p>
                    <asp:GridView ID="grillaCalzados" runat="server">
                    </asp:GridView>
                </p>
                <p>&nbsp;</p>
            <p>&nbsp;&nbsp; </p>
            <p>
                &nbsp;</p>
                <p>
                    <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" Text="Guardar" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
        
        
        </div>
    </div>
    </form>
</body>
</html>
