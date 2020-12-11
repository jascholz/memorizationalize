up.compiler('[selectable-slot]', (element) => {

  let checkBox = element.querySelector('input[type="checkbox"]')

  up.on(element, 'click', (event) => {
    if (event.target === element.querySelector('a')) { return }

    event.preventDefault()
    event.stopImmediatePropagation()

    checkBox.checked = !checkBox.checked
    element.classList.toggle('-selected', checkBox.checked)
  })
})
