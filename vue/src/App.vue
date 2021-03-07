<template>
  <div id='app'>
    <Navbar></Navbar>
    <router-view/>
    <Footer></Footer>
  </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import store from './store'
import {inspectToken} from './tools'
import Footer from './components/Footer'
import Navbar from './components/Navbar'
export default {
  components: {
    Navbar,
    Footer
  },

  created () {
    if (store.state.jwt) {
      let tokenState = inspectToken(store.state.jwt)

      if (tokenState === 'active') {
        this.$store.dispatch('getUserInfo', store.state.jwt)
      }
    }
  }
}
</script>
