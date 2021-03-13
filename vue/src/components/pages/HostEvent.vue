<template>
  <main class='container-fluid section pt-5 mt-5'>
    <div v-if='requestSent'>
      <div class='row mt-5 pt-5 d-flex justify-content-center'>
        <h5 class='col-12 text-center libreFont'>Thanks for your request! We'll get back to you soon.</h5>
      </div>
    </div>
    <div v-else>
      <div class='px-3 modalHead text-center'>
        <h5 class='modal-title d-inline logoTextColour libreFont font-weight-bold'>Tell us why you want to host an event!</h5>
      </div>
      <div class='mt-4'>
        <div class='row d-flex justify-content-center'>
          <input v-model='name' class='form-control mt-4 col-lg-6 col-10' placeholder='Full name' type='text'>
        </div>
        <div class='row d-flex justify-content-center my-3'>
          <input v-model='email' class='form-control col-lg-6 col-10' placeholder='Email address' type='email'>
        </div>
        <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
          {{ emailError }}
        </div>
        <div class='row d-flex justify-content-center'>
          <textarea v-model='comment' class='form-control inputfield mt-4 col-lg-6 col-10' placeholder='Tell us why you want to host an event, give us as much information about your location as you can please.'></textarea>
        </div>
        <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
          {{ error }}
        </div>
        <div class='row d-flex justify-content-center mt-4'>
          <button @click='submitRequest' class='btn logoColour libreFont col-lg-6 col-10'>Submit request</button>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
import http from '../../http-common'
import {validateEmail} from '../../tools'

export default {
  data () {
    return {
      email: '',
      comment: '',
      validateEmail: validateEmail,
      error: '',
      emailError: '',
      requestSent: false,
      name: ''
    }
  },

  methods: {
    validateForm () {
      this.emailError = ''
      let formValid = true
      let emailIsValid = this.validateEmail(this.email)

      if (!emailIsValid) {
        formValid = false
        this.emailError = 'Please insert a valid email'
      }

      if (!this.comment) {
        formValid = false
        this.error = 'Please leave a comment'
      }

      return formValid
    },
    async submitRequest () {
      let formIsValid = this.validateForm()
      let cleanedComment = this.comment.replace(/[^a-z'A-Z ]/, '').replace(/[/(){};:*]/g, '')
      let cleanedName = this.name.replace(/[^a-z'A-Z ]/, '').replace(/[/(){};:*]/g, '')

      if (formIsValid) {
        let response = await http.post('host-request/', {
          comment: cleanedComment,
          email: this.email,
          name: cleanedName
        })

        if (response.data.error) {
          this.error = response.data.error
        }

        if (response.data.success) {
          this.requestSent = true
        }
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
</style>
