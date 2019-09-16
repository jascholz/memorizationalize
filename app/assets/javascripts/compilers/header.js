up.compiler('.header', (header) => {
  let body = document.querySelector('body')
  let title = header.querySelector('.header--title')
  up.on(title, 'click', (event) => {
    event.preventDefault()
    if (body.getAttribute('layout') === 'application') {
      up.scroll(document.scrollingElement, 0)
      up.emit('app:reset')
    } else {
      up.visit('/', { target: 'body' })
    }
  })
})
