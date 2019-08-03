up.compiler('[settings-toggle]', (settingsToggle) => {
  let hero = up.element.first(document, '.home-hero')
  let options = up.element.first(hero, '.options')

  up.on(settingsToggle, 'click', (event) => {
    event.preventDefault()
    up.element.toggleClass(hero, '-options')
    up.scroll(document.scrollingElement, 0)
  })

  up.on('app:reset', () => {
    hero.classList.remove('-options')
  })
})
