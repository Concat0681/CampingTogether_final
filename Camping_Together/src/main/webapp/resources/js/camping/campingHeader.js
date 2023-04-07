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
