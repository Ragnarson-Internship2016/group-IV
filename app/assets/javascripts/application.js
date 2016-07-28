// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require select2
//= require material.min
//= require_tree .

$(document).on("turbolinks:load", function() {
  $(".scroll").on('click', function(event){
      event.preventDefault();

      //goto that anchor by setting the body scroll top to anchor top
      $('.mdl-layout__content').animate({
        scrollTop: $('#section2').offset().top
      }, 500);
  });
})

document.addEventListener('turbolinks:load', function() {
  componentHandler.upgradeDom();
  $(".js-selectpicker").select2({
    placeholder: "Select ingredients",
    allowClear: true
  });
});
