$(document).ready(function(){
  controller.bindEvents();
})

Controller = function(){};
View = function(){};

Controller.prototype = {
  bindEvents: function(){
    // $( '.text-box textarea' ).keyup( view.showGrammarCheckedText )
    $( '.text-box textarea' ).keyup( function(e){
      e.preventDefault();
      controller.createTranslationRequest()
    })
  },

  createTranslationRequest: function(){
    $.ajax({
      type: "POST",
      url: "/generate",
      data: { sentence: $( '.text-box textarea' ).val() },
      success: function(data){
        console.log('french word sent!')
      },
      error: function(data){
        console.log('french word not sent.')
      }
    }).done(function(data){
      controller.retrieveTranslatedText(data)
    })
  },

  retrieveTranslatedText: function(){
    $.ajax({
      type: "GET",
      url: "/generate",
      dataType: "json",
      success: function(){
        console.log('english word retrieved!')
      },
      error: function(){
        console.log('english word not retrieved.')
      }
    }).done(function(data){
      // controller.retrieveTranslatedText(data)
    })
  }
}

View.prototype = {
  showGrammarCheckedText: function(){
    $( '.grammar-checked' ).html($( '.text-box textarea' ).val() )
  },

  renderTranslatedText: function(data){
    $( '.translated' ).html($( data ).val() )
  }
}

controller = new Controller();
view = new View();
