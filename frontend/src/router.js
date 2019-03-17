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
  mode: 'history',
  base: process.env.BASE_URL,
  scrollBehavior,
  routes: [
    {
      path: '/',
      component: Home
    }
  ]
})

export const addRoutesFromApi = routes => {
  routes = walkRoutes(routes)
  router.addRoutes(routes)

  // add wildcard route that redirects to 404 view
  router.addRoutes([
    {
      path: '/404',
      name: '404',
      component: require('@/views/_404').default,
      props: true
    },
    {
      path: '*',
      redirect: '404'
    }
  ])
}

function walkRoutes(routes) {
  routes.forEach(route => {
    // route.component = DefaultView

    //if (route.template === 'basic-page') route.component = BasicPage
    route.component = BasicPage

    route.path = route.url
    route.meta = {
      id: route.id,
      title: route.title
    }
    route.props = { id: route.id }

    if (route.root) route.meta.root = route.root

    if (route.parent) route.meta.parent = route.parent

    if (route.children) {
      let subnavigation = []
      route.children.forEach(child => {
        subnavigation.push(child)
      })

      route.meta.subnavigation = subnavigation

      routes = [...routes, ...walkRoutes(route.children, subnavigation)]

      delete route.children
    }
  })

  return routes
}

export default router
