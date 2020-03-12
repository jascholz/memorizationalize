up.compiler('[copy-to-clipboard]', (element) => {
  element.addEventListener('click', () => {
    let textArea = document.createElement('textarea');
    textArea.value = element.textContent;
    textArea.setAttribute('readonly', '');
    textArea.style.position = 'absolute';
    textArea.style.left = '-9999px';
    document.body.appendChild(textArea);
    textArea.select();
    document.execCommand('copy');
    document.body.removeChild(textArea);
  })
})
