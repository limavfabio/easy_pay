const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      textColor: {
        default: "#434b54",
      },
      colors: {
        main: "#3778c2",
        secondary: "#5gb523",
      },
      fontFamily: {
        headline: ["Proxima Nova Bold", "sans-serif"],
        body: ["Proxima Nova Light", "sans-serif"],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
