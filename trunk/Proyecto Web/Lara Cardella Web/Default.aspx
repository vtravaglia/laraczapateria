<%@ Page Language="C#" MasterPageFile="~/LaraCardella.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title=":: Lara Cardella Zapatos & Accesorios ::" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenidoPlaceHolder" Runat="Server">
  
    <p id="menuCalzados" class="tituloMenuCatalogo">
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
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
    <div style="position: relative; z-index: 10;">
   <div style="	background-color: #fff; position:absolute; z-index:-1; top:0; left:0; right:
0; bottom:0; opacity:0.5;"></div>
        <div class="bordeCatalogo">
        <ul id="mycarousel" class="jcarousel-skin-tango">
            <li ><a class="yoxview" href="images/zapatos/zapato1g.png"><img src="images/zapatos/zapato1.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapatO2g.png"><img src="images/zapatos/zapato2.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato3g.png"><img src="images/zapatos/zapato3.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato4g.png"><img src="images/zapatos/zapato4.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato5g.png"><img src="images/zapatos/zapato5.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato6g.png"><img src="images/zapatos/zapato6.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato7g.png"><img src="images/zapatos/zapato7.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato8g.png"><img src="images/zapatos/zapato8.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato9g.png"><img src="images/zapatos/zapato9.png" alt="" /></a></li>      
            <li ><a class="yoxview" href="images/zapatos/zapato10g.png"><img src="images/zapatos/zapato10.png" alt="" /></a></li>  
        </ul>
        <ul id="mycarousel2" class="jcarousel-skin-tango">
            <li ><a class="yoxview" href="images/zapatos/zapato1g.png"><img src="images/zapatos/zapato1.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapatO2g.png"><img src="images/zapatos/zapato2.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato3g.png"><img src="images/zapatos/zapato3.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato4g.png"><img src="images/zapatos/zapato4.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato5g.png"><img src="images/zapatos/zapato5.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato6g.png"><img src="images/zapatos/zapato6.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato7g.png"><img src="images/zapatos/zapato7.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato8g.png"><img src="images/zapatos/zapato8.png" alt="" /></a></li>
            <li ><a class="yoxview" href="images/zapatos/zapato9g.png"><img src="images/zapatos/zapato9.png" alt="" /></a></li>      
            <li ><a class="yoxview" href="images/zapatos/zapato10g.png"><img src="images/zapatos/zapato10.png" alt="" /></a></li>  
        </ul>
        </div>
        <!--
        <a  class="yoxview">
            <img src="images/zapatos/zapatos.jpg" alt="First" title="First image" />
        </a>
        -->
    </div> 

</asp:Content>