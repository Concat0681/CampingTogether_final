

$('.camping-list-menu>div').on('click', function () {
  $(this).parent().find('span').removeClass('clicked-span')
  $(this).find('span').addClass('clicked-span')
})

$('.shop-box').on('mouseenter', function () {
  $(this).find('.hidden-div').slideDown()
  const url = $(this).find('.secondPhoto').text()
  if (url != '') {
    $(this)
      .find('img')
      .attr('src', 'resources/upload/shop/' + url)
  }
})

$('.shop-box').on('mouseleave', function () {
  $(this).find('.hidden-div').slideUp()
  const url = $(this).find('.firstPhoto').text()
  $(this)
    .find('img')
    .attr('src', 'resources/upload/shop/' + url)
})

function viewShop (shopNo, memberId) {
  location.href =
    '/viewShop.do?shopNo=' + shopNo + '&reqPage=1&menu=0&memberId=' + memberId
}

function viewShopList (shopCategory, reqPage) {
  location.href =
    '/shopList.do?shopCategory=' + shopCategory + '&reqPage=' + reqPage
}
