import Vue from 'vue'
import Router from 'vue-router'
import store from '../store'

import Collaborate from '@/components/pages/Collaborate'
import CreateEvents from '@/components/pages/CreateEvents'
import EventPage from '@/components/pages/EventPage'
import FindEvents from '@/components/pages/FindEvents'
import Home from '@/components/pages/Home'
import Terms from '@/components/pages/Terms'

import authenticate from '../router/middleware/auth'

Vue.use(Router)

export default new Router({
  routes: [
    {component: Home, path: '/', name: 'home'},
    {component: Collaborate, path: '/Collaborate', name: 'collaborate'},
    {component: CreateEvents, path: '/CreateEvents', name: 'createEvents'},
    {
      component: EventPage,
      path: '/EventPage',
      name: 'eventPage',
      meta: {middleware: [authenticate]},
      beforeEnter: (to, from, next) => {
        const context = {
          to,
          from,
          next,
          store
        }
        return to.meta.middleware[0]({
          ...context
        })
      }
    },
    {component: FindEvents, path: '/FindEvents', name: 'findEvents'},
    {component: Terms, path: '/Terms', name: 'terms'}
  ]
})
