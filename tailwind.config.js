const colors = require('tailwindcss/colors')

module.exports = {
  content: [
     './source/**/*.html',
     './source/**/*.erb',
     './source/**/*.js',
     './components/**/*.rb'
   ],
  theme: {
    colors: {
      transparent: 'transparent',
      white: colors.white,
      black: colors.black,
      neutral: colors.neutral,
      gray: colors.gray,
      blue: colors.blue,
    },
    fontFamily: {
      'heading': ['Miltonian Tattoo', 'sans-serif']
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}
