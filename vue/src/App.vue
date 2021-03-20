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
    let tokenState = inspectToken()

    if (tokenState === 'active') {
      await this.$store.dispatch('getUserInfo', localStorage.getItem('t'))
    }

    if (tokenState === 'refresh') {
      await this.$store.dispatch('refreshToken')
      this.$store.dispatch('getUserInfo', localStorage.getItem('t'))
    }

    if (tokenState === 'expired' && securePages.includes(this.$route.name)) {
      this.$router.push('Login')
    }

    this.loaded = true
  }
}
</script>
