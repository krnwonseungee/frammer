$(document).ready(function(){
  controller.bindEvents();
})

Controller = function(){};
View = function(){};

Controller.prototype = {
  bindEvents: function(){
    $( '.text-box textarea' ).keyup( view.showGrammarCheckedText )
  }
}

View.prototype = {
  showGrammarCheckedText: function(){
    $( '.grammar-checked' ).html($( '.text-box textarea' ).val() )
  }
}

controller = new Controller();
view = new View();
