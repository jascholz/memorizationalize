up.compiler('.header', (header) => {
  let body = document.querySelector('body')
  let title = header.querySelector('.header--title')
  up.on(title, 'click', (event) => {
    if (body.getAttribute('layout') == 'application') {
      event.preventDefault()
      up.scroll(document.scrollingElement, 0)
      up.emit('app:reset')
    }
  })
})
