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
      neutral: colors.trueGray,
    },
    // extend: {
    //   fontFamily: {
    //     'sans': ['Open Sans', 'sans-serif']
    //   },
    // }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}
