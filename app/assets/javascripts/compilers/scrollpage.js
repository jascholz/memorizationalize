up.compiler('[scroll-page]', (scrollPage) => {

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

  function topVisible() {
    var bounding = scrollPage.getBoundingClientRect()
    // console.log(bounding.top)
    return bounding.top > 0
  }

  function bottomVisible() {
    var bounding = scrollPage.getBoundingClientRect()
    let viewportHeight = (window.innerHeight || document.documentElement.clientHeight)
    return bounding.bottom - viewportHeight <= 0
  }

  up.on(window, 'scroll', () => {
    // console.log(bottomVisible())
    // console.log(topVisible())

    // Check if element is in viewport
    // if (isInViewport(scrollPage)) {
    	// console.log('In the viewport!')
      // document.scrollingElement
    // } else {
    	// console.log('Not in the viewport... whomp whomp')
    // }
  })
})
