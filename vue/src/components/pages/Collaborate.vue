<template>
  <main class='section bg-white container-fluid pt-5'>
    <SearchBox @no-results='noResultsFromSearch'></SearchBox>
    <hr>
    <CollaborateResultBox
      @go-to-post-page='goToPostPage'
      v-for='(userPost, index) in grabPosts'
      :key='index'
      :title='userPost.title'
      :description='userPost.description'
      :location='userPost.location'
      :userPost='userPost'
    ></CollaborateResultBox>
    <div class='emptyResults' v-if='containsResults'>
      <span class='row d-flex justify-content-center'>
        <h3 v-if='error' class='col-6 d-flex justify-content-center mt-5 searchText'>{{error}}</h3>
        <h3 v-else class='col-4 d-flex justify-content-center mt-5 searchText'>Find other artists here</h3>
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
    grabPosts () {
      return store.state.UserPostResults
    },
    containsResults () {
      let show = true

      if (store.state.UserPostResults && store.state.UserPostResults.length >= 1) {
        show = false
      }

      return show
    }
  },

  methods: {
    goToPostPage (event) {
      this.$store.dispatch('selectPost', event)
      this.$router.push('Post')
    },
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

@media screen and (max-width: 800px) {
  .section {
    height: 700px;
  }
}
</style>
