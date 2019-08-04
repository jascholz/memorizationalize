up.compiler('[position]', (element, data) => {
  let container = element.parentElement
  let flippable = element.querySelector('[flippable]')
  let form = element.querySelector('form')

  let flip = data.flipped === true ? -1 : 1
  let widthRange = (container.scrollWidth - element.scrollWidth)
  let divisorX = widthRange / container.scrollWidth
  let heightRange = (container.scrollHeight - element.scrollHeight)
  let divisorY = heightRange / container.scrollHeight

  let elementRect = element.getBoundingClientRect()
  let dragShiftX = 0
  let dragShiftY = 0
  let elementHeight = elementRect.height
  let elementWidth = elementRect.width

  function setPosition() {
      widthRange = (container.scrollWidth - element.scrollWidth)
      divisorX = widthRange / container.scrollWidth
      heightRange = (container.scrollHeight - element.scrollHeight)
      divisorY = heightRange / container.scrollHeight

      let percentX = data.x * divisorX
      let percentY = data.y * divisorY

      element.style.left = percentX + '%'
      element.style.top = percentY + '%'

      elementRect = element.getBoundingClientRect()
  }

  function init() {
    element.style.transform = 'rotateZ(' + data.angle + 'deg)'
    flippable.style.transform = 'scaleX(' + flip + ')'
    setPosition()
    element.classList.remove('-hidden')
  }

  up.on(element, 'dragstart', '[drag]', (event) => {
    let rotationOffsetX = (elementWidth - elementRect.width) / 2
    let rotationOffsetY = (elementHeight - elementRect.height) / 2
    dragShiftX = event.clientX - elementRect.left + rotationOffsetX
    dragShiftY = event.clientY - elementRect.top + rotationOffsetY
  })

  up.on(element, 'drag', '[drag]', (event) => {
    if (event.clientX === 0 && event.clientY === 0) {
      return
    }

    const containerRect = container.getBoundingClientRect()
    element.style.left = event.clientX - containerRect.left - dragShiftX + 'px'
    element.style.top = event.clientY - containerRect.top - dragShiftY + 'px'
  })

  up.on(element, 'dragend', '[drag]', (event) => {
    event.preventDefault()
    const containerRect = container.getBoundingClientRect()
    element.style.left = event.clientX - containerRect.left - dragShiftX + 'px'
    element.style.top = event.clientY - containerRect.top - dragShiftY + 'px'

    newDataX = (element.offsetLeft / widthRange) * 100
    newDataY = (element.offsetTop / heightRange) * 100
    data.x = newDataX
    data.y = newDataY

    form.querySelector('[position-x]').value = data.x
    form.querySelector('[position-y]').value = data.y
    up.submit(form)

    elementRect = element.getBoundingClientRect()
  })

  up.on(window, 'resize', () => {
    setPosition()
  })

  let unbindScroll = up.on(window, 'scroll', () => {
    elementRect = element.getBoundingClientRect()
  })

  init()

  return () => {
    unbindScroll()
  }
})
