module.exports = {
  //publicPath: process.env.NODE_ENV === 'production' ? '/' : '/',
  //assetsDir: 'assets',
  crossorigin: 'anonymous',
  css: {
    sourceMap: true,
    loaderOptions: {
      sass: {
        prependData: `
          @import '@/styles/globals.scss';
        `
      }
    }
  }
}
