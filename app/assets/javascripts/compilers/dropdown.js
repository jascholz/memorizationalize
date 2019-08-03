// ddf: DropDownForm

up.compiler('[dropdown]', (dropdown, data) => {
  let triggers = up.element.all(dropdown, '[dropdown-trigger]')
  let element = up.element.first(dropdown, '[dropdown-element]')
  let collapse = up.element.all(dropdown, '[dropdown-collapse]')

  let collapsableElements
  let collapsedElementNames = []
  let unObserveForms = undefined

  let colors = data['colors']

  function init() {
    resetObservers()

    collapsableElements = up.element.all(element, '[collapsable-element]')
    collapsableElements.forEach((collapsableElement) => {
      let collapsableElementName = collapsableElement.getAttribute('collapsable-element')
      var index = collapsedElementNames.indexOf(collapsableElementName)

      if (index === -1) {
        collapsableElement.style.height = 0
      }
    })

    if (element.getAttribute('state') === 'show') {
      showElement()
    }
  }

  function collapseElementWithoutErrors(target) {
    let errors = up.element.all(target, '.form--errors')

    if (errors.length === 0) {
      collapseElement()
    }
  }

  function collapseElement() {
    element.setAttribute('state', 'collapse')
    element.style.height = '0'

    let previousCurrent = up.element.first(dropdown, '[dropdown-trigger-current]')
    if (previousCurrent) {
      previousCurrent.removeAttribute('dropdown-trigger-current')
    }
  }

  function showElement(additionalHeight) {
    let content = up.element.all(element, '[dropdown-content]')

    setTimeout(() => {
      let contentHeight = 0
      for(let index = 0; index < content.length; ++index) {
        if (content[index].offsetHeight !== 0) {
          contentHeight = content[index].offsetHeight
        }
      }

      let collapseHeight = collapse[0].offsetHeight

      let collapsableElementsHeight = 0
      collapsableElements.forEach((collapsableElement) => {
        collapsableElementsHeight += parseInt(collapsableElement.style.height, 10)
      })

      element.style.height = (contentHeight + collapseHeight + additionalHeight + 80) + 'px'
    }, 0)
  }

  function setElementColor(color) {
    element.style.backgroundColor = color
  }

  function collapseParentElement(collapseElement, changedHeight) {
    collapsableParent = up.element.closest(collapseElement.parentElement, '[collapsable-element]')
    if (collapsableParent) {
      collapsableParentHeight = collapsableParent.offsetHeight
      console.log(collapsableParentHeight)
      collapsableParent.style.height = collapsableParentHeight + changedHeight + 'px'
    }
  }

  function resetObservers() {
    if (unObserveForms) {
      unObserveForms()
    }

    unObserveForms = up.observe(up.element.all(element, '.form'), function(value, name) {
      let changingElement = up.element.first(element, '[name="' + name + '"]')
      let changedElementSelector = changingElement.getAttribute('ddf-switch')
      let changedElements = up.element.all(element, changedElementSelector + '[ddf-show-for]')

      let changedHeight = 0
      changedElements.forEach((changedElement) => {
        if (changedElement.hasAttribute('collapsable-element')) {

          let changedElementName = changedElement.getAttribute('collapsable-element')
          var index = collapsedElementNames.indexOf(changedElementName)

          if (changedElement.getAttribute('ddf-show-for') === value) {
            let collapsableContent = up.element.first(changedElement, '[collapsable-content]')
            let collapsableContentHeight = collapsableContent.offsetHeight

            changedHeight += collapsableContentHeight
            changedElement.style.height = collapsableContentHeight + 'px'

            if (index === -1) {
              collapsedElementNames.push(changedElementName)
            }
          } else {
            if (changedElement.style.height) {
              changedHeight -= parseInt(changedElement.style.height, 10)
            } else {
              changedHeight = 0
            }
            changedElement.style.height = '0px'

            if (index !== -1) {
              collapsedElementNames.splice(index)
            }
          }
        }
        collapseParentElement(changedElement, changedHeight)
      })

      showElement(changedHeight)
    })
  }

  function htmlToElement(html, selector) {
    let htmlObject = document.createElement('div')
    htmlObject.innerHTML = html
    return up.element.first(htmlObject, selector)
  }

  up.on(triggers, 'click', (event) => {
    let triggerLabel = event.target.parentElement
    let triggerLabelColor = colors[event.target.value]
    let previousTrigger = up.element.first(dropdown, '[dropdown-trigger-current]')

    if (previousTrigger) {
      previousTrigger.removeAttribute('dropdown-trigger-current')
    }
    triggerLabel.setAttribute('dropdown-trigger-current', '')

    if (event.target.parentElement !== previousTrigger) {
      if (element.getAttribute('state') === 'collapse') {
        element.setAttribute('state', 'show')
      }
      showElement(0)

      setElementColor(triggerLabelColor)
    } else {
      collapseElement()
    }
  })

  up.on(collapse, 'click', (event) => {
    collapseElement()
  })

  up.on('up:fragment:inserted', (event) => {
    init()
    collapseElementWithoutErrors(event.target)
  })

  up.on('app:reset', (event) => {
    init()
    collapseElementWithoutErrors(event.target)
  })

  up.on(element, 'click', 'input[type="submit"]', (event) => {
    document.addEventListener('up:proxy:loaded', (event) => {
      let oldContentBody = up.element.first('.content--body')
        let newContentBody = htmlToElement(event.response.text, '.content--body')
        if (newContentBody) {
          oldContentBody.replaceWith(newContentBody)
          up.hello(newContentBody)
        }
    }, { once: true })
  })

})
