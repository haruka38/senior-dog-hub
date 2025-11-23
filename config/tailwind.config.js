const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  // デフォルトで入っていないフォントやカラーに名前をつけて使えるようにする
  theme: {
    extend: {
      fontFamily: {
        body: ['Zen Kaku Gothic New', ...defaultTheme.fontFamily.sans],
        shirokuma: ['Shirokuma', 'sans-serif'],
        kaisei_decol: ['Kaisei Decol', 'sans-serif'],
        zen_kaku: ['Zen Kaku Gothic New', 'sans-serif']
      },
      colors: {
        'ivory': '#FDFBF6',
        'beige': '#E9E1D4',
        'brown': '#A67B5B',
        'light-brown': '#BA9174',
        'green': '#C8D6AF'
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),
  ]
}
