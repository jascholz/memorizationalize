up.compiler('[scroll]', (scroll) => {
  let pages = scroll.querySelectorAll('[scroll-page]')
  let scrollIndex = 0

  // console.log(pages);

  // function isInViewport(elem) {
  //   let bounding = elem.getBoundingClientRect()
  //   let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
  //   console.log(bounding.bottom)
  //   console.log(window.innerHeight)
  //   return (
  //     bounding.top >= 0 &&
  //     // bounding.left >= 0 &&
  //     bounding.bottom <= (window.innerHeight || document.documentElement.clientHeight) // &&
  //     // bounding.right <= (window.innerWidth || document.documentElement.clientWidth)
  //   )
  // }

  function topVisible(page) {
    var bounding = page.getBoundingClientRect()
    // console.log(bounding.top)
    return bounding.top > 0
  }

  function bottomVisible() {
    var bounding = pages[scrollIndex].getBoundingClientRect()
    let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
    return bounding.bottom - viewportHeight <= 0
  }

  function currentPage() {
    for (let i = 0; i < pages.length; ++i) {

      var bounding = pages[i].getBoundingClientRect()
      let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
      // console.log('top: ', bounding.top)
      // console.log('bottom: ', bounding.bottom)
      // console.log('viewportHeight', viewportHeight)

      viewTop = 120 // HeaderHeight + homeFormHeight
      if (bounding.top <= 120 && bounding.bottom >= viewportHeight) {
        // console.log('dis')
        return i
      }

      // console.log(' ')
    }
  }

  function onMouseWheel(event) {
    // console.log(event)
    // event.preventDefault()
    // console.log(currentPage())
    // console.log(pages.length > currentPage() + 1)
    // if (event.deltaY > 0 && pages.length > currentPage() + 1) {
    //   up.scroll(document.scrollingElement, pages[currentPage() + 1].offsetTop)
    //   event.preventDefault()
    // }
  }

  window.addEventListener ("mousewheel", onMouseWheel, {passive: false});
})
