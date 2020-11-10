<template>
  <main class='section bg-white container-fluid pt-5'>
    <SearchBox></SearchBox>
    <CollaborateResult></CollaborateResult>
  </main>
</template>

<script>
import { mapState } from 'vuex'
import CollaborateResult from '../CollaborateResult'
import SearchBox from '../SearchBox'
export default {
  components: {
    SearchBox,
    CollaborateResult
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
    height: 700px;
  }
}
</style>
