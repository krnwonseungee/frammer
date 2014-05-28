$(document).ready(function(){
  controller.bindEvents();
})

Controller = function(){};
View = function(){};

Controller.prototype = {
  bindEvents: function(){
    $( '.text-box textarea' ).keyup( function(e){
      if ( e.which == 32 ) {
        e.preventDefault();
        controller.createTranslationRequest()
      }
    })
  },

  createTranslationRequest: function(){
    $.ajax({
      type: "GET",
      url: "/generate",
      data: { sentence: $( '.text-box textarea' ).val() },
      dataType: "json",
      success: function(data){
        console.log('french word sent!')
      },
      error: function(data){
        console.log('french word not sent.')
      }
    }).done(function(data){
      // var translation = data.tuc[0].phrase.text
      view.renderTranslatedText(data)
    })
  },
}

View.prototype = {
  renderTranslatedText: function(data){
    $( '.translated' ).html( data )
  }
}

controller = new Controller();
view = new View();
