(function () {
  "user strict";

  var ajax = new groopify.Ajax();
  var topic; 

  function getPetDetail(response){
    $('.detail').show();

    ajax.execute('/api/users/' + response.user_id, getOwner, getError);

    $('#pet-name').text(response.name);
    $('#pet-species').text(response.species);
    $('#pet-age').text(response.age);
  }

  function getOwner(response){
    $('#pet-owner').text(response.name);
  }

  function getError(error){
    console.error("Error searching pet detail: " + error);
  }

  $(document).on('click','a', function(event){
    var pet_id = parseInt($(event.currentTarget).attr('pet-id'));
    
    ajax.execute('/api/pets/' + pet_id, getPetDetail, getError);
  });

})();

