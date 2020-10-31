import Vue from 'vue'
import Router from 'vue-router'
import Meta from 'vue-meta'
import main from '@/main'
import Home from '@/views/home.vue'
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
  base: process.env.BASE_URL,
  mode: 'history',
  routes: [],
  scrollBehavior
})

export const addRoutesFromApi = routes => {
  routes = walkRoutes(routes)
  router.addRoutes(routes)

  router.addRoutes([
    {
      path: '*',
      component: require('@/views/_404').default
    }
  ])
}

function walkRoutes(routes) {
  routes.forEach(route => {
    route.meta = {
      url: route.url,
      template: route.template
    }

    route.component = Home
    if (route.template === 'basic-page') route.component = BasicPage

    route.name = route.id

    const langUrls =
      Object.keys(route.url).length > 1
        ? '(' + Object.values(route.url).join('|') + ')'
        : Object.values(route.url).join('|')

    route.path = route.dynamicRoute ? langUrls + route.dynamicRoute : langUrls

    // TODO: This is called apiChildren because otherwise vue-router confuses it with its own route.children
    if (route.apiChildren) {
      let metaChildren = []
      route.apiChildren.forEach(child => {
        metaChildren.push(child)
      })
      route.meta.children = metaChildren
      routes = [...routes, ...walkRoutes(route.apiChildren, metaChildren)]
    }
  })

  return routes
}

export default router
