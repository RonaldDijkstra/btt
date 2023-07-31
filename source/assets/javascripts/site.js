// This is where it all goes :)
import scrollTo from './scrollTo';

const button = document.getElementById('scrollButton');

button.addEventListener('click', () => {
  scrollTo('contactForm'); 
});