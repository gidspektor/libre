<template>
  <main class='container-fluid bg-white section pt-5'>
    <div class='row pt-5'>
      <div v-if='purchaseComplete || alreadyAttending' class='col-12 col-md-6 mt-5 pl-4 pl-lg-5'>
        <div class='col-lg-12'>
          <h5 v-if='alreadyAttending' class='libreFont'>You're already going to {{this.event.name}}!</h5>
          <h5 v-else class='libreFont'>You're going to {{this.event.name}}!</h5>
          <p class='libreFont d-inline'>You will receive your tickets via email at</p>
          <p class='d-inline libreFont font-weight-bold'>{{this.email}}</p>
        </div>
      </div>
      <div v-if='!purchaseComplete && !alreadyAttending' class='col-12 col-md-6 mt-5 pl-4 pl-lg-5'>
        <div class='row d-flex justify-content-start pl-lg-5'>
          <input readonly v-model='name' class='form-control col-7' placeholder='Full name' type='text'>
        </div>
        <div class='row d-flex justify-content-start my-2 pl-lg-5'>
          <input readonly v-model='email' class='form-control col-7' placeholder='Email address' type='email'>
          <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
            {{ emailError }}
          </div>
        </div>
        <div class='row d-flex justify-content-start pl-lg-5'>
          <div class='panel panel-default'>
            <div class='panel-body'>
              <div class='form-group'>
                <label>CARD NUMBER</label>
                <div class='input-group'>
                  <input v-model='cardNumber' maxlength='16' type='text' class='form-control' v-on:input='checkIsNumber($event)' id='cardNumber' placeholder='Valid Card Number' required autofocus />
                  <span class='input-group-addon'>
                    <span class='glyphicon glyphicon-lock'></span>
                  </span>
                </div>
              </div>
              <div class='row'>
                <div class='col-7'>
                  <div class='form-group'>
                    <label for='expityMonth'>EXPIRY DATE</label>
                    <div class='col-4 col-md-4 pl-ziro'>
                      <input v-model='month' v-on:input='checkIsNumber($event)' type='text' maxlength='2' class='form-control' id='expityMonth' placeholder='MM' required />
                    </div>
                    <div class='col-4 col-md-4 pl-ziro'>
                      <input v-model='year' v-on:input='checkIsNumber($event)' type='text' maxlength='2' class='form-control' id='expityYear' placeholder='YY' required /></div>
                    </div>
                  </div>
                  <div class='col-4 pull-right'>
                    <div class='form-group'>
                      <label for='cvCode'>CV CODE</label>
                      <input v-model='csv' v-on:input='checkIsNumber($event)' type='text' maxlength='3' class='form-control' id='cvCode' placeholder='CV code' required />
                    </div>
                  </div>
                </div>
              </div>
              <div class='my-2'>
                <label>Number of tickets</label>
                <select v-model='quantity'>
                  <option value='1'>1</option>
                  <option v-if='!lastTicket && !boughtOne' value='2'>2</option>
                </select>
              </div>
          </div>
          <br/>
          <button v-if="!loading" @click='submitPurchase' class='btn logoColour btn-lg btn-block col-7 mt-lg-1' role='button'>Pay</button>
          <button v-else class='btn logoColour libreFont col-lg-6 col-10'>Submitting...</button>
          <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
            {{ error }}
          </div>
        </div>
      </div>
      <div class='order-first order-md-last col-12 col-md-6 mt-5 pl-lg-0 pl-4 pr-lg-5'>
        <img v-if='event.image' class='cardImage card-img-top' :src='require(`../../assets/images/${this.event.image}.jpg`)' alt='Card image cap'>
        <h5 class='mt-3 libreFont font-weight-bold'>{{this.event.name}}</h5>
        <p class='font-weight-light font-italic text'>{{this.event.description}}</p>
        <div class=''>
          <p class='d-lg-inline font-weight-bold libreFont'>When:
            <span class='libreFont font-weight-light'>{{this.formatDate(this.event.date_time)}}</span>
          </p>
          <p class='d-lg-inline ml-lg-5 font-weight-bold libreFont'>Bring your own booze:
            <span class='libreFont font-weight-light'>{{formatAllowDrinks}}</span>
          </p>
          <p class='d-lg-inline ml-lg-5 font-weight-bold libreFont'>Capacity:
            <span class='libreFont font-weight-light'>{{this.event.capacity}}</span>
          </p>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import {post} from '../../http-common'
import store from '../../store'
import {validateEmail, formatDate} from '../../tools'
export default {
  data () {
    return {
      formatDate: formatDate,
      cardText: '',
      cardTitle: '',
      capacity: '',
      date_time: '',
      allows_own_drinks: '',
      email: '',
      name: '',
      cardNumber: '',
      validateEmail: validateEmail,
      emailError: '',
      month: '',
      year: '',
      quantity: '1',
      csv: '',
      event: [],
      lastTicket: false,
      purchaseComplete: false,
      alreadyAttending: false,
      boughtOne: false,
      loading: false,
      error: ''
    }
  },

  created () {
    this.event = JSON.parse(store.state.selectedEvent)

    if (this.event.atl === 1) {
      this.lastTicket = true
    }

    this.email = store.state.user.email
    this.name = store.state.user.first_name + ' ' + store.state.user.last_name
    this.checkIfAlreadyAttending(store.state.user)
  },

  computed: {
    formatAllowDrinks () {
      return this.event.allows_own_drinks ? 'Yes' : 'No'
    }
  },

  methods: {
    checkIfAlreadyAttending (user) {
      if (user.future_events.length) {
        let quantityPurchased = user.future_events.filter(event =>
          event.name === this.event.name
        )

        if (quantityPurchased[0].quantity === 2) {
          this.alreadyAttending = true
        }

        if (quantityPurchased[0].quantity === 1) {
          this.boughtOne = true
        }
      }
    },
    checkIsNumber (event) {
      if (event.target.value && !/^\d+$/.test(event.target.value)) {
        document.getElementById(event.target.id).style.backgroundColor = 'IndianRed'
      } else {
        document.getElementById(event.target.id).style.backgroundColor = ''
      }
    },
    validateForm () {
      let formValid = true
      this.emailError = ''
      let emailIsValid = this.validateEmail(this.email)

      if (!emailIsValid) {
        this.emailError = 'Please insert a valid email'
        formValid = false
      }

      let isNotDigitsOnly = !/^\d+$/.test(this.cardNumber) ||
        !/^\d+$/.test(this.month) ||
        !/^\d+$/.test(this.year) ||
        !/^\d+$/.test(this.csv)

      if (isNotDigitsOnly) {
        formValid = false
      }

      let cardNumberLengths = this.cardNumber.length !== 16 ||
        this.month.length !== 2 ||
        this.year.length !== 2 ||
        this.csv.length !== 3

      if (cardNumberLengths) {
        formValid = false
      }

      return formValid
    },
    async submitPurchase () {
      this.error = ''
      this.loading = true
      let formIsValid = this.validateForm()

      if (formIsValid) {
        let response = await post('purchase-ticket/', {
          user_info: store.state.user,
          event_id: this.event.event_id,
          card_number: this.cardNumber,
          csv: this.csv,
          expiry_month: this.month,
          expiry_year: this.year,
          quantity: this.quantity
        }).catch((error) => {
          error = 'Bad request'
          this.error = error
          this.loading = false
        })

        if (response.data.success) {
          this.purchaseComplete = true
          this.$store.dispatch('getUserInfo', localStorage.getItem('t'))
        }
      }

      this.loading = false
    }
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

.panel-title {
  display: inline;
  font-weight: bold;

}
.checkbox.pull-right {
  margin: 0;
}

.pl-ziro {
  padding-left: 0px;
}

.logoColour {
  background-color: rgb(13, 201, 44);
}

.libreFont {
  font-family: 'Lucida Sans';
}

@media screen and (max-width: 800px) {
  .section {
    height: 1050px;
  }
  .cardImage {
    height: 30vw;
  }
}
</style>
