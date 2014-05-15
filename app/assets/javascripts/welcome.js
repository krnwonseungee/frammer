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
      url: "/translations",
      data: { sentence: $( '.text-box textarea' ).val() }
    }).done(function(data){
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
