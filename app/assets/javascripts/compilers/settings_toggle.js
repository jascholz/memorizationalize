up.compiler('[settings-toggle]', (settingsToggle) => {

  up.on(settingsToggle, 'click', (event) => {
    let body = document.querySelector('body')
    let hero = up.element.first(document, '.home-hero')
    let options = up.element.first(hero, '.options')
    event.preventDefault()

    if (body.getAttribute('layout') === 'application') {
      up.element.toggleClass(hero, '-options')
      up.scroll(document.scrollingElement, 0)
    } else {
      up.visit('/', { target: '' })
    }
  })

  up.on('app:reset', () => {
    let hero = up.element.first(document, '.home-hero')
    hero.classList.remove('-options')
  })
})
