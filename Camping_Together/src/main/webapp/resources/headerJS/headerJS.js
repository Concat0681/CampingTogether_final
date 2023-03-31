$(document).scroll(function() {
    const scrollTop = $(this).scrollTop();
    if (scrollTop == 0) {
      $('.wrapper-top').removeClass('wrapper-top').addClass('scroll-top');
    } else {
      $('.scroll-top').removeClass('scroll-top').addClass('wrapper-top');
    }
  });