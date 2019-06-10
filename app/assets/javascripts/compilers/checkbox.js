up.compiler('[checkbox]', (checkBox) => {
  up.on(checkBox, 'click', (event) => {
    up.element.first(event.target.parentElement, '.checkbox').setAttribute('active', '')
    event.stopPropagation()
  })
})
