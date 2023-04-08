if ($('#search_checkin, #search_checkout').length) {
  // check if element is available to bind ITS ONLY ON HOMEPAGE
  var currentDate = moment().format('MM-DD')

  $('#search_checkin, #search_checkout').daterangepicker(
    {
      locale: {
        format: 'MM-DD',
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
        Today: [moment(), moment()],
        Yesterday: [moment().subtract(1, '일'), moment().subtract(1, '일')],
        'Last 7 Days': [moment().subtract(6, '일'), moment()],
        'Last 30 Days': [moment().subtract(29, '일'), moment()],
        'This Month': [moment().startOf('월'), moment().endOf('월')],
        'Last Month': [
          moment().subtract(1, '월').startOf('월'),
          moment().subtract(1, '월').endOf('월')
        ]
      }
    },
    function (start, end, label) {
      // console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
      // Lets update the fields manually this event fires on selection of range
      var selectedStartDate = start.format('MM-DD') // selected start
      var selectedEndDate = end.format('MM-DD') // selected end

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
