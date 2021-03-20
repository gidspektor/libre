import Vue from 'vue'
import Router from 'vue-router'
import store from '../store'

import Account from '@/components/pages/Account'
import CreatePost from '@/components/pages/CreatePost'
import Collaborate from '@/components/pages/Collaborate'
import EventPage from '@/components/pages/EventPage'
import FindEvents from '@/components/pages/FindEvents'
import Home from '@/components/pages/Home'
import HostEvent from '@/components/pages/HostEvent'
import Login from '@/components/pages/Login'
import Post from '@/components/pages/Post'
import SignUp from '@/components/pages/SignUp'
import Terms from '@/components/pages/Terms'

import accountAuthenticate from './middleware/accountAuth'
import eventAuthenticate from './middleware/eventAuth'
import postAuthenticate from './middleware/postAuth'

Vue.use(Router)

export default new Router({
  scrollBehavior () {
    return { x: 0, y: 0 }
  },
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
    {
      component: CreatePost,
      path: '/CreatePost',
      name: 'createPost',
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
    {
      component: Post,
      path: '/Post',
      name: 'post',
      meta: {middleware: [postAuthenticate]},
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
    {component: SignUp, path: '/SignUp', name: 'signUp'},
    {component: Terms, path: '/Terms', name: 'terms'}
  ]
})
