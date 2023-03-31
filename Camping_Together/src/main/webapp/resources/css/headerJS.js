$(document).scroll(function() {
    const scrollTop = $(this).scrollTop();
    if (scrollTop == 0) {
      $('.wrapper-top').removeClass('wrapper-top').addClass('scroll-top');
      $('.wrapper-bottom').removeClass('wrapper-bottom').addClass('scroll-top');
    } else {
      $('.scroll-top').removeClass('scroll-top').addClass('wrapper-top');
      $('.scroll-bottom').removeClass('scroll-bottom').addClass('wrapper-top');
    }
});

  $(window).on('resize', function() {
    var windowWidth = $(window).width();
    if (windowWidth < 1500) {
      $('.header-logo').css({
        'width': '120px',
        'height': '60px'
      });
      $('.login>li').css({
        'height': '40px',
        'width': '80px'
      });
      $('.nav-list>li').css({
        'height': '24px',
        'width': '150px'
      });
      $('.nav-bottom').css('width', '1200px');
      $('.freeboard').css({
        'width': '120px',
        'height': '120px'
      });
      $('.nav-list>li>a').css('font-size', '12px');
    } else {
      $('.header-logo').css({
        'width': '160px',
        'height': '80px'
      });
      $('.login>li').css({
        'height': '50px',
        'width': '100px'
      });
      $('.nav-list>li').css({
        'height': '30px',
        'width': '200px'
      });
      $('.nav-bottom').css('width', '1400px');
      $('.freeboard').css({
        'width': '150px',
        'height': '150px'
      });
      $('.nav-list>li>a').css('font-size', '14px');
    }
  });
  