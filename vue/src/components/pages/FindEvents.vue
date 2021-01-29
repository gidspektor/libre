<template>
  <main class='container-fluid bg-white section pt-5'>
    <SearchBox></SearchBox>
    <ResultsBox
      v-for='(result, index) in grabResults'
      :key='index'
      :cardImage='result.image'
      :cardText='result.description'
      :eventId='result.event_id'
      :cardTitle='result.name'
      :date_time='result.date_time'
      :allows_own_drinks='result.allows_own_drinks'
    ></ResultsBox>
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
    grabResults () {
      console.log(store.state.eventSearchResults)
      return store.state.eventSearchResults
    }
  },

  methods: {
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
