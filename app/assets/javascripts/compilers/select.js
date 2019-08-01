up.compiler('select', (select) => {
  let label = select.parentElement.querySelector('label')
  let options = up.element.all(select, 'option')

  // let dropdown = document.createElement('div')
  // dropdown.classList.add('select--dropdown')
  // dropdown.classList.add('-hidden')

  // let value = document.createElement('div')
  // value.classList.add('select--value')
  //
  // let arrow = document.createElement('div')
  // arrow.classList.add('select--arrow')
  //
  // function onArrowClick() {
  //   value.classList.add('-empty')
  //   value.textContent = select.getAttribute('placeholder')
  //   select.value = ''
  //   up.emit(select, 'change')
  // }
  //
  // function onOptionClick(selectValue, textContent) {
  //   value.textContent = textContent
  //   value.classList.remove('-empty')
  //
  //   arrow.textContent = '❌'
  //   arrow.classList.add('-clear')
  //
  //   select.value = selectValue
  //   up.emit(select, 'change')
  // }
  //
  // function buildDropdown() {
  //   for(let i = 0; i < options.length; ++i) {
  //     if (options[i].value === '') { continue }
  //     let option = document.createElement('div')
  //     option.classList.add('select--option')
  //     option.setAttribute('value', options[i].value)
  //     option.textContent = options[i].textContent
  //     dropdown.appendChild(option)
  //
  //     option.addEventListener('mousedown', (event) => {
  //       if (event.button !== 0) { return }
  //       onOptionClick(event.target.getAttribute('value'), event.target.textContent)
  //     })
  //   }
  // }
  //
  // function toggleDropdown(show) {
  //   if (show) {
  //     label.setAttribute('focused', '')
  //     dropdown.classList.remove('-hidden')
  //   } else {
  //     label.removeAttribute('focused')
  //     dropdown.classList.add('-hidden')
  //   }
  // }
  //
  // function onLabelClick() {
  //   if (event.target === arrow && arrow.classList.contains('-clear')) {
  //     onArrowClick()
  //   } else {
  //     if (dropdown.classList.contains('-hidden')) {
  //       select.focus()
  //       toggleDropdown(true)
  //     } else {
  //       toggleDropdown(false)
  //     }
  //   }
  // }
  //
  // function init() {
  //   if (select.value !== '') {
  //     selectedOption = undefined
  //
  //     for(let i = 0; i < options.length; ++i) {
  //       if (select.value === options[i].value) {
  //         selectedOption = options[i]
  //       }
  //     }
  //
  //     value.textContent = selectedOption.textContent
  //     arrow.textContent = '❌'
  //     arrow.classList.add('-clear')
  //   } else {
  //     arrow.textContent = '⌄'
  //     value.classList.add('-empty')
  //     value.textContent = select.getAttribute('placeholder')
  //   }
  //
  //   buildDropdown()
  //
  //   label.innerHTML = ''
  //   label.appendChild(dropdown)
  //   label.appendChild(value)
  //   label.appendChild(arrow)
  // }
  //
  // up.on(label, 'mousedown', (event) => {
  //   if (event.button !== 0) { return }
  //   event.preventDefault()
  //   onLabelClick()
  // })
  //
  // up.on(select, 'focus', (event) => {
  //   // // select.blur()
  //   // console.log(event.target.focused())
  //   // console.log('blur')
  //   event.preventDefault()
  // })
  //
  // up.on(label, 'focus', (event) => {
  //   event.preventDefault()
  // })
  //
  // up.on('mousedown', (event) => {
  //   let dropdownClicked = up.element.closest(event.target, 'label') === label
  //   if (!dropdownClicked) {
  //     toggleDropdown(false)
  //   }
  // })

  // init()
})
