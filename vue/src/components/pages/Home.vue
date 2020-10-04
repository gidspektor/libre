<template>
  <main>
    <section class='mainImage section container-fluid pt-5'>
      <SearchBox></SearchBox>
      <div class='row d-block rowSpace ml-4 mt-4 pt-lg-5 mt-lg-5'>
        <div class='col-12'>
          <h1 class='text-white mb-1'>Events near you</h1>
          <h6 class='font-weight-light font-italic text-white mb-3'>Find events happening near you.</h6>
          <a href='/'>
            <button type='button' class='font-weight-light font-italic btn btn-light'>Nearby events</button>
          </a>
        </div>
      </div>
    </section>
    <section class='midSection container-fluid my-4'>
      <div class='row d-flex justify-content-center'>
        <Card class='card col-lg-3 col-11 mr-lg-4 my-2'
          :cardImage='mainLeftCard.image'
          :cardText='mainLeftCard.text'
          :cardTitle='mainLeftCard.title'
          :cardLink='mainLeftCard.link'>
        </Card>
        <Card class='card col-lg-3 col-11 mx-lg-5 my-2'
          :cardImage='mainMiddleCard.image'
          :cardText='mainMiddleCard.text'
          :cardTitle='mainMiddleCard.title'
          :cardLink='mainMiddleCard.link'>
        </Card>
        <Card class='card col-lg-3 col-11 ml-lg-4 my-2'
          :cardImage='mainRightCard.image'
          :cardText='mainRightCard.text'
          :cardTitle='mainRightCard.title'
          :cardLink='mainRightCard.link'>
        </Card>
      </div>
    </section>
    <section class='midSection container-fluid bg-light py-5'>
      <div class='row py-4'>
        <div class='col-lg-12 text-center pl-lg-0'>
          <h1>Stay connected with events near you</h1>
        </div>
      </div>
      <div class='row d-flex justify-content-center pb-4'>
        <h5 class='col-lg-6 col-12 font-weight-light font-italic text-center'>
          We believe in events created by the people;
          by subscribing you can get notified when people are creating events in your area.
        </h5>
      </div>
      <div class='row d-flex justify-content-center py-4'>
        <div class='col-lg-2 col-12 input-group mb-3'>
          <input v-model='email' type='email' class='form-control' placeholder='Email Address'>
        </div>
        <div class='col-lg-2 col-12 input-group'>
          <select v-model='location' class='form-control browser-default custom-select'>
            <option selected>Choose location</option>
            <option value='Barcelona'>Barcelona</option>
            <option value='Berlin'>Berlin</option>
          </select>
        </div>
        <button type='button' class='form-control col-lg-2 col-6 mt-3 mt-lg-0 py-0 btn btn-light btn-outline-dark'>Subscribe</button>
      </div>
    </section>
  </main>
</template>

<script>
import SearchBox from '../SearchBox'
import Card from '../Card'
export default {
  components: {
    SearchBox,
    Card
  },

  data () {
    return {
      mainLeftCard: {
        image: 'warehouse.jpg',
        title: 'Create Events',
        text: 'Create your own crowdfunded events, you choose the location and you choose the music.',
        link: '/'
      },
      mainMiddleCard: {
        image: 'crowd.jpg',
        title: 'Find events',
        text: 'Find events happening near you now, created by music lovers.',
        link: 'findEvents'
      },
      mainRightCard: {
        image: 'artists.jpg',
        title: 'Collaborate',
        text: 'Connect with other artists who want to set up events, or just make music.',
        link: '/'
      },
      state: false,
      location: '',
      email: ''
    }
  },
  created () {
    window.addEventListener('click', (e) => {
      if (e.target.id !== 'dropdownCountryButton') {
        this.state = false
      }
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
