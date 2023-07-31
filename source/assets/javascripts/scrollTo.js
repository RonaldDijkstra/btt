export default function scrollTo(sectionId) {
  const section = document.getElementById(sectionId);
  if (section) {
      const startPos = window.scrollY;
      const endPos = section.getBoundingClientRect().top + window.scrollY;
      const distance = endPos - startPos;
      const duration = 800; // The duration of the smooth scroll in milliseconds
      let startTimestamp;

      function scrollStep(timestamp) {
          if (!startTimestamp) startTimestamp = timestamp;
          const elapsed = timestamp - startTimestamp;
          const progress = Math.min(elapsed / duration, 1);
          window.scrollTo(0, startPos + distance * easeInOutCubic(progress));
          if (elapsed < duration) {
              window.requestAnimationFrame(scrollStep);
          }
      }

      function easeInOutCubic(t) {
          // Cubic easing function for smooth scrolling
          return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
      }

      window.requestAnimationFrame(scrollStep);
  }
}
