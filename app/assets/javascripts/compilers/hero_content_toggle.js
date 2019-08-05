up.compiler('[hero-content-toggle]', (toggle) => {
  heroContent = up.element.closest(toggle, '.home-hero--content')

  up.on(toggle, 'click', () => {
    up.element.toggleClass(heroContent, '-minimized')
    up.emit('homeHero:contentToggle', { visible: !heroContent.classList.contains('-minimized') })
  })
})
