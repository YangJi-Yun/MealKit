  const tab= document.querySelector('#tab_bar');
  const navbarHeight = tab.getBoundingClientRect().top;
  document.addEventListener('scroll', () =>{
    // console.log(window.scrollY);
    // console.log(`navbarHeight : ${navbarHeight}`);
    if(window.scrollY > navbarHeight) {
      tab.classList.add('fix');
      }else {
      tab.classList.remove('fix');
      }
  });
