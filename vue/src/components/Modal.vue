<template>
<main>
<div class='myModal'>
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div @click='closeModal' class='closeModal d-inline col-1'>&times;</div>
      <div class='px-3 modalHead text-center pb-2'>
        <h5 class='modal-title d-inline font-weight-bold'>Log in or sign up</h5>
      </div>
      <div class="modal-body">
        <div>
          <div v-if='!continueWithEmail' class='row d-flex justify-content-center'>
            <button @click='goToEventPage' type='button' class='col-11 btn logoColour libreFont text-center'>Continue as guest</button>
          </div>
          <div v-else-if='continueWithEmail'>
            <div class='mb-3 libreFont row'>
              <div class='col-12'>
                <input v-model='email' type='email' class='form-control col-12' placeholder='Email Address'>
                <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
                  {{ error }}
                </div>
              </div>
            </div>
            <div class='row d-flex justify-content-center'>
              <button @click='checkUser' type='button' class='col-11 btn logoColour libreFont text-center'>Continue</button>
            </div>
          </div>
          <div class='py-lg-4 row d-flex justify-content-center'>
            <div class='col-11 line text-center'><span class='or'>or</span></div>
          </div>
          <div class='row d-flex justify-content-center'>
            <button type='button' class='col-11 btn customButton'>
              <div>
                <img class='d-inline logos' src='~@/assets/img/google.png'>
                <div class='d-inline libreFont mr-4'>Continue with Google</div>
              </div>
            </button>
          </div>
          <div class='row d-flex justify-content-center mt-lg-3'>
            <button type='button' class='col-11 btn customButton'>
              <div>
                <img class='d-inline logos ml-3' src='~@/assets/img/fb.png'>
                <div class='d-inline libreFont mr-4'>Continue with Facebook</div>
              </div>
            </button>
          </div>
          <div v-if='!continueWithEmail' class='row d-flex justify-content-center mt-lg-3'>
            <button type='button' class='col-11 btn customButton'>
              <div>
                <img class='d-inline logos' src='~@/assets/img/email.png'>
                <div class='d-inline libreFont mr-4' @click='loginWithEmail'>Continue with email</div>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  </main>
</template>

<script>
import http from '../http-common'
import {validateEmail} from '../tools'
export default {
  data () {
    return {
      continueWithEmail: false,
      email: '',
      validateEmail: validateEmail,
      error: '',
      userFound: false
    }
  },

  methods: {
    goToEventPage () {
      this.$router.push('EventPage')
    },
    closeModal () {
      this.continueWithEmail = false
      this.$emit('close-modal')
    },
    loginWithEmail () {
      this.continueWithEmail = true
    },
    checkUser () {
      this.error = ''
      let emailIsValid = this.validateEmail(this.email)

      if (emailIsValid) {
        http.get(`user/exists/${this.email}`).then(response => {
          this.userFound = response.data.found
        })
      } else {
        this.error = 'Please input a valid email'
      }
    }
  }
}
</script>

<style scoped>
.logoColour {
  background-color: rgb(13, 201, 44);
}

.libreFont {
  font-family: 'Lucida Sans';
}

.logos {
  position: relative;
  left: -110px;
  height: 30px;
  width: 30px;
}

.customButton {
  border: solid rgba(20, 20, 20, 0.2);
  border-width: 2px;
}

.customButton:hover {
  background-color: rgba(240, 234, 234, 0.5);
}

.or {
  background:#fff;
  padding:0 10px;
}

.line {
  line-height: 0.1em;
  margin: 10px 0 20px;
  height: 0px;
  border-bottom: solid rgba(20, 20, 20, 0.1);
  border-width: 2px;
}

.modalHead {
  border-bottom: solid rgba(20, 20, 20, 0.1);
  border-width: 2px;
}

.myModal {
  border-radius: 60px;
}

.closeModal {
  font-size: 25px;
  cursor: pointer;
}

.error {
  font-size: 13px;
  border-radius: 10px;
}
</style>
