$(document).on('turbolinks:load', function() {

  $('.parent').hover(function() {
    $(this).children('.nav__content').show();
  }, function() {
    $(this).children('.nav__content').hide();
  });

  $('.child-name').hover(function() {
    $(this).children('.nav__content--grandchild').show();
  }, function() {
    $(this).children('.nav__content--grandchild').hide();
  });
});