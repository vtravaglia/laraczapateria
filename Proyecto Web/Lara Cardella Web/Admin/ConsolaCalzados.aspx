﻿<%@ Page Language="C#" MasterPageFile="~/Admin/ConsolaTemplate.master" AutoEventWireup="true" CodeFile="ConsolaCalzados.aspx.cs" Inherits="Admin_ConsolaCalzados_new" Title="Página sin título" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Consola Calzados</title>
    <style type="text/css">
        .style1
        {
            width: 365px;
        }
        .style2
        {
            width: 40px;
        }
        .style3
        {
            width: 67px;
        }
        .style4
        {
            height: 18px;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function validarImagenNotEmpty()
        {
            if (document.getElementById("<%=btnfilUpload.ClientID%>").value=="")
            {
                alert("No hay ninguna imagen para cargar");
                document.getElementById("<%=btnfilUpload.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="subTitle_container" Runat="Server">
<a name="aM" id="aM">
    </a>
    <h3>ABM Calzados</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="formulario_container" Runat="Server">
    <table id="formularioTable">
        <tr>
            <td class="style3">
                <asp:Label ID="lblCodigo" runat="server" Text="Codigo"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtCodigo" runat="server" Width="160px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqValidCodigo" runat="server" ControlToValidate="txtCodigo"
                    Display="Dynamic" ErrorMessage="Codigo requerido"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtId" runat="server" Enabled="False" Visible="False" 
                    Height="20px" Width="40px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtNombre" runat="server" Width="160px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqValidNombre" runat="server" ControlToValidate="txtNombre"
                    Display="Dynamic" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblDesc" runat="server" Text="Descripcion"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="328px"></asp:TextBox>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblColeccion" runat="server" Text="Coleccion"></asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="ddlColeccion" runat="server" Height="20px" Width="130px">
                </asp:DropDownList>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblImagen" runat="server" Text="Imagen:"></asp:Label>
            </td>
            
            <td class="style1">              
                <input id="btnfilUpload" type="file" runat="server" onclick="return filUpload_onclick()" />
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Cargar Imagen" 
                OnClientClick="return validarImagenNotEmpty()" 
                PostBackUrl="#aM"/>
            </td>
            <td class="style2">
            </td>
        </tr>
    </table>
    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" PostBackUrl="#aM"/>
    <asp:Button ID="btnCancelar" class="btnSeparable" runat="server" 
        Text="Cancelar" onclick="btnCancelar_Click" CausesValidation="False" PostBackUrl="#aM"/>
    <table id="mensajeTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Mensaje: "></asp:Label>
                <asp:Label ID="lblOutput" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Image ID="imgPicture" runat="server" Height="107px" Width="140px" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="imagenesCargadas_container" Runat="Server">

    <table id="imagenesCargadasTable">
        <tr>
            <td>
               <asp:Label ID="lblImgsCargadas" runat="server" Text="Imagenes Cargadas:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
               <asp:GridView ID="grillaImagenes" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" 
                    GridLines="None" 
                    Visible="False" AllowPaging="True" 
                    onpageindexchanging="grillaImagenes_PageIndexChanging" PageSize="2" 
                    AutoGenerateDeleteButton="True" DataKeyNames="idImagen" 
                    onrowdatabound="grillaImagenes_RowDataBound" 
                    onrowdeleting="grillaImagenes_RowDeleting">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="pathChica" HeaderText="Imagen">
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="grillaObjetos_container" Runat="Server">
    <h4>Calzados Registrados</h4>
    <asp:GridView ID="grillaCalzados" runat="server" AutoGenerateColumns="False"
        AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="778px" 
        CssClass="grillaProductos" onselectedindexchanged="grillaCalzados_SelectedIndexChanged" 
        AllowPaging="True" onpageindexchanging="grillaCalzados_PageIndexChanging" 
        DataKeyNames="idCalzado">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="codigo" HeaderText="Codigo" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
            <asp:BoundField DataField="coleccion" HeaderText="Coleccion" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:Button ID="btnModificar" runat="server" CausesValidation="False" OnClick="btnModificar_Click"
        Text="Modificar" />
    <asp:Button ID="btnEliminar" class="btnSeparable" runat="server" CausesValidation="False" 
        Text="Eliminar" OnClientClick="javascript:return confirm('Esta seguro que desea borrar el calzado?');"
        onclick="btnEliminar_Click" />
</asp:Content>



