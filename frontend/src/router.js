import Vue from 'vue'
import Router from 'vue-router'
import Meta from 'vue-meta'
import Home from '@/views/home.vue'
import BasicPage from '@/views/basic-page.vue'

Vue.use(Router)
Vue.use(Meta)

const scrollBehavior = function() {
  return { x: 0, y: 0 }
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
      path: '/404',
      name: '404-error',
      component: require('@/views/_404').default,
      props: true
    },
    {
      path: '*',
      redirect: '404-error'
    }
  ])
}

function walkRoutes(routes) {
  routes.forEach(route => {
    route.meta = {
      url: route.url
    }

    route.component = Home
    if (route.template === 'basic-page') route.component = BasicPage

    route.name = route.id

    const langUrls = '(' + Object.values(route.url).join('|') + ')'
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
