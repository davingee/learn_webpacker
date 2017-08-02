const webpack = require('webpack')
module.exports = {
    plugins: [
      // Creates a common vendor.js with all shared modules

      // new webpack.optimize.CommonsChunkPlugin('vendor', 'vendor.js')
      new webpack.optimize.CommonsChunkPlugin({
        name: 'vendor',
        minChunks: (module) => {
          // this assumes your vendor imports exist in the node_modules directory
          return module.context && module.context.indexOf('vendor') !== -1;
        }
      }),
      // Webpack code chunk - manifest.js
      new webpack.optimize.CommonsChunkPlugin({
        name: 'manifest',
        minChunks: Infinity
      })
    ]
  }
