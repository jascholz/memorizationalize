up.compiler('[colored]', coloredElement => {
  let color = coloredElement.getAttribute('colored')
  coloredElement.style.backgroundColor = color
})
