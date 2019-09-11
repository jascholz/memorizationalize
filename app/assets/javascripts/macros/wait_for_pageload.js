document.addEventListener("DOMContentLoaded", function() {
   elements = document.querySelectorAll('.wait-for-pageload')
   for (let i = 0; i < elements.length; ++i) {
     elements[i].classList.remove('wait-for-pageload')
   }
});
