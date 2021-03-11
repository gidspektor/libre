import Vue from 'vue'
import Router from 'vue-router'
import store from '../store'

import Collaborate from '@/components/pages/Collaborate'
import Account from '@/components/pages/Account'
import EventPage from '@/components/pages/EventPage'
import FindEvents from '@/components/pages/FindEvents'
import Home from '@/components/pages/Home'
import HostEvent from '@/components/pages/HostEvent'
import Login from '@/components/pages/Login'
import SignUp from '@/components/pages/SignUp'
import Terms from '@/components/pages/Terms'

import accountAuthenticate from './middleware/accountAuth'
import eventAuthenticate from './middleware/eventAuth'

Vue.use(Router)

export default new Router({
  routes: [
    {
      component: Account,
      path: '/Account',
      name: 'account',
      meta: {middleware: [accountAuthenticate]},
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
    {component: Home, path: '/', name: 'home'},
    {component: Collaborate, path: '/Collaborate', name: 'collaborate'},
    {
      component: EventPage,
      path: '/EventPage',
      name: 'eventPage',
      meta: {middleware: [eventAuthenticate]},
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
    {component: HostEvent, path: '/HostEvents', name: 'hostEvents'},
    {component: Login, path: '/Login', name: 'login'},
    {component: SignUp, path: '/SignUp', name: 'signUp'},
    {component: Terms, path: '/Terms', name: 'terms'}
  ]
})
