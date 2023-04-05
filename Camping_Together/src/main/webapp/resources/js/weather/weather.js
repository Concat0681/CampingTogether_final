var weatherIcon = {
  '01': 'sunny',
  '02': 'cloudy',
  '03': 'cloudy',
  '04': 'cloudy',
  '09': 'rainy',
  10: 'rainy',
  11: 'thunderstorm',
  13: 'cloudy_snowing',
  50: 'fas fa-smog'
}

var apiURI =
  'https://api.openweathermap.org/data/2.5/forecast?lat=37.56826&lon=126.977829&appid=d8d8cf6db7ad526a7ec43b51070a4d75'
$(function () {
  $.ajax({
    url: apiURI,
    dataType: 'json',
    type: 'GET',
    async: 'false',
    success: function (resp) {
      const date = new Date()
      const hours = date.getHours()
      const compareHours = Math.floor(hours / 3) * 3
      resp.list.forEach(r => {
        if (r.dt_txt.substr(11, 2) == compareHours) {
          const div1 = $('<div>').addClass('weather-info')
          const icon = r.weather[0].icon.substr(0, 2)
          const temp = Math.floor(r.main.temp - 273.15) + 'º'
          const div2 = $('<div>').addClass('weather-temp').append(temp)
          const date = r.dt_txt.substr(5, 6)
          const div3 = $('<div>').addClass('weather-date').append(date)
          const span =
            '<span class=material-symbols-outlined>' +
            weatherIcon[icon] +
            '</span>'
          div1.append(span).append(div2).append(div3)
          $('.weather-list').append(div1)
        }
      })
    }
  })
})
