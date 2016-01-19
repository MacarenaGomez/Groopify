(function () {
  "user strict";

  var ajax = new groopify.Ajax();
  var topic; 

  function getPetDetail(response){
    $('.detail').show();

    ajax.execute('/api/users/' + response.pet.user_id, getOwner, getError);
    
    $('#pet-name').text(response.pet.name);
    $('#pet-species').text(response.pet.species);
    $('#pet-age').text(response.pet.age);

    $('#pet-photo').attr('src','http://localhost:3000' + response.url);
  }

  function getOwner(response){
    $('#pet-owner').text(response.name);
  }

  function getError(error){
    console.error("Error searching pet detail: " + error);
  }

  $(document).on('click','a[pet-id]', function(event){
    event.preventDefault();
    
    var pet_id = parseInt($(event.currentTarget).attr('pet-id'));    
    ajax.execute('/api/pets/' + pet_id, getPetDetail, getError);
  });

})();

