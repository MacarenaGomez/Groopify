(function(){
  groopify.Ajax = function(){

  };

  groopify.Ajax.prototype.execute = function(uri, callback_function, callback_error){
    $.ajax({
      url: uri,
      success: function(response){
        callback_function(response);
      },
      error: function(error){
        callback_error(error);
      }
    });
  };

})();