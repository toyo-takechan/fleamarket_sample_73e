$(document).ready(function(){
  $('.item-image-thumbnail :first-child').addClass('selected');
});

$(function(){
  $('.item-image-thumbnail__part--mini-image').mouseover(function(){
   var $thisImg = $(this).attr('src');
   $('.item-image-box__main--image').attr({src:$thisImg});
  });
 });