$('#searchInput').on('click', function () {
  setTimeout(() => {
    $('.hidden-search').show()
  }, 200)
})

$('#searchInput').on('blur', function () {
  setTimeout(() => {
    $('.hidden-search').hide()
  }, 200)
})

$('.cityName').on('click', function () {
  $('#searchInput').val($(this).text())
  $('[name=cityNameEN]').val($(this).attr('id'))
})

$('#sido').on('click', function () {
  setTimeout(() => {
    $('.hidden-sido-search').show()
  }, 200)
})

$('#sido').on('blur', function () {
  setTimeout(() => {
    $('.hidden-sido-search').hide()
  }, 200)
})

$('.sido').on('click', function () {
  $('#sido').val($(this).text())
  $('#searchInput').val('')
  $('#searchInput').attr('placeholder', '도시')
  $('[name=cityNameEN]').val('')
  $('.cityName').hide()
  $('#placeholder').hide()
  $('.' + $(this).attr('id')).show()
})

$(function () {
  if ($('#campingSido').val() != '') {
    $('.cityName').hide()
    $('.sido').each(function (i, c) {
      if ($(c).text() == $('#campingSido').val()) {
        $('.' + $(c).attr('id')).show()
      }
    })
  }
})
