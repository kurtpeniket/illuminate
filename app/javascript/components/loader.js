export const loader = () => {
  const btn = document.querySelector('#search-btn')
  const preloader = document.querySelector('.preloader');
  
  // const fadeEffect = setInterval(() => {
    //   if (!preloader.style.opacity) {
      //     preloader.style.opacity = 1;
      //   }
      //   if (preloader.style.opacity > 0) {
        //     preloader.style.opacity -= 0.7;
        //   } else {
          //     clearInterval(fadeEffect);
          //   }
          // }, 500);
  if (preloader) {
    // window.addEventListener('load', e => {
      setTimeout(function(){
        preloader.classList.add('preloader-invisible')
      }, 2000)
    // })
  }
}