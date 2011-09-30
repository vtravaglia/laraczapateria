$(document).ready(function() {
     $("#menuCalzados").click(function(){
            if ($("#contenidoIzq").width()==10){
                $("#contenidoIzq").animate({width: 0}, 'slow');
                $("div:hidden").hide("slow");
                $("body").remove("#newScript");
            }else{
                $("#contenidoIzq").animate({width: 10}, 'slow');
                $("div:hidden").show("slow");
                $("body").append( '<scr' + 'ipt id="newScript" type="text/javascript" src=" yoxview/yoxview-nojquery.js "><\/scr' + 'ipt>' ) ;
                //$("#calzado").addClass("transparent");
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
