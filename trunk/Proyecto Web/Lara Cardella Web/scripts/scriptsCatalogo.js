$(document).ready(function() {
     $("#menuCalzados").click(function(){
        $("#contenidoIzq").animate({width: 10}, 'slow');
        $("div:hidden").show("slow");
        $("body").append( '<scr' + 'ipt type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;
        $("#calzado").addClass("transparent");
     });
    
     //Expandir imagenes del catalogo
     $(".yoxview").click(function(){
        $("#calzado").yoxview({
        lang: "ja",
        backgroundColor: "#000099",
        autoPlay: true
        });
     });
});