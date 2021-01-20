<template>
  <main>
    <div class='row largeSearch d-flex justify-content-center'>
      <div class='col-9'>
        <div class='search px-5 d-flex justify-content-center border border-dark' v-bind:class="columnSize">
          <div class='searchItem border-right border-dark mr-5 col-lg-6' v-bind:class="locationClass">
            <div class='pt-2 text text-headers font-weight-bold'>Location</div>
            <input v-model='keywordSearch' @input='searchLocations' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Choose a city'>
          </div>
          <!-- <div v-if="this.$route.name === 'createEvents'" class='col-lg-3 searchItem pr-0 mr-5'>
            <div class='pl-lg-4 pt-2 text text-headers font-weight-bold'>Capacity</div>
            <select v-model='capacity' class='ml-lg-4 pl-lg-2 rounded-pill capacity'>
              <option disabled value=''>Choose</option>
              <option value='10-50'>10-50</option>
              <option value='50-150'>50-150</option>
              <option value='150-250'>150-250</option>
              <option value='250-350'>250-350</option>
            </select>
          </div> -->
          <!-- <div v-else-if="this.$route.name != 'collaborate'" class='col-lg-3 searchItem pr-0 mr-5 '>
            <div class='pl-lg-3 pt-2 text text-headers font-weight-bold'>Genre</div>
            <input v-model='genre' type='text' class='pl-lg-3 pt-0 text searchText font-weight-light font-italic' placeholder='Choose a genre'>
          </div> -->
          <div v-if="this.$route.name != 'collaborate'" class='col-lg-4 searchItem'>
            <div class='pl-lg-1 pt-2 mr-3 text text-headers font-weight-bold'>Date</div>
            <input v-model='date' type='date' class='pt-0 date'>
          </div>
          <div v-if="this.$route.name === 'collaborate'" class='col-lg-4 searchItem pl-lg-1'>
            <div class='pt-2 text text-headers font-weight-bold'>Search</div>
            <input v-model='keywordSearch' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Search posts e.g. drummer wanted'>
          </div>
          <div class='col-lg-1 ml-auto pt-lg-3 searchItem' @click='search()'>
            <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
          </div>
        </div>
      </div>
    </div>
    <div class='row mobileSearch'>
      <div class='border border-dark search col-11 pl-4'>
        <div class='pt-2 text text-headers font-weight-bold'>Location</div>
        <input v-model='location' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Choose a city'>
      </div>
    </div>
    <!-- <div v-if="this.$route.name != 'collaborate'" class='row mobileSearch border border-dark'>
      <div class='search col-sm-12'>
        <div class='pl-lg-3 pt-2 text text-headers font-weight-bold'>Genre</div>
        <input v-model='genre' type='text' class='pl-lg-3 pt-0 text searchText font-weight-light font-italic' placeholder='Choose a genre'>
      </div>
    </div> -->
    <div v-if="this.$route.name != 'collaborate'" class='row mobileSearch'>
      <div class='border border-dark search col-11 pl-4'>
        <div class='pt-2 text text-headers font-weight-bold'>Date</div>
        <input v-model='date' type='date' class='pt-0 date'>
      </div>
    </div>
    <!-- <div v-if="this.$route.name === 'collaborate'" class='row mobileSearch'>
      <div class='search col-11 pl-4'>
        <div class='pt-2 text text-headers font-weight-bold'>Search</div>
        <input v-model='location' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Search posts e.g. drummer wanted'>
      </div>
    </div> -->
    <div class='row mobileSearch'>
      <div class='border border-dark search col-11 pt-3 d-flex justify-content-center' @click='search()'>
        <router-link :to='searchRedirect'><img class='icon' src='~@/assets/img/search.svg'></router-link>
      </div>
    </div>
  </main>
</template>

<script>
import http from '../http-common'
export default {
  data () {
    return {
      location: '',
      genre: '',
      date: '',
      capacity: '',
      keywordSearch: ''
    }
  },

  computed: {
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
    searchLocations () {
      http.get(`locations/${this.keywordSearch}/`).then(response => {
        console.log(response.data)
      })
    },
    search () {
      http.get(`events/${this.location}/`).then(response => {
        console.log(response.data)
      })
      // this.$store.commit('searchResults', response)
    }
  }
}
</script>

<style scoped>
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
  font-size: 12px;
  width: 100%;
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
  transition: 0.4s ease-in-out;
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
