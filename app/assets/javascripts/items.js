$(document).on('turbolinks:load', function() {
  $('.item-image-thumbnail :first-child').addClass('selected');

  $('.item-image-thumbnail__part--mini-image').mouseover(function(){
   var $thisImg = $(this).attr('src');
   $('.item-image-box__main--image').attr({src:$thisImg});
  });
})