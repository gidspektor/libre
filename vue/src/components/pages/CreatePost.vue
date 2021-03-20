<template>
  <main class='container-fluid section pt-5 mt-5'>
    <div v-if='requestSent'>
      <div class='row mt-5 pt-5 d-flex justify-content-center'>
        <h5 class='col-12 text-center libreFont'>Your post is live!</h5>
        <a href='#/Collaborate' class='col-12 text-center libreFont'>Return to posts?</a>
      </div>
    </div>
    <div v-else>
      <div class='px-3 modalHead text-center'>
        <h5 class='modal-title d-inline logoTextColour libreFont font-weight-bold'>Tell the community what you are looking for</h5>
      </div>
      <div class='mt-4'>
        <div class='row d-flex justify-content-center'>
          <input v-model='title' class='form-control mt-4 col-lg-6 col-10' placeholder='Title' type='text'>
        </div>
        <div class='row d-flex justify-content-center'>
          <textarea v-model='description' class='form-control inputfield mt-4 col-lg-6 col-10'></textarea>
        </div>
        <div class='row d-flex justify-content-center'>
          <div class='searchItem border-dark col-lg-5'>
            <div class='pt-2 text text-headers font-weight-bold'>Location</div>
            <input v-model='keywordLocationSearch' @input='searchLocations' type='text' class='p-0 text libreFont searchText font-weight-light font-italic' placeholder='Choose a city'>
            <div class='px-0 drop col-12'>
              <span class='pl-3 locationItem py-1 d-block searchText font-weight-bold font-italic'
                v-for='(returnedLocation, index) in returnedLocations'
                :key='index'
                @click='selectLocation(returnedLocation)'>
                  {{returnedLocation.city}}, {{returnedLocation.country}}
              </span>
            </div>
            <span class='alert-danger error col-12 mb-5' role='alert' v-show='error'>
              {{ error }}
            </span>
          </div>
        </div>
        <div class='row d-flex justify-content-center mt-4'>
          <button @click='submitRequest' class='btn logoColour libreFont col-lg-6 col-10'>Submit request</button>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
import {post, get} from '../../http-common'
import {sanitizeSearchString} from '../../tools'

export default {
  data () {
    return {
      email: '',
      description: '',
      requestSent: false,
      title: '',
      error: '',
      keywordLocationSearch: '',
      returnedLocations: [],
      sanitizeSearchString: sanitizeSearchString
    }
  },

  methods: {
    selectLocation (selectedLocation) {
      this.keywordLocationSearch = selectedLocation.city + ', ' + selectedLocation.country
      this.returnedLocations = []
    },
    validateForm () {
      this.error = ''
      let formValid = true

      if (!this.description || this.description.length < 50) {
        formValid = false
        this.error = 'Please insert a description of at least 50 characters'
      }

      if (!this.title) {
        formValid = false
        this.error = 'Please give it a title'
      }

      if (!this.keywordLocationSearch) {
        formValid = false
        this.error = 'Please select a location'
      }

      return formValid
    },
    async submitRequest () {
      let formIsValid = this.validateForm()
      let cleanedDescription = this.description.replace(/[^a-z'A-Z ]/, '').replace(/[/(){}:*]/g, '')
      let cleanedTitle = this.title.replace(/[^a-z'A-Z ]/, '').replace(/[/(){};:*]/g, '')
      let cleanedLocation = this.sanitizeSearchString(this.keywordLocationSearch)

      if (formIsValid) {
        let response = await post('create-post/', {
          description: cleanedDescription,
          location: cleanedLocation,
          title: cleanedTitle
        })

        if (response.data.error) {
          this.error = response.data.error
        }

        if (response.data.success) {
          this.requestSent = true
        }
      }
    },
    async searchLocations () {
      this.returnedLocations = ''
      if (this.keywordLocationSearch) {
        let cleanedString = this.sanitizeSearchString(this.keywordLocationSearch)
        let response = await get(`locations/${cleanedString}/`)

        this.returnedLocations = response.data.results
      }
    }
  }
}
</script>
<style scoped>
.section {
  height: 700px;
}

.libreFont {
  font-family: 'Lucida Sans';
}

.modalHead {
  border-bottom: solid rgba(20, 20, 20, 0.1);
  border-width: 2px;
}

.logoTextColour {
  color: rgb(13, 201, 44);
}

.logoColour {
  background-color: rgb(13, 201, 44);
}

.error {
  font-size: 13px;
  border-radius: 10px;
}

.inputfield {
  height: 200px;
  resize: none;
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

.searchItem {
  display: inline-block;
  height: 100%;
  border-radius: 60px;
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

.error {
  font-size: 10px;
  border-radius: 10px;
  z-index: 1000;
  position: absolute;
  top: 65px;
  left: -10px;
}

.locationItem:hover {
  border-radius: 10px;
  background-color: rgba(240, 234, 234, 0.5);
}

.searchText:focus {
  outline: none;
}
</style>
