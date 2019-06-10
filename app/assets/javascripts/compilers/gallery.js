up.compiler('[gallery]', (gallery) => {

  let images = up.element.all(gallery, '.gallery--image')
  let galleryFill = up.element.first(gallery, '.gallery--fill')
  let showAll = gallery.getAttribute('showAll')

  function onWindowResize() {
    if (!images.length) { return }
    for (let i = 0; i < images.length; ++i) {
      images[i].style.display = null
    }

    let galleryWidth = gallery.offsetWidth
    let imageWidth = images[0].offsetWidth
    let imagesPerRow = Math.floor(galleryWidth / (imageWidth - 1))

    if (imagesPerRow >= images.length) { return }

    let imagesInLastRow = images.length % imagesPerRow

    if (showAll) {
      let fillCount = imagesPerRow - imagesInLastRow
      if (fillCount !== 0 && fillCount !== imagesPerRow) {
        galleryFill.style.flexGrow = fillCount
      } else {
        galleryFill.style.flexGrow = null
      }
    } else {
      for (let i = 0; i < imagesInLastRow; ++i) {
        images[images.length - (i + 1)].style.display = 'none'
      }
    }
  }

  onWindowResize()
  window.addEventListener('resize', onWindowResize);
})
