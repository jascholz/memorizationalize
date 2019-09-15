up.compiler('[checkbox]', (checkbox) => {

  function setColor() {
    let checkboxElement = up.element.first(checkbox, '.checkbox')
    if (checkboxElement.getAttribute('color')) {
      // checkboxElement.style.borderColor = checkboxElement.getAttribute('color')
      checkboxElement.style.color = checkboxElement.getAttribute('color')
    }
  }

  up.on(checkbox, 'click', (event) => {
    let checkboxElement = up.element.first(event.target.parentElement, '.checkbox')
    checkboxElement.setAttribute('active', '')
    event.stopPropagation()
  })

  setColor()
})
