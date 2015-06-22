// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-sprockets
//= require_tree .
//= require turbolinks
//= require underscore-min
//= require gmaps/google
//= require easing
//= require jquery.magnific-popup
//= require move-top
//= require owl.carousel
//= require responsiveslides.min


// jQuery (necessary for Bootstrap's JavaScript plugins)
// start-smoth-scrolling
$(document).ready(function($) {
  $(".scroll").click(function(event){
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
  });
});

// start-top-nav-script
$(window).load(function() {
  var pull 		= $('#pull');
    menu 		= $('nav ul');
    menuHeight	= menu.height();
  $(pull).on('click', function(e) {
    e.preventDefault();
    menu.slideToggle();
  });
  $(window).resize(function(){
        var w = $(window).width();
        if(w > 320 && menu.is(':hidden')) {
          menu.removeAttr('style');
        }
    });
});
// End-top-nav-script

$(document).ready( function() {
  $('.dropdown-toggle').dropdown();
});
