import Vue from 'vue'
import Router from 'vue-router'
import Collaborate from '@/components/pages/Collaborate'
import CreateEvents from '@/components/pages/CreateEvents'
import FindEvents from '@/components/pages/FindEvents'
import Home from '@/components/pages/Home'
import Terms from '@/components/pages/Terms'

Vue.use(Router)

export default new Router({
  routes: [
    {component: Home, path: '/', name: 'home'},
    {component: Collaborate, path: '/Collaborate', name: 'collaborate'},
    {component: CreateEvents, path: '/CreateEvents', name: 'createEvents'},
    {component: FindEvents, path: '/FindEvents', name: 'findEvents'},
    {component: Terms, path: '/Terms', name: 'terms'}
  ]
})
