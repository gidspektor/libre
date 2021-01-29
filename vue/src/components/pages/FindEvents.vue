<template>
  <main class='container-fluid bg-white section pt-5'>
    <SearchBox @no-results='noResultsFromSearch'></SearchBox>
    <ResultsBox
      v-for='(result, index) in grabResults'
      :key='index'
      :resultsIndex='index'
      :cardImage='result.image'
      :cardText='result.description'
      :eventId='result.event_id'
      :cardTitle='result.name'
      :date_time='result.date_time'
      :allows_own_drinks='result.allows_own_drinks'
    ></ResultsBox>
    <div class='emptyResults' v-if='containsResults'>
      <span class='row d-flex justify-content-center'>
        <h3 v-if='error' class='col-6 d-flex justify-content-center mt-5 searchText'>{{error}}</h3>
        <h3 v-else class='col-4 d-flex justify-content-center mt-5 searchText'>Search for Libre events here</h3>
      </span>
    </div>
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
  data () {
    return {
      error: ''
    }
  },
  computed: {
    grabResults () {
      return store.state.eventSearchResults
    },
    containsResults () {
      let show = true

      if (store.state.eventSearchResults && store.state.eventSearchResults.length >= 1) {
        show = false
      }

      return show
    }
  },
  methods: {
    noResultsFromSearch () {
      this.error = 'Sorry no Libre events found'
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

.emptyResults {
  height: 500px;
  font-family: 'Lucida Sans';
}

@media screen and (max-width: 800px) {
  .section {
    height: 1050px;
  }
}
</style>
