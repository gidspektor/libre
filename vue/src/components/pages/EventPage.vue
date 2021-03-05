<template>
  <main class='container-fluid bg-white section pt-5'>
    <div class='row'>
      <div class='col-6 mt-5'>
        <div class='row d-flex justify-content-center'>
          <input v-model='name' class='form-control col-11' placeholder='Full name' type='text'>
        </div>
        <div class='row d-flex justify-content-center my-2'>
          <input v-model='email' class='form-control col-11' placeholder='Email address' type='email'>
        </div>
        <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
          {{ emailError }}
        </div>
        <div class='py-lg-2 row d-flex justify-content-center'>
          <div class='col-11 line text-center'></div>
        </div>
        <div class='row d-flex justify-content-center'>
          <button @click='createAccount' class='btn logoColour libreFont col-11'> Create Account</button>
        </div>
      </div>
      <div class='col-6 mt-5'>
        <img v-if='cardImage' class='cardImage card-img-top' :src='require(`../../assets/images/${this.cardImage}.jpg`)' alt='Card image cap'>
      </div>
    </div>
  </main>
</template>

<script>
import store from '../../store'
export default {
  data () {
    return {
      cardImage: '',
      cardText: '',
      cardTitle: '',
      capacity: '',
      date_time: '',
      allows_own_drinks: '',
      email: '',
      name: ''
    }
  },

  created () {
    this.cardImage = store.state.selectedEvent.image
    this.email = store.state.user.email
    this.name = store.state.user.first_name + ' ' + store.state.user.last_name
  }
}
</script>

<style scoped>
.section {
  height: 700px;
}

.cardImage {
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  height: 18vw;
}
</style>
