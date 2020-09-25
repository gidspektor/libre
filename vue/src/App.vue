<template>
  <div id='app'>
    <navbar></navbar>
    <router-view/>
  </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import Navbar from './components/Navbar'
export default {
  components: {
    Navbar
  }
}
</script>
