//Estamos creando un namespace para nosotros, init inicializará todo nuestro js
if (window.groopify === undefined){
  window.groopify = {};
}

groopify.init = function() {
  console.log("groopify ONLINE!");
};

$(document).on("ready",function(){
  groopify.init();
  $('.detail').hide();
});
