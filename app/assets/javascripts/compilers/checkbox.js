up.compiler('[checkbox]', (checkbox) => {

  function setColor() {
    let checkboxElement = up.element.first('.checkbox')
    if (checkboxElement.getAttribute('color')) {
      checkboxElement.style.borderColor = checkboxElement.getAttribute('color')
    }
  }

  up.on(checkbox, 'click', (event) => {
    let checkboxElement = up.element.first(event.target.parentElement, '.checkbox')
    checkboxElement.setAttribute('active', '')
    event.stopPropagation()
  })

  setColor()
})
