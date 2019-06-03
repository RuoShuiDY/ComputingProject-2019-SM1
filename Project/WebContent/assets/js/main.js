(function ($) {
$(document).ready(function () {
  $('#toggler').click(function(){
    if(!$(this).hasClass("sidebar-collapse")){
      $('#sidebar').hide();
      $(this).addClass("sidebar-collapse");
      $('.page-content').removeClass('col-xs-10');
      $('.page-content').removeClass('col-sm-10');
      $('.page-content').removeClass('col-md-10');
      $('.page-content').removeClass('col-lg-10');
      $('.page-content').addClass('col-lg-12');
      $('.page-content').addClass('col-md-12');
      $('.page-content').addClass('col-sm-12');
      $('.page-content').addClass('col-xs-12');
    }else{
      $('#sidebar').show();
      $(this).removeClass("sidebar-collapse");
      $('.page-content').removeClass('col-lg-12');
      $('.page-content').removeClass('col-md-12');
      $('.page-content').removeClass('col-sm-12');
      $('.page-content').removeClass('col-xs-12');
      $('.page-content').addClass('col-xs-10');
      $('.page-content').addClass('col-sm-10');
      $('.page-content').addClass('col-md-10');
      $('.page-content').addClass('col-lg-10');
    }
  });  
});
} (jQuery));


