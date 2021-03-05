<template>
  <main class='container-fluid bg-white section pt-5'>
    <link href="https://fonts.googleapis.com/css?family=Dosis:400,700" rel="stylesheet">
    <SearchBox @no-results='noResultsFromSearch'></SearchBox>
    <ResultsBox
      @go-to-events-page='goToEventPage'
      v-for='(event, index) in grabResults'
      :key='index'
      :cardImage='event.image'
      :cardText='event.description'
      :eventId='event.event_id'
      :cardTitle='event.name'
      :date_time='event.date_time'
      :allows_own_drinks='event.allows_own_drinks'
      :capacity='event.capacity'
      :event='event'
    ></ResultsBox>
    <div class="overlay" v-show='showModal'>
      <transition name='fade'>
        <LoginSignupModal id='modal' class='myModal' v-show='showModal' @close-modal='closeModal'></LoginSignupModal>
      </transition>
    </div>
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
import LoginSignupModal from '../LoginSignupModal'
import store from '../../store'
export default {
  components: {
    SearchBox,
    ResultsBox,
    LoginSignupModal
  },

  data () {
    return {
      error: '',
      showModal: false
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
    closeModal () {
      this.showModal = false
      document.querySelector('body').style.overflow = ''
    },
    noResultsFromSearch () {
      this.error = 'Sorry no Libre events found'
    },
    goToEventPage (event) {
      this.$store.dispatch('selectEvent', event)
      if (!store.state.jwt) {
        this.showModal = true
        document.querySelector('body').style.overflow = 'hidden'
      } else {
        this.$router.push('EventPage')
      }
    }
  }
}
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.8s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(128,128,128,0.5);
}

.myModal {
  z-index: 1000;
  position: fixed;
  top: 30%;
  left: 50%;
  width:30em;
  height:18em;
  margin-top: -9em;
  margin-left: -15em;
}

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
