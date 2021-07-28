up.compiler('.-loading', (element) => {
  let spinner = element.querySelector('.spinner')
  let iframe = element.querySelector('iframe')

  iframe.addEventListener('load', () => {
    element.classList.remove('-loading')
    spinner.remove()
  })
})
