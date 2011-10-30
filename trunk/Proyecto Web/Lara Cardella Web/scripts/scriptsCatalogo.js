$(document).ready(function() {
    //Antes de los eventos de los botones debo cargar los catalogos
    
    //CATALOGO ZAPATOS  OTO-INV       
    var zapatosOtoInv=$("#ctl00_contenidoPlaceHolder_listaCalzadosOtoInv").val();
    var arrayZapatosOtoInv=zapatosOtoInv.split(",");
    
    //CATALOGO ZAPATOS PRI-VER
    var zapatosPriVer=$("#ctl00_contenidoPlaceHolder_listaCalzadosPriVer").val();
    var arrayZapatosPriVer=zapatosPriVer.split(",");
    
    //CATALOGO ACCESORIOS  OTO-INV       
    var accesoriosOtoInv=$("#ctl00_contenidoPlaceHolder_listaAccesoriosOtoInv").val();
    var arrayAccesoriosOtoInv=accesoriosOtoInv.split(",");
    
    //CATALOGO ACCESORIOS PRI-VER
    var accesoriosPriVer=$("#ctl00_contenidoPlaceHolder_listaAccesoriosPriVer").val();
    var arrayAccesoriosPriVer=accesoriosPriVer.split(",");
    
    //A la fila 1 del catalogo 
    var cantidadPorFila=parseInt(arrayZapatosOtoInv.length/2);
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayZapatosOtoInv[i].split(":");
        $("#mycarousel").append( '<li ><a class="yoxview" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" alt="" /></a></li>' ) ;
    }         
                
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<arrayZapatosOtoInv.length; i++) {
        var arrayImagen=arrayZapatosOtoInv[i].split(":");
        $("#mycarousel2").append( '<li ><a class="yoxview" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" alt="" /></a></li>' ) ;
    }
           
     //Calzados Otoño-Invierno
     $("#calzadosOtoInv").click(function(){
            if ($("#contenidoIzq").width()!=10){
                $("#contenidoIzq").animate({width: 10}, 'slow');
                $("div:hidden").show("slow");
                $("body").append( '<scr' + 'ipt id="newScript" type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;
            }         
     });
    
    //Calzados Primavera-Verano
     $("#calzadosPriVer").click(function(){
           /* $("div:hidden").hide("slow");  
            
            $("#contenidoIzq").animate({width: 10}, 'slow');
            $("div:hidden").show("slow");
            $("body").append( '<scr' + 'ipt id="newScript" type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;  */      
     });
     
     //Accesorios Otoño-Invierno
     $("#accesoriosOtoInv").click(function(){
                      
     });
     
     //Accesorios Primavera-Verano
     $("#accesoriosPriVer").click(function(){
                      
     });
     
     //Expandir imagenes del catalogo
     $(".yoxview").click(function(){
            $("#calzado").yoxview({
            lang: "ja",
            backgroundColor: "#000099",
            autoPlay: true
            });
     });
    
    //slider images
    $('#mycarousel').jcarousel();
    $('#mycarousel2').jcarousel();
});
