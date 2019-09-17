up.compiler('[color-input]', (colorInput) => {
  let label = colorInput.parentElement.querySelector(`.drawer--color`)
  up.on(colorInput, 'change', (event) => {
    label.style.backgroundColor = colorInput.value
  })
})
