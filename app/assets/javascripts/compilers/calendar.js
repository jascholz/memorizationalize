up.compiler('[calendar]', (calendar, data) => {
  let day = data.day
  let selectedDayElement = undefined
  let yearSelect = up.element.first(calendar, '#user_calendar_date_1i')
  let monthSelect = up.element.first(calendar, '#user_calendar_date_2i')

  up.on(calendar, 'click', '.calendar--day', (event) => {
    let dayElement = up.element.closest(event.target, '[day]')
    let selectedDay = dayElement.getAttribute('day')

    if (selectedDayElement) {
      selectedDayElement.classList.remove('-selected')
    }
    selectedDayElement = dayElement

    dayElement.classList.add('-selected')
  })

  up.on(calendar, 'click', '.calendar--month-link', (event) => {
    event.preventDefault()
    yearSelect.value = event.target.getAttribute('year')
    monthSelect.value = event.target.getAttribute('month')
    up.emit(yearSelect, 'change')
  })

  up.on(calendar, 'mouseover', '.calendar--day', (event) => {
    day = up.element.closest(event.target, '.calendar--day')
    dayNumber = up.element.first(day, '.calendar--day-number')
    dayNumber.textContent = '+'
  })

  up.on(calendar, 'mouseout', '.calendar--day', (event) => {
    day = up.element.closest(event.target, '.calendar--day')
    dayNumber = up.element.first(day, '.calendar--day-number')
    dayNumber.textContent = day.getAttribute('day')
  })
})
