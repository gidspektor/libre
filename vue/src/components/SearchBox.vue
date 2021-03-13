<template>
  <main class='pt-4'>
    <div class='row largeSearch mb-4 d-flex justify-content-center'>
      <div class='col-9'>
        <div class='search px-5 d-flex justify-content-center border border-dark' v-bind:class='columnSize'>
          <div class='searchItem border-right border-dark mr-5 col-lg-7' v-bind:class='locationClass'>
            <div class='pt-2 text text-headers font-weight-bold'>Location</div>
            <input v-if="this.$route.name !== 'collaborate'" v-model='keywordLocationSearch' @input='searchLocations' type='text' class='p-0 text libreFont searchText font-weight-light font-italic' placeholder='Choose a city or country'>
            <input v-else v-model='keywordLocationSearch' @input='searchLocations' type='text' class='p-0 text libreFont searchText font-weight-light font-italic' placeholder='Choose a city'>
            <div class='px-0 drop col-12'>
              <span class='pl-3 locationItem py-1 d-block searchText font-weight-bold font-italic'
                v-for='(returnedLocation, index) in returnedLocations'
                :key='index'
                @click='selectLocation(returnedLocation)'>
                  {{returnedLocation.city}}, {{returnedLocation.country}}
              </span>
            </div>
            <span class='alert alert-danger error col-12' role='alert' v-show='error'>
              {{ error }}
            </span>
          </div>
          <div v-if="this.$route.name != 'collaborate'" class='col-lg-4 searchItem'>
            <div class='pl-lg-1 pt-2 mr-3 text text-headers font-weight-bold'>Date</div>
            <input v-model='date' type='date' class='pt-0 date'>
          </div>
          <div v-if="this.$route.name === 'collaborate'" class='col-lg-4 searchItem pl-lg-1'>
            <div class='pt-2 text text-headers font-weight-bold'>Search</div>
            <input v-model='keywordPostSearch' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Search posts e.g. drummer wanted'>
          </div>
          <div v-if="this.$route.name === 'collaborate'" class='col-lg-1 ml-auto pt-lg-3 searchItem' @click='searchPosts()'>
            <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
          </div>
          <div v-else class='col-lg-1 ml-auto pt-lg-3 searchItem' @click='searchEvents()'>
            <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
          </div>
        </div>
      </div>
    </div>
    <div class='row mobileSearch'>
      <div class='border border-dark search col-11 pl-4'>
        <div class='pt-2 text text-headers font-weight-bold'>Location</div>
        <input v-model='keywordLocationSearch' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Choose a city'>
      </div>
    </div>
    <div v-if="this.$route.name !== 'collaborate'" class='row mobileSearch'>
      <div class='border border-dark search col-11 pl-4'>
        <div class='pt-2 text text-headers font-weight-bold'>Date</div>
        <input v-model='date' type='date' class='pt-0 date'>
      </div>
    </div>
    <div class='row mobileSearch'>
      <div v-if="this.$route.name === 'collaborate'" class='border border-dark search col-11 pt-3 d-flex justify-content-center' @click='searchPosts()'>
        <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
      </div>
      <div v-else class='border border-dark search col-11 pt-3 d-flex justify-content-center' @click='searchEvents()'>
        <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
      </div>
    </div>
  </main>
</template>

<script>
import http from '../http-common'
import store from '../store'
import {sanitizeSearchString} from '../tools'

export default {
  data () {
    return {
      genre: '',
      date: '',
      capacity: '',
      keywordLocationSearch: '',
      keywordPostSearch: '',
      returnedLocations: [],
      error: '',
      sanitizeSearchString: sanitizeSearchString
    }
  },

  created () {
    window.addEventListener('click', () => {
      this.returnedLocations = []
      this.error = ''
    })
  },

  watch: {
    inputSearch () {
      this.keywordLocationSearch = store.state.keywordLocationSearch
    }
  },

  computed: {
    inputSearch () {
      return store.state.keywordLocationSearch
    },
    searchRedirect () {
      return this.$route.name === 'home' ? 'findEvents' : this.$route.name
    },
    locationClass () {
      if (this.$route.name === 'collaborate') {
        return 'mr-auto'
      }
    },
    columnSize () {
      if (this.$route.name === 'collaborate') {
        return 'col-lg-6'
      }
      return 'col-lg-7'
    }
  },

  methods: {
    selectLocation (selectedLocation) {
      this.keywordLocationSearch = selectedLocation.city + ', ' + selectedLocation.country
    },
    async searchLocations () {
      this.returnedLocations = ''
      let cleanedString = this.sanitizeSearchString(this.keywordLocationSearch)
      let response = await http.get(`locations/${cleanedString}/`)

      this.returnedLocations = response.data.results
    },
    async searchEvents () {
      if (this.keywordLocationSearch) {
        this.error = ''
        let cleanedString = this.sanitizeSearchString(this.keywordLocationSearch)
        let response = await http.get(`events/${cleanedString}?date=${this.date}`)

        this.error = response.data.error
        this.$store.dispatch('eventSearchResults', response.data.results)
        this.keywordLocationSearch = response.data.location
        this.$store.dispatch('setkeywordLocationSearch', response.data.location)

        if (!response.data.results || response.data.results.length === 0) {
          this.$emit('no-results')
        }
      }
    },
    async searchPosts () {
      if (this.keywordLocationSearch) {
        this.error = ''
        let cleanedLocationString = this.sanitizeSearchString(this.keywordLocationSearch)
        let cleanedSearchTermString = this.sanitizeSearchString(this.keywordPostSearch)
        let response = await http.get(`posts/${cleanedLocationString}?search-term=${cleanedSearchTermString}`)

        this.error = response.data.error
        this.$store.dispatch('postSearchResults', response.data.results)

        if (!response.data.results || response.data.results.length === 0) {
          this.$emit('no-results')
        }
      }
    }
  }
}
</script>

<style scoped>
.libreFont {
  font-family: 'Lucida Sans';
}

.mobileSearch {
  display: none;
}

.mainImage {
  background: url('~@/assets/img/home.jpg') no-repeat;
  height: 800px;
  background-size: cover;
  background-position: center;
}

.search {
  height: 60px;
  margin: 0 auto;
  margin-top: 20px;
  font-size: 18px;
  font-weight: bold;
  border: 3px solid #ffff;
  background-color: #ffff;
  text-transform: uppercase;
  text-decoration: none;
  border-radius: 60px;
}

.text {
  letter-spacing: 0.1em;
}

.text-headers {
  font-size: 11px;
}

.searchText {
  font-size: 14px;
  width: 100%;
}

.error {
  font-size: 10px;
  border-radius: 10px;
  z-index: 1000;
  position: absolute;
  top: 65px;
  left: -10px;
}

.capacity {
  font-size: 13px;
  width: 50%;
}

.capacity:focus {
  outline: none;
}

.searchItem {
  display: inline-block;
  height: 100%;
  border-radius: 60px;
}

.date {
  font-size: 12px;
  width: 120px;
}

.date:focus {
  outline: none;
}

input {
  width: 100%;
  font-size: 12px;
  background-color: transparent;
  box-sizing: border-box;
  border: none;
}

.searchText:focus {
  outline: none;
}

.icon {
  height: 25px;
  width: 25px;
  cursor: pointer;
}

.drop {
  border-radius: 10px;
  z-index: 1000;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  background-color: #ffff;
  position: absolute;
  top: 65px;
  left: -10px;
  cursor: pointer;
}

.locationItem:hover {
  border-radius: 10px;
  background-color: rgba(240, 234, 234, 0.5);
}

@media screen and (max-width: 1400px) {
    .icon {
    height: 20px;
    width: 20px;
    cursor: pointer;
  }
}

@media screen and (max-width: 800px) {
  .mobileSearch {
    display: block;
  }

  .largeSearch {
    display: none !important;
  }
}
</style>
