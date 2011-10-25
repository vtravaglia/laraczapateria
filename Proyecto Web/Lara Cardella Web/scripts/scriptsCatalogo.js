$(document).ready(function() {
    //Antes de manejar los eventos de los botones debo cargar los catalogos
    
    //CATALOGO ZAPATOS         
    var todosZapatos=$("#ctl00_contenidoPlaceHolder_listaCalzados").val();
    var arrayZapatos=todosZapatos.split(",");
    
    //A la fila 1 del catalogo 
    var cantidadPorFila=parseInt(arrayZapatos.length/2);
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayZapatos[i].split(":");
        $("#mycarousel").append( '<li ><a class="yoxview" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" alt="" /></a></li>' ) ;
    }         
                
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<arrayZapatos.length; i++) {
        var arrayImagen=arrayZapatos[i].split(":");
        $("#mycarousel2").append( '<li ><a class="yoxview" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" alt="" /></a></li>' ) ;
    }
           
     $("#menuCalzados").click(function(){
            if ($("#contenidoIzq").width()==10){
                $("#contenidoIzq").animate({width: 0}, 'slow');
                $("div:hidden").hide("slow");
                $("body").remove("#newScript");
            }else{
                $("#contenidoIzq").animate({width: 10}, 'slow');
                $("div:hidden").show("slow");
                $("body").append( '<scr' + 'ipt id="newScript" type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;
                
                
            }           
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
