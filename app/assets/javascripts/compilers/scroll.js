up.compiler('[scroll]', (scroll) => {
  let pages = scroll.querySelectorAll('[scroll-page]')
  let scrollIndex = 0

  function scrollTo(scrollY) {
    let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
    let viewTop = 120

    if (scrollY > 0) {
      for (let i = 0; i < pages.length; ++i) {
        let page = pages[i]
        let bounding = page.getBoundingClientRect()
        let pageHeight = bounding.bottom - bounding.top

        if (bounding.bottom <= viewportHeight && bounding.bottom > viewTop) {
          console.log('nxt of', i)
          return page.offsetTop + pageHeight
        } else if (bounding.bottom <= viewportHeight + scrollY && bounding.bottom > viewTop) {
          console.log('btm of', i)
          return page.offsetTop + pageHeight
        }
      }
    } else if (scrollY < 0) {
      for (let i = pages.length - 1; i >= 0 ; --i) {
        let page = pages[i]
        let bounding = page.getBoundingClientRect()
        let pageHeight = bounding.bottom - bounding.top

        // if (bounding.top >= 0 && bounding.top > viewTop) {
        //   console.log('nxt of', i)
        //   return page.offsetTop + pageHeight
        // } else if (bounding.bottom <= viewportHeight + scrollY && bounding.bottom > viewTop) {
        //   console.log('btm of', i)
        //   return page.offsetTop + pageHeight
        // }
      }
    }
    // return 0
  }

  function onMouseWheel(event) {
    let scrollPosition = scrollTo(event.deltaY)
    if (scrollPosition) {
      up.scroll(document.scrollingElement, scrollPosition)
      event.preventDefault()
    }
  }

  window.addEventListener ('wheel', onMouseWheel, {passive: false})
})
