<template>
<main>
  <div class='myModal'>
    <div class='modal-dialog modal-dialog-centered' role='document'>
      <div class='modal-content'>
        <div class='row pl-3'>
          <div @click='closeModal' class='closeModal col-1'>&times;</div>
        </div>
        <div v-if='continueWithEmail | signUpUser' class='row'>
          <img @click='goBack' class='mt-2 col-1 ml-3 arrow' src='~@/assets/img/arrow.png'>
        </div>
        <div class='px-3 modalHead text-center pb-2'>
          <h5 class='modal-title d-inline font-weight-bold'>Log in or sign up</h5>
        </div>
        <div class='modal-body'>
          <div v-if='!signUpUser'>
            <div v-if='continueWithEmail'>
              <div class='mb-3 libreFont row'>
                <div class='col-12'>
                  <input v-model='email' type='email' class='form-control col-12' placeholder='Email Address'>
                  <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
                    {{ emailError }}
                  </div>
                  <input v-model='password' type='password' class='form-control col-12' placeholder='Password'>
                  <a class='pl-1 libreFont' href='#'>Forgot password?</a>
                  |
                  <a class='libreFont' href='#' @click='signUp'>Sign up?</a>
                  <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
                    {{ error }}
                  </div>
                </div>
              </div>
              <div class='row d-flex justify-content-center'>
                <button @click='login' type='button' class='col-11 btn logoColour libreFont text-center'>Continue</button>
              </div>
            </div>
            <div class='pt-lg-4 row d-flex justify-content-center'>
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
              <button type='button' class='col-11 btn customButton' @click='loginWithEmail'>
                <div>
                  <img class='d-inline logos' src='~@/assets/img/email.png'>
                  <div class='d-inline libreFont mr-4'>Continue with email</div>
                </div>
              </button>
            </div>
          </div>
          <div v-else-if='signUpUser'>
            <div class='row d-flex justify-content-center'>
              <input v-model='name' class='form-control col-11' placeholder='Full name' type='text'>
            </div>
            <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='nameError'>
              {{ nameError }}
            </div>
            <div class='row d-flex justify-content-center my-2'>
              <input v-model='email' class='form-control col-11' placeholder='Email address' type='email'>
            </div>
            <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='emailError'>
              {{ emailError }}
            </div>
            <div class='row d-flex justify-content-center'>
              <input v-model='password' class='form-control col-11' placeholder='Create password (minimum of 8 characters)' type='password'>
            </div>
            <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='passwordLengthError'>
              {{ passwordLengthError }}
            </div>
            <div class='row d-flex justify-content-center my-2'>
              <input v-model='passwordRepeat' class='form-control col-11' placeholder='Repeat password' type='password'>
            </div>
            <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='passwordNotMatchError'>
              {{ passwordNotMatchError }}
            </div>
            <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
              {{ error }}
            </div>
            <div class='py-lg-2 row d-flex justify-content-center'>
              <div class='col-11 line text-center'></div>
            </div>
            <div class='row d-flex justify-content-center'>
              <button @click='createAccount' class='btn logoColour libreFont col-11'> Create Account</button>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </main>
</template>

<script>
import GoogleSignInButton from 'vue-google-signin-button-directive'
import {post} from '../http-common'
import {validateEmail} from '../tools'

export default {
  directives: {
    GoogleSignInButton
  },

  data () {
    return {
      continueWithEmail: false,
      email: '',
      validateEmail: validateEmail,
      error: '',
      password: '',
      passwordRepeat: '',
      signUpUser: false,
      name: '',
      emailError: '',
      passwordLengthError: '',
      passwordNotMatchError: '',
      nameError: ''
      // clientId: '',
      // v-google-signin-button='clientId'
    }
  },

  methods: {
    // OnGoogleAuthSuccess (idToken) {
    //   console.log(idToken)
    // },
    // OnGoogleAuthFail (error) {
    //   console.log(error)
    // },
    goBack () {
      if (this.continueWithEmail && !this.signUpUser) {
        this.continueWithEmail = false
      }

      if (this.signUpUser) {
        this.signUpUser = false
      }
    },
    signUp () {
      this.signUpUser = true
    },
    closeModal () {
      this.continueWithEmail = false
      this.$emit('close-modal')
    },
    loginWithEmail () {
      this.continueWithEmail = true
    },
    async login () {
      this.error = ''
      let emailIsValid = this.validateEmail(this.email)

      if (!emailIsValid) {
        this.emailError = 'Please insert a valid email'
      } else {
        this.$store.dispatch('obtainToken', [this.email, this.password]).catch((badRequest) => {
          badRequest = 'Username and/or password not found.'
          this.error = badRequest
        }).then(() => {
          if (!this.error) {
            this.$emit('next-page')
          }
        })
      }
    },
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
          this.$store.dispatch('obtainToken', [this.email, this.password]).catch((badRequest) => {
            badRequest = 'Username and/or password not found.'
            this.error = badRequest
          }).then(() => {
            if (!this.error) {
              this.$emit('next-page')
            }
          })
        }
      }
    }
  }
}
</script>

<style scoped>
.arrow {
  cursor: pointer;
  height: 25px;
}

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

.signupLogos {
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
