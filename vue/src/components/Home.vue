<template>
  <div class='mainImage container-fluid col-12'>
    <searchBox></searchBox>
  </div>
</template>

<script>
import SearchBox from './SearchBox'
export default {
  components: {
    SearchBox
  }
}
</script>

<style scoped>
.mainImage {
  background: url('~@/assets/img/home.jpg') no-repeat;
  height: 800px;
  background-size: cover;
  background-position: center;
}
</style>
