up.compiler('[scroll]', (scroll) => {
  let pages = scroll.querySelectorAll('[scroll-page]')
  let scrolling = false

  function scrollTo(scrollY) {
    let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
    let viewTop = 120

    if (scrollY > 0) {
      for (let i = 0; i < pages.length; ++i) {
        let page = pages[i]
        let bounding = page.getBoundingClientRect()
        let pageHeight = bounding.bottom - bounding.top

        if (bounding.bottom <= viewportHeight && bounding.bottom > viewTop) {
          return page.offsetTop + pageHeight
        } else if (bounding.bottom <= viewportHeight + scrollY && bounding.bottom > viewTop) {
          return page.offsetTop + pageHeight
        }
      }
    } else if (scrollY < 0) {
      for (let i = pages.length - 1; i >= 0 ; --i) {
        let page = pages[i]
        let bounding = page.getBoundingClientRect()
        let pageHeight = bounding.bottom - bounding.top

        if (bounding.top < viewTop) {
          return page.offsetTop
        } else if (bounding.top <= viewTop) {
          return page.offsetTop - pageHeight
        }
      }
    }
  }

  function onMouseWheel(event) {
    let scrollPosition = scrollTo(event.deltaY)
    if (scrollPosition !== undefined && scrolling === false) {
      scrolling = true
      up.scroll(document.scrollingElement, scrollPosition, { behavior: 'smooth' }).then(() => {
        scrolling = false
      })
      event.preventDefault()
    } else if (scrolling === true) {
      event.preventDefault()
    }
  }

  window.addEventListener ('wheel', onMouseWheel, {passive: false})
})
