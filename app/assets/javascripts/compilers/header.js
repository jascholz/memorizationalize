up.compiler('.header', (header) => {
  let title = header.querySelector('.header--title')
  up.on(title, 'click', (event) => {
    event.preventDefault()
    console.log("Dwddwdw")
    up.scroll(document.scrollingElement, 0)
    up.emit('app:reset')
  })
})
