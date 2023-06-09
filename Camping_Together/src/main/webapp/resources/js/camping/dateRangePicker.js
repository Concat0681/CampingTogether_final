if ($('#search_checkin, #search_checkout').length) {
  // check if element is available to bind ITS ONLY ON HOMEPAGE
  var currentDate = moment().format('MM-DD')

  $('#search_checkin, #search_checkout').daterangepicker(
    {
      locale: {
        format: 'YYYY-MM-DD',
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
      },

      alwaysShowCalendars: true,
      minDate: currentDate,
      autoApply: true,
      autoUpdateInput: false,
      ranges: {
        오늘: [moment(), moment()],
        내일: [moment(), moment().add(1, 'days')],
        '2일': [moment(), moment().add(2, 'days')],
        '3일': [moment(), moment().add(3, 'days')],
        일주일: [moment(), moment().add(7, 'days')]
      }
    },
    function (start, end, label) {
      // console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
      // Lets update the fields manually this event fires on selection of range
      var selectedStartDate = start.format('YYYY-MM-DD') // selected start
      var selectedEndDate = end.format('YYYY-MM-DD') // selected end

      $checkinInput = $('#search_checkin')
      $checkoutInput = $('#search_checkout')

      // Updating Fields with selected dates
      $checkinInput.val(selectedStartDate)
      $checkoutInput.val(selectedEndDate)

      // Setting the Selection of dates on calender on CHECKOUT FIELD (To get this it must be binded by Ids not Calss)
      var checkOutPicker = $checkoutInput.data('daterangepicker')
      checkOutPicker.setStartDate(selectedStartDate)
      checkOutPicker.setEndDate(selectedEndDate)

      // Setting the Selection of dates on calender on CHECKIN FIELD (To get this it must be binded by Ids not Calss)
      var checkInPicker = $checkinInput.data('daterangepicker')
      checkInPicker.setStartDate(selectedStartDate)
      checkInPicker.setEndDate(selectedEndDate)
    }
  )
} // End Daterange Picker
