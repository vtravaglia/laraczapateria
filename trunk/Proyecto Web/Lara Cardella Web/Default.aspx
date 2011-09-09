<%@ Page Language="C#" MasterPageFile="~/LaraCardella.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title=":: Lara Cardella Zapatos & Accesorios ::" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoPlaceHolder" Runat="Server">
  
    <p id="menuCalzados" class="tituloMenuCatalogo">
        <asp:Label ID="lblCalzados" runat="server" Text="Calzados"></asp:Label>
    </p>
    <p class="menuCatalogo">
        <asp:Label ID="lbCalOtIn"  runat="server" Text="Otoño - Invierno"></asp:Label>
    </p>
    <p class="menuCatalogo">
        <asp:Label ID="lblCaPrVe"  runat="server" Text="Primavera - Verano"></asp:Label>
    </p>   
    

    <p id="menuAccesorios" class="tituloMenuCatalogo">
        <asp:Label ID="lblAccesorios" runat="server" Text="Accesorios"></asp:Label>
    </p>    
    <p class="menuCatalogo">
        <asp:Label ID="lblAcOtIn"  runat="server" Text="Otoño - Invierno"></asp:Label>
    </p>
    <p class="menuCatalogo">
        <asp:Label ID="lblAcPrVe"  runat="server" Text="Primavera - Verano"></asp:Label>
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contenidoDerPlaceHolder" Runat="Server">


    <div id="catalogo" class="transparent">
        <a href="images/zapatos/zapatosGrandes.jpg"  class="yoxview">
            <img src="images/zapatos/zapatos.jpg" alt="First" title="First image" />
        </a>
    </div>

</asp:Content>