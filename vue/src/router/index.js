import Vue from 'vue'
import Router from 'vue-router'
import CreateEvents from '@/components/pages/CreateEvents'
import Home from '@/components/pages/Home'
import FindEvents from '@/components/pages/FindEvents'
import Terms from '@/components/pages/Terms'

Vue.use(Router)

export default new Router({
  routes: [
    {component: Home, path: '/', name: 'home'},
    {component: FindEvents, path: '/FindEvents', name: 'findEvents'},
    {component: CreateEvents, path: '/CreateEvents', name: 'createEvents'},
    {component: Terms, path: '/Terms', name: 'terms'}
  ]
})
