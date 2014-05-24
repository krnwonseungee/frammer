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
      dataType: "text",
      success: function(data){
        console.log('french word sent!')
      },
      error: function(data){
        // console.log(Object.keys(data))
        // console.log('french word not sent.')
      }
    }).done(function(data){
      // console.log(data)
      controller.retrieveTranslatedText(data)
    })
  },

  retrieveTranslatedText: function(){
    $.ajax({
      type: "GET",
      url: "/generate",
      // data: data,
      dataType: "json",
      success: function(data){
        console.log(data)
        console.log('english word retrieved!')
      },
      error: function(){
        console.log('english word not retrieved.')
      }
    }).done(function(data){
      console.log(data)
      console.log(Object.keys(data))
      $( '.translated' ).html($( data ).val() )
      // view.renderTranslatedText(data)
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
