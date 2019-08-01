up.compiler('.header', (header) => {
  let title = header.querySelector('.header--title')
  up.on(title, 'click', () => {
    up.scroll(document.scrollingElement, 0)
  })
})
