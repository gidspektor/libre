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
import Navbar from './components/Navbar'
import Footer from './components/Footer'
export default {
  components: {
    Navbar,
    Footer
  }
}
</script>
