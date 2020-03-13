up.compiler('[auto-refresh]', (element) => {

  let interval = setInterval(() => {
    reload()
  }, 2000);

  function reload() {
    up.reload('.refresh-content', { url: element.getAttribute('auto-refresh'), history: false })
  }

  reload()
})
