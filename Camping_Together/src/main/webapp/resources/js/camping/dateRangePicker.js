$('input[name=date]').daterangepicker({
  locale: {
    separator: ' ~ ', // 시작일시와 종료일시 구분자
    format: 'YYYY-MM-DD', // 일시 노출 포맷
    applyLabel: '확인', // 확인 버튼 텍스트
    cancelLabel: '취소', // 취소 버튼 텍스트
    daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
    monthNames: [
      '1월',
      '2월',
      '3월',
      '4월',
      '5월',
      '6월',
      '7월',
      '8월',
      '9월',
      '10월',
      '11월',
      '12월'
    ]
  }
})

$('input[name=date]').on('apply.daterangepicker', function (ev, picker) {
  $(this).val(
    picker.startDate.format('YYYY-MM-DD') +
      '~' +
      picker.endDate.format('YYYY-MM-DD')
  )
  $('[name=checkIn]').eq(0).val(picker.startDate.format('YYYY-MM-DD'))
  $('[name=checkOut]').eq(0).val(picker.endDate.format('YYYY-MM-DD'))
})

$('#reservationDate').on('cancel.daterangepicker', function (ev, picker) {
  $('[name=checkIn]').val('')
  $('[name=checkOut]').val('')
})
