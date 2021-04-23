<template>
  <main class='container-fluid section pt-5 mt-5'>
    <div class='px-3 modalHead text-center'>
      <h5 class='modal-title d-inline logoTextColour libreFont font-weight-bold'>Login</h5>
    </div>
    <div class='mb-3 libreFont row d-flex justify-content-center mt-4 pt-5'>
      <div class='col-lg-6 col-11'>
        <input v-model='email' type='email' class='form-control mb-2' placeholder='Email Address'>
        <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
          {{ emailError }}
        </div>
        <input v-model='password' type='password' class='form-control' placeholder='Password'>
        <div class='d-flex justify-content-center'>
          <a class='libreFont mr-auto' href='#'>Forgot password? </a>
          <a class='libreFont'><router-link to='signUp'>Sign up</router-link></a>
        </div>
        <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
          {{ error }}
        </div>
      </div>
    </div>
    <div class='row d-flex justify-content-center'>
      <button @click='login' type='button' class='col-lg-6 col-10 btn logoColour libreFont text-center'>Login</button>
    </div>
    <div class='py-4 row d-flex justify-content-center'>
      <div class='col-lg-8 col-10 line text-center'><span class='or'>or</span></div>
    </div>
    <div class='pt-lg-4 row d-flex justify-content-center'>
      <button type='button' class='col-lg-6 col-10 btn customButton' v-google-signin-button='clientId'>
        <div>
          <img class='d-inline logos' src='~@/assets/img/google.png'>
          <div class='d-inline libreFont mr-4'>Continue with Google</div>
        </div>
      </button>
    </div>
    <!-- <div class='row d-flex justify-content-center mt-lg-3'>
      <button type='button' class='col-lg-6 col-10 btn customButton'>
        <div>
          <img class='d-inline logos ml-3' src='~@/assets/img/fb.png'>
          <div class='d-inline libreFont mr-4'>Continue with Facebook</div>
        </div>
      </button>
    </div> -->
  </main>
</template>
<script>
import GoogleSignInButton from 'vue-google-signin-button-directive'
import {validateEmail} from '../../tools'
import {post} from '../../http-common'
import store from '../../store'

export default {
  directives: {
    GoogleSignInButton
  },

  data () {
    return {
      email: '',
      validateEmail: validateEmail,
      error: '',
      password: '',
      emailError: '',
      clientId: store.state.clientId
    }
  },

  methods: {
    async OnGoogleAuthSuccess (idToken) {
      this.error = ''
      this.isLoading = true
      let response = await post('auth/google', {token: idToken}).catch(error => {
        this.error = error.response.data.detail
        this.isLoading = false
      })

      if (response && (response.status === 201 || response.status === 200)) {
        this.$store.dispatch('setTokenWithSocialMedia', idToken).catch((badRequest) => {
          badRequest = 'Auth error'
          this.error = badRequest
        }).then(() => {
          this.isLoading = false

          if (!this.error) {
            this.$router.go(-1)
          }
        })
      }

      this.loading = false
    },
    OnGoogleAuthFail (error) {
      this.loading = false
      console.log(error)
    },
    async login () {
      this.error = ''
      let emailIsValid = this.validateEmail(this.email)

      if (!emailIsValid) {
        this.emailError = 'Please insert a valid email'
      } else {
        await this.$store.dispatch('obtainToken', [this.email, this.password]).catch((badRequest) => {
          badRequest = 'Username and/or password not found.'
          this.error = badRequest
        }).then(() => {
          if (!this.error) {
            this.$router.go(-1)
          }
        })
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

.logos {
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

.line {
  line-height: 0.1em;
  margin: 10px 0 20px;
  height: 0px;
  border-bottom: solid rgba(20, 20, 20, 0.1);
  border-width: 2px;
}

.or {
  background:#fff;
  padding:0 10px;
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
</style>
