<template>
  <main class='container-fluid section pt-5 mt-5'>
    <div class='px-3 modalHead text-center'>
      <h5 class='modal-title d-inline logoTextColour libreFont font-weight-bold'>Sign up</h5>
    </div>
    <div class='mt-4'>
      <div class='row d-flex justify-content-center'>
        <input v-model='name' class='form-control col-lg-6 col-10' placeholder='Full name' type='text'>
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='nameError'>
        {{ nameError }}
      </div>
      <div class='row d-flex justify-content-center my-2'>
        <input v-model='email' class='form-control col-lg-6 col-10' placeholder='Email address' type='email'>
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
        {{ emailError }}
      </div>
      <div class='row d-flex justify-content-center'>
        <input v-model='password' class='form-control col-lg-6 col-10' placeholder='Create password (minimum of 8 characters)' type='password'>
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='passwordLengthError'>
        {{ passwordLengthError }}
      </div>
      <div class='row d-flex justify-content-center my-2'>
        <input v-model='passwordRepeat' class='form-control col-lg-6 col-10' placeholder='Repeat password' type='password'>
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='passwordNotMatchError'>
        {{ passwordNotMatchError }}
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
        {{ error }}
      </div>
      <div class='d-flex justify-content-center'>
        <a class='libreFont d-flex justify-content-center' ><a class='libreFont'><router-link to='login'>Login?</router-link></a></a>
      </div>
      <div class='row d-flex justify-content-center mt-4'>
        <button @click='createAccount' class='btn logoColour libreFont col-lg-6 col-10'> Create Account</button>
      </div>
    </div>
    <div class='py-4 row d-flex justify-content-center'>
      <div class='col-lg-8 col-10 line text-center'><span class='or'>or</span></div>
    </div>
    <div class='pt-lg-4 row d-flex justify-content-center'>
      <button type='button' class='col-lg-6 col-10 btn customButton'>
        <div>
          <img class='d-inline logos' src='~@/assets/img/google.png'>
          <div class='d-inline libreFont mr-4'>Continue with Google</div>
        </div>
      </button>
    </div>
    <div class='row d-flex justify-content-center mt-3'>
      <button type='button' class='col-lg-6 col-10 btn customButton'>
        <div>
          <img class='d-inline logos ml-3' src='~@/assets/img/fb.png'>
          <div class='d-inline libreFont mr-4'>Continue with Facebook</div>
        </div>
      </button>
    </div>
  </main>
</template>
<script>
import {post} from '../../http-common'
import {validateEmail} from '../../tools'

export default {
  data () {
    return {
      email: '',
      validateEmail: validateEmail,
      error: '',
      password: '',
      emailError: '',
      nameError: '',
      name: '',
      passwordRepeat: '',
      passwordLengthError: '',
      passwordNotMatchError: ''
    }
  },

  methods: {
    validateForm () {
      let formValid = false
      let emailIsValid = this.validateEmail(this.email)

      this.emailError = ''
      this.nameError = ''
      this.passwordLengthError = ''
      this.passwordNotMatchError = ''

      if (this.name.split(' ').length === 1 || !this.name) {
        this.nameError = 'Please input full name'
      }

      if (!emailIsValid) {
        this.emailError = 'Please insert a valid email'
      }

      if (this.password.length < 8) {
        this.passwordLengthError = 'Password must be a minimum of 8 characters'
      }

      if (this.password !== this.passwordRepeat) {
        this.passwordNotMatchError = 'Passwords don\'t match'
      }

      if (!this.passwordNotMatchError && !this.passwordLengthError && !this.emailError) {
        formValid = true
      }

      return formValid
    },
    async createAccount () {
      this.error = ''
      let formIsValid = this.validateForm()
      let cleanedName = this.name.replace(/[^a-z'A-Z ]/, '').replace(/[/(){};:*]/g, '')

      if (formIsValid) {
        let response = await post('create-user/', {
          name: cleanedName,
          email: this.email,
          password: this.password,
          password_confirm: this.passwordRepeat
        })

        if (response.data.error) {
          this.error = response.data.error
        }

        if (response.data.success) {
          await this.$store.dispatch('obtainToken', [this.email, this.password]).catch((badRequest) => {
            badRequest = 'Username and/or password not found.'
            this.error = badRequest
          }).then(() => {
            if (!this.error) {
              this.$router.push('Account')
            }
          })
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
