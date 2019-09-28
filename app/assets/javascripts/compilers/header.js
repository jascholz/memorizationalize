up.compiler('.header', (header) => {
  let body = document.querySelector('body')
  let title = header.querySelector('.header--title')

  up.on(header, 'click', '.header--title', (event) => {
    event.preventDefault()
    if (body.getAttribute('layout') === 'application') {
      up.scroll(document.scrollingElement, 0)
      up.emit('app:reset')
    } else {
      up.visit('/', { target: '.content' })
    }
  })
})
