$(document).ready(function() {
    //Antes de los eventos de los botones debo cargar los catalogos
    $("body").append( '<scr' + 'ipt id="newScript" type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;    
    
    //CATALOGO ZAPATOS OTO-INV
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
    
    
    //COMPLETAR ZAPATOS OTO-INV    
    var cantidadZapatosOI=parseInt($("#ctl00_contenidoPlaceHolder_cantZapOtoInv").val());
    var cantidadPorFila=parseInt(cantidadZapatosOI/2);
    //A la fila 1 del catalogo 
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayZapatosOtoInv[i].split(":");
        $("#mycarouselCalOtoInv1").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" /></a></li>' ) ;
    }                    
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<cantidadZapatosOI; i++) {
        var arrayImagen=arrayZapatosOtoInv[i].split(":");
        $("#mycarouselCalOtoInv2").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'"/></a></li>' ) ;
    }
       
    //COMPLETAR ZAPATOS PRI-VER    
    var cantidadZapatosPV=parseInt($("#ctl00_contenidoPlaceHolder_cantZapPriVer").val());
    var cantidadPorFila=parseInt(cantidadZapatosPV/2);
    //A la fila 1 del catalogo 
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayZapatosPriVer[i].split(":");
        $("#mycarouselCalPriVer1").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" /></a></li>' ) ;
    }                    
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<cantidadZapatosPV; i++) {
        var arrayImagen=arrayZapatosPriVer[i].split(":");
        $("#mycarouselCalPriVer2").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'"/></a></li>' ) ;
    }
    
    
    //COMPLETAR ACCESORIOS OTO-INV
    //A la fila 1 del catalogo 
    var cantidadAccesoriosOI=parseInt($("#ctl00_contenidoPlaceHolder_cantAccOtoInv").val());
    var cantidadPorFila=parseInt(cantidadAccesoriosOI/2);
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayAccesoriosOtoInv[i].split(":");
        $("#mycarouselAccOtoInv1").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" /></a></li>' ) ;
    }                    
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<cantidadAccesoriosOI; i++) {
        var arrayImagen=arrayAccesoriosOtoInv[i].split(":");
        $("#mycarouselAccOtoInv2").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'"/></a></li>' ) ;
    }
        
      
    //COMPLETAR ACCESORIOS PRI-VER
    //A la fila 1 del catalogo 
    var cantidadAccesoriosPV=parseInt($("#ctl00_contenidoPlaceHolder_cantAccPriVer").val());
    var cantidadPorFila=parseInt(cantidadAccesoriosPV/2);
    for (var i=0; i<cantidadPorFila; i++) {
        var arrayImagen=arrayAccesoriosPriVer[i].split(":");
        $("#mycarouselAccPriVer1").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'" /></a></li>' ) ;
    }                    
    //A la fila 2 del catalogo 
    for (var i=cantidadPorFila; i<cantidadAccesoriosPV; i++) {
        var arrayImagen=arrayAccesoriosPriVer[i].split(":");
        $("#mycarouselAccPriVer2").append( '<li ><a title="'+arrayImagen[2]+'" class="thickbox" href="'+arrayImagen[1]+'"><img src="'+arrayImagen[0]+'"/></a></li>' ) ;
    }
    
         
     /******EVENTOS***********/
     //Calzados Primavera-Verano
     $("#calzadosPriVer").click(function(){
            if ($("#catalogoCalPriVer").is(":visible")){
                $("#catalogoCalPriVer").fadeOut('normal').addClass('hidden'); 
            }else{
                $("#catalogoCalOtoInv").fadeOut('normal').addClass('hidden'); 
                $("#catalogoAccPriVer").fadeOut('normal').addClass('hidden');
                $("#catalogoAccOtoInv").fadeOut('normal').addClass('hidden');
                
                $("#catalogoCalPriVer").fadeIn('normal').removeClass('hidden'); 
            }         
     });
     
     //Calzados Otoño-Invierno
     $("#calzadosOtoInv").click(function(){
            if ($("#catalogoCalOtoInv").is(":visible")){
                $("#catalogoCalOtoInv").fadeOut('normal').addClass('hidden'); 
            }else{
                $("#catalogoCalPriVer").fadeOut('normal').addClass('hidden'); 
                $("#catalogoAccPriVer").fadeOut('normal').addClass('hidden');
                $("#catalogoAccOtoInv").fadeOut('normal').addClass('hidden');
                
                $("#catalogoCalOtoInv").fadeIn('normal').removeClass('hidden'); 
            }         
     });
    
    //Accesorios Primavera-Verano
     $("#accesoriosPriVer").click(function(){
           if ($("#catalogoAccPriVer").is(":visible")){
                $("#catalogoAccPriVer").fadeOut('normal').addClass('hidden'); 
            }else{
                $("#catalogoCalPriVer").fadeOut('normal').addClass('hidden'); 
                $("#catalogoCalOtoInv").fadeOut('normal').addClass('hidden');
                $("#catalogoAccOtoInv").fadeOut('normal').addClass('hidden');
                 
                $("#catalogoAccPriVer").fadeIn('normal').removeClass('hidden'); 
            }
     });
     
     //Accesorios Otoño-Invierno
     $("#accesoriosOtoInv").click(function(){
            if ($("#catalogoAccOtoInv").is(":visible")){
                $("#catalogoAccOtoInv").fadeOut('normal').addClass('hidden'); 
            }else{
                $("#catalogoCalPriVer").fadeOut('normal').addClass('hidden'); 
                $("#catalogoCalOtoInv").fadeOut('normal').addClass('hidden');
                $("#catalogoAccPriVer").fadeOut('normal').addClass('hidden');
                 
                $("#catalogoAccOtoInv").fadeIn('normal').removeClass('hidden'); 
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
    $('#mycarouselCalPriVer1').jcarousel();
    $('#mycarouselCalPriVer2').jcarousel();
    $('#mycarouselCalOtoInv1').jcarousel();
    $('#mycarouselCalOtoInv2').jcarousel();
    
    $('#mycarouselAccPriVer1').jcarousel();
    $('#mycarouselAccPriVer2').jcarousel();
    $('#mycarouselAccOtoInv1').jcarousel();
    $('#mycarouselAccOtoInv2').jcarousel();
    
});
