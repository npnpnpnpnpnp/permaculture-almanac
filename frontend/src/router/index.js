import Vue from 'vue'
import Router from 'vue-router'
import Meta from 'vue-meta'
import main from '@/main'
import store from '@/store'
import Home from '@/views/home.vue'
import Resources from '@/views/resources.vue'
import BasicPage from '@/views/basic-page.vue'

Vue.use(Router)
Vue.use(Meta)

const scrollBehavior = (to, from, savedPosition) => {
  // https://github.com/quasarframework/quasar/issues/1466#issuecomment-414066098
  if ('scrollRestoration' in history) history.scrollRestoration = 'manual'

  return new Promise(resolve => {
    main.$root.$once('trigger-scroll', () => {
      if (savedPosition) {
        resolve(savedPosition)
      } else {
        resolve({ x: 0, y: 0 })
      }
    })
  })
}

const router = new Router({
  // base: process.env.BASE_URL,
  mode: 'history',
  routes: [],
  scrollBehavior
})

// Get API routes and basic data before loading view
router.beforeEach(async (to, from, next) => {
  // Check if URL has language segment
  const languages = store.state.availableLanguagesFallback.split(',')
  const lang = to.fullPath.split('/').filter(segment => segment)[0]
  // If yes, then update the language
  if (languages.includes(lang) && lang !== store.state.currentLanguage) {
    store.dispatch('setLanguage', lang)
  }

  if (store.state.initialized) {
    return next()
  } else {
    await store.dispatch('getDefaults')
    addRoutesFromApi(store.state.routes)
    next({
      path: to.fullPath,
      replace: true
    })
  }
})

const addRoutesFromApi = routes => {
  routes.forEach(route => {
    // Map backend templates to frontend views
    route.component = Home
    if (route.meta.template === 'basic-page') route.component = BasicPage
    if (route.meta.template === 'resources') route.component = Resources

    router.addRoute(route)
  })

  router.addRoute({
    path: '*',
    component: require('@/views/_404').default
  })

  // console.log(router.getRoutes())
}

export default router
