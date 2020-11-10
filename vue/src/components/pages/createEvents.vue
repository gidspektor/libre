<template>
  <main class='section container-fluid bg-white pt-5'>
    <SearchBox></SearchBox>
    <ResultsBox></ResultsBox>
  </main>
</template>

<script>
import { mapState } from 'vuex'
import ResultsBox from '../ResultsBox'
import SearchBox from '../SearchBox'
export default {
  components: {
    SearchBox,
    ResultsBox
  },

  computed: {
    ...mapState({
      results: state => state.searchResults
    })
  },

  methods: {
    toggleDropdown () {
      this.state = !this.state
    }
  }
}
</script>

<style scoped>
@media screen and (max-width: 800px) {
  .section {
    height: 1050px;
  }
}
</style>
