<template>
  <main class='container-fluid bg-white section pt-5'>
    <SearchBox v-on:grab-results='grabResults'></SearchBox>
    <ResultsBox></ResultsBox>
  </main>
</template>

<script>
import ResultsBox from '../ResultsBox'
import SearchBox from '../SearchBox'
import store from '../../store'
export default {
  components: {
    SearchBox,
    ResultsBox
  },

  computed: {
    // grabResults () {
    //   console.log('pie')
    //   console.log(store.state.results)
    //   return store.state.results
    // }
  },

  methods: {
    grabResults () {
      console.log('pie')
      console.log(store.state.results)
      return store.state.results
    },
    toggleDropdown () {
      this.state = !this.state
    }
  }
}
</script>

<style scoped>
.align-items-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.rowSpace {
  margin-top: 80px;
}

@media screen and (max-width: 800px) {
  .section {
    height: 1050px;
  }
}
</style>
