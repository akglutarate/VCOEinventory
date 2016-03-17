
jQuery(function($) {
  $('.view_history').click(function() {
    $('#exchange_history').slideToggle(100);
    $(this).toggleClass('open');
    
    if ( $(this).is('.open') ) {
      $(this).html('Hide History');
    } else {
      $(this).html('Show History');
    }
    
    return false;
  });
})(jQuery);

