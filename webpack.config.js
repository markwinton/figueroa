var path = require("path");

module.exports = {
  entry: path.resolve(__dirname, "src", "app.jsx"),
  output: {
    path: path.resolve(__dirname, "build"),
    filename: "app.js"
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: [
              '@babel/preset-env',
              '@babel/preset-react'
            ]
          }
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader'
        ]
      },
      {
        test: /\.(png|ttf|jpeg)$/,
        use: [
          'file-loader'
        ]
      }
    ]
  }
};
