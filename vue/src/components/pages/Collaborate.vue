<template>
  <main class='section bg-white container-fluid pt-5'>
    <SearchBox @no-results='noResultsFromSearch'></SearchBox>
    <hr>
    <div v-if='!isLoading'>
      <CollaborateResultBox
        v-for='(userPost, index) in grabPosts'
        :key='index'
        :title='userPost.title'
        :description='userPost.description'
        :location='userPost.location'
        :userName='userPost.user_name'
        :date='userPost.date_time'
        :userPost='userPost'
      ></CollaborateResultBox>
    </div>
    <div class='emptyResults' v-if='doesntContainResults && !isLoading'>
      <span class='row d-flex justify-content-center'>
        <h3 v-if='error' class='col-6 d-flex justify-content-center mt-5 searchText'>{{error}}</h3>
        <h3 v-else class='col-4 d-flex justify-content-center mt-5 searchText'>Find other artists here</h3>
      </span>
    </div>
    <div class='emptyResults' v-if='isLoading'>
      <span class='row d-flex justify-content-center'>
        <h3 class='col-4 d-flex justify-content-center mt-5 searchText'>Loading...</h3>
      </span>
    </div>
  </main>
</template>

<script>
import CollaborateResultBox from '../CollaborateResultBox'
import SearchBox from '../SearchBox'
import store from '../../store'

export default {
  components: {
    SearchBox,
    CollaborateResultBox
  },

  data () {
    return {
      error: ''
    }
  },

  computed: {
    isLoading () {
      return store.state.loading
    },
    grabPosts () {
      return store.state.postSearchResults
    },
    doesntContainResults () {
      let show = true

      if (store.state.postSearchResults && store.state.postSearchResults.length >= 1) {
        show = false
      }

      return show
    }
  },

  methods: {
    noResultsFromSearch () {
      this.error = 'Sorry no posts found'
    }
  }
}
</script>

<style scoped>
.emptyResults {
  height: 500px;
  font-family: 'Lucida Sans';
}

.align-items-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.rowSpace {
  margin-top: 80px;
}

.section {
  height: auto;
}
</style>
