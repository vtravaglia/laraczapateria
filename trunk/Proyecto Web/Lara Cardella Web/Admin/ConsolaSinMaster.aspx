<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsolaSinMaster.aspx.cs"
    Inherits="ConsolaSinMaster" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABM Calzados</title>
    <script type="text/javascript" src="../scripts/jquery1.6.2.js"></script>
    <link href="../css/ABM_Calzados.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[id^=btn]').css('height','25px');
        });
    </script>

</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div id="middle_general_container">
        <div id="loginInfo">
            <asp:Label ID="lblUsrLogueado" CssClass="loginInfo_items" runat="server" Text="Bienvenido"></asp:Label>
            <asp:Button ID="btnCerrarSesion" CssClass="loginInfo_items" runat="server" 
                Text="Cerrar Sesion" CausesValidation="False" onclick="btnCerrarSesion_Click" 
                Width="99px" />
        </div>
        <div id="middle_center_container">
            <h1>
                Consola Administrativa
            </h1>
            <hr />
            <h3>
                ABM Calzados
            </h3>
            </br>
            <h4>Registro/Modificacion</h4>
            <div id="middle_center_top">
                <table id="formTable">
                    <tr>
                        <td class="formTable_col1">
                            <asp:Label ID="lblCodigo" runat="server" Text="Codigo"></asp:Label>
                        </td>
                        <td class="formTable_col2">
                            <asp:TextBox ID="txtCodigo" runat="server" Width="160px" Height="25px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqValidCodigo" runat="server" ControlToValidate="txtCodigo"
                                Display="Dynamic" ErrorMessage="Codigo requerido"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtId" runat="server" Enabled="False" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTable_col1">
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        </td>
                        <td class="formTable_col2">
                            <asp:TextBox ID="txtNombre" runat="server" Width="160px" Height="25px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqValidNombre" runat="server" ControlToValidate="txtNombre"
                                Display="Dynamic" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTable_col1">
                            <asp:Label ID="lblDesc" runat="server" Text="Descripcion"></asp:Label>
                        </td>
                        <td class="formTable_col2">
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="328px"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTable_col1">
                            <asp:Label ID="lblColeccion" runat="server" Text="Coleccion"></asp:Label>
                        </td>
                        <td class="formTable_col2">
                            <asp:DropDownList ID="ddlColeccion" runat="server" Height="20px" Width="130px">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTable_col1">
                            <asp:Label ID="lblImagen" runat="server" Text="Imagen:"></asp:Label>
                        </td>
                        <td class="formTable_col2">
                            <input id="btnfilUpload" type="file" runat="server" onclick="return filUpload_onclick()" />
                            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Cargar Imagen" />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="middle_center_middle">
                <div class="formLine">
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                    <asp:Button ID="btnCancelar" class="btnSeparable" runat="server" 
                        Text="Cancelar" onclick="btnCancelar_Click" />
                </div>
                <div class="formLine">
                    <asp:Image ID="imgPicture" runat="server" Height="107px" Width="140px" />
                </div>
                <div class="formLine">
                    <asp:Label ID="lblOutput" runat="server" Text="mensaje" ForeColor="Red"></asp:Label>
                </div>
                <div class="formLine">
                    <asp:Label ID="lblImgsCargadas" runat="server" Text="Imagenes Cargadas:"></asp:Label>
                </div>
                <div class="formLine" style="margin-bottom:20px">
                    <asp:Label ID="lblImagenesCargadas" runat="server" Text="imgcargadas"></asp:Label>
                </div>
                <h4>Calzados Registrados</h4>
                <div id="grillaCalzados">
                    <asp:GridView ID="grillaCalzados" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="778px" 
                        onselectedindexchanged="grillaCalzados_SelectedIndexChanged">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="idCalzado" HeaderText="idCalzado" />
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
                </div>
                <div class="formLine">
                    <asp:Button ID="btnModificar" runat="server" CausesValidation="False" OnClick="btnModificar_Click"
                        Text="Modificar" />
                    <asp:Button ID="btnEliminar" class="btnSeparable" runat="server" CausesValidation="False" 
                        Text="Eliminar" OnClientClick="javascript:return confirm('Esta seguro que desea borrar el calzado?');"
                        onclick="btnEliminar_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
