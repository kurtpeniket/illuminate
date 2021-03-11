export const loader = () => {
  const preloader = document.querySelector('.preloader');
  const fadeEffect = setInterval(() => {
    if (!preloader.style.opacity) {
      preloader.style.opacity = 1;
    }
    if (preloader.style.opacity > 0) {
      preloader.style.opacity -= 0.7;
    } else {
      clearInterval(fadeEffect);
    }
  }, 1500);
}