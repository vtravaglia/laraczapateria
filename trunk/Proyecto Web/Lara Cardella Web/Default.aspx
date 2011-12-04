<%@ Page Language="C#" MasterPageFile="~/LaraCardella.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title=":: Lara Cardella Zapatos & Accesorios ::" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoPlaceHolder" Runat="Server">
    <input id="listaCalzadosOtoInv" type="hidden" runat="Server"/> 
    <input id="listaCalzadosPriVer" type="hidden" runat="Server"/> 
    <input id="listaAccesoriosOtoInv" type="hidden" runat="Server"/> 
    <input id="listaAccesoriosPriVer" type="hidden" runat="Server"/> 
    
    <p id="menuCalzados" class="tituloMenuCatalogo">
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblCalzados" runat="server" Text="Calzados"></asp:Label>
    </p>
    <p class="menuCatalogo" id="calzadosOtoInv">
        <asp:Label ID="lbCalOtIn"  runat="server" Text="Otoño - Invierno"></asp:Label>
    </p>
    <p class="menuCatalogo" id="calzadosPriVer">
        <asp:Label ID="lblCaPrVe"  runat="server" Text="Primavera - Verano"></asp:Label>
    </p>   
   
    <p id="menuAccesorios" class="tituloMenuCatalogo">
        <asp:Label ID="lblAccesorios" runat="server" Text="Accesorios"></asp:Label>
    </p>    
    <p class="menuCatalogo" id="accesoriosOtoInv">
        <asp:Label ID="lblAcOtIn"  runat="server" Text="Otoño - Invierno"></asp:Label>
    </p>
    <p class="menuCatalogo" id="accesoriosPriVer">
        <asp:Label ID="lblAcPrVe"  runat="server" Text="Primavera - Verano"></asp:Label>
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contenidoDerPlaceHolder" Runat="Server">


    <div id="catalogoCalPriVer" class="transparent">  
        <div style="position: relative; z-index: 10;">
            <div style="	background-color: #fff; position:absolute; z-index:-1; top:0; left:0; right:0; bottom:0; opacity:0.5;">
            </div>
            <div class="bordeCatalogo">
                <ul id="mycarouselCalPriVer1" class="jcarousel-skin-tango">
                </ul>
                <ul id="mycarouselCalPriVer2" class="jcarousel-skin-tango">
                </ul>
            </div>
        </div> 
    </div>
    
    <div id="catalogoCalOtoInv" class="transparent">  
        <div style="position: relative; z-index: 10;">
            <div style="	background-color: #fff; position:absolute; z-index:-1; top:0; left:0; right:0; bottom:0; opacity:0.5;">
            </div>
            <div class="bordeCatalogo">
                <ul id="mycarouselCalOtoInv1" class="jcarousel-skin-tango">
                </ul>
                <ul id="mycarouselCalOtoInv2" class="jcarousel-skin-tango">
                </ul>
            </div>
        </div> 
    </div>
    
    <div id="catalogoAccPriVer" class="transparent">  
        <div style="position: relative; z-index: 10;">
            <div style="	background-color: #fff; position:absolute; z-index:-1; top:0; left:0; right:0; bottom:0; opacity:0.5;">
            </div>
            <div class="bordeCatalogo">
                <ul id="mycarouselAccPriVer1" class="jcarousel-skin-tango">
                </ul>
                <ul id="mycarouselAccPriVer2" class="jcarousel-skin-tango">
                </ul>
            </div>
        </div> 
    </div>
    
    <div id="catalogoAccOtoInv" class="transparent">  
        <div style="position: relative; z-index: 10;">
            <div style="	background-color: #fff; position:absolute; z-index:-1; top:0; left:0; right:0; bottom:0; opacity:0.5;">
            </div>
            <div class="bordeCatalogo">
                <ul id="mycarouselAccOtoInv1" class="jcarousel-skin-tango">
                </ul>
                <ul id="mycarouselAccOtoInv2" class="jcarousel-skin-tango">
                </ul>
            </div>
        </div> 
    </div>

</asp:Content>