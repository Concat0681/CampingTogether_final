function destroySlick () {
  if ($('#modal-photo-slick').hasClass('slick-initialized')) {
    $('#modal-photo-slick').slick('destroy')
  }
}

function applySlick () {
  $('#modal-photo-slick').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: false,
    setPosition: 0,
    arrows: true,
    dots: true,
    prevArrow: "<span class='material-symbols-outlined'>arrow_back_ios</span>", // 이전 화살표 모양 설정
    nextArrow:
      "<span class='material-symbols-outlined'>arrow_forward_ios</span>",
    fade: true
  })
}
$('.hidden-div').on('click', function (event) {
  if (event.stopPropagation) event.stopPropagation()
  $('#modal-photo-slick').empty()
  const url = $(this).parents('.shop-box').attr('onclick')
  const title = $(this).parents('.shop-box').find('.s-title').text()
  const shopNo = $(this).parents('.shop-box').find('input[name=shopNo]').val()
  const photoList = $(this).parents('.shop-box').find('input[name=photoList]')
  const price = $(this)
    .parents('.shop-box')
    .find('.shop-price-info')
    .children()
    .eq(0)
    .text()
  const delivary = $(this)
    .parents('.shop-box')
    .find('.shop-price-info')
    .find('[name=shopDelivary]')
    .val()
  const count = $(this)
    .parents('.shop-box')
    .find('.shop-price-info')
    .find('[name=shopCount]')
    .val()
  const memberId = $('#memberId').val()
  $('#quickViewModalLabel').text(title).css('color', '#AD8B73')
  photoList.each(function (i, p) {
    destroySlick()
    const img = $('<img>').attr('src', 'resources/upload/shop/' + $(p).val())
    console.log(img)
    $('#modal-photo-slick').append(img)
    applySlick()
  })
  $('.modal-shop-price').empty()
  $('.modal-shop-delivary').empty()
  $('.modal-shop-count').empty()
  $('.modal-shop-price').append(price)
  $('.modal-shop-delivary').append(delivary + ' 원')
  $('.modal-shop-count').append(count + ' 개')
  $('.modal-view-btn').attr('onclick', url)
})

$('#quickViewModal').on('shown.bs.modal', function (e) {
  $('#modal-photo-slick').resize() // 팝업 열때 슬라이드 깨짐 방지
  $('#modal-photo-slick').slick('refresh')
})
$('#quickViewModal').on('hide.bs.modal', function (e) {
  destroySlick()
  $('#modal-photo-slick').empty()
  applySlick()
})
$(function () {
  applySlick()
})
