<template>
  <main class='container-fluid'>
    <SearchBox></SearchBox>
    <!-- <ResultsBox></ResultsBox> -->
  </main>
</template>

<script>
import { mapState } from 'vuex'
// import ResultsBox from '../ResultsBox'
import SearchBox from '../SearchBox'
export default {
  components: {
    SearchBox
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
.section {
  height: 700px;
}

.midSection {
  height: 400px;
}

.mainImage {
  background: url('~@/assets/img/waves.jpg') no-repeat;
  background-size: cover;
  background-position: center;
}

.align-items-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.rowSpace {
  margin-top: 80px;
}

@media screen and (max-width: 800px) {
  .midSection {
    height: 700px;
  }
}
</style>
