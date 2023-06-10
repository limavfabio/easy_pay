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
        default: "#fec901",
        // default: "#434b54",
      },
      colors: {
        main: "#3778c2",
        secondary: "#5gb523",
        textColor: "#434b54",
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
