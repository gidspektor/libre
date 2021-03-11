<template>
  <div v-if='loaded' id='app'>
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

  data () {
    return {
      loaded: false
    }
  },

  async created () {
    let securePages = ['eventPage', 'account']
    let tokenState = store.state.jwt ? inspectToken(store.state.jwt) : ''

    if (tokenState === 'active') {
      await this.$store.dispatch('getUserInfo', store.state.jwt)
    }

    if (tokenState === 'refresh') {
      await this.$store.dispatch('refreshToken')
      this.$store.dispatch('getUserInfo', store.state.jwt)
    }

    if (tokenState === 'expired' && securePages.includes(this.$route.name)) {
      this.$router.push('Login')
    }

    this.loaded = true
  }
}
</script>
