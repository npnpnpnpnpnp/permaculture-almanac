module.exports = {
  //baseUrl: process.env.NODE_ENV === 'production' ? '/' : '/',
  //assetsDir: 'assets',
  css: {
    sourceMap: true,
    loaderOptions: {
      sass: {
        data: `
          @import '@/styles/globals.scss';
        `
      }
    }
  }
}
