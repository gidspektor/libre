<template>
  <main class='container-fluid'>
    <div class='row'>
      <nav class='col-12 navbar navbar-expand-lg navbar-light'>
        <a class='navbar-brand ml-5' >
          <router-link to='/'><strong class='logoColour libreFont'>Libre</strong></router-link>
        </a>
        <button class='navbar-toggler bg-light' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
          <span class='navbar-toggler-icon' id='hamburgerDropdown' @click='toggleHamburger'></span>
          <div class='drop dropdown-menu-right' v-show='hamBurgetState'>
            <a v-if='loggedIn' class='nav-link'><router-link to='/Account'>Account</router-link></a>
            <a v-else class='nav-link'><router-link to='signUp'>Sign up</router-link></a>
            <a v-if='loggedIn' class='nav-link' @click='logout'><router-link to='/'>Logout</router-link></a>
            <a v-else class='nav-link'><router-link to='/Login'>Login</router-link></a>
            <div class='dropdown-divider'></div>
            <a class='nav-link'><router-link to='/Collaborate'>Collaborate</router-link></a>
          </div>
        </button>
        <div class='collapse navbar-collapse d-flex-md justify-content-end' id='navbarSupportedContent'>
          <ul class='navbar-nav'>
            <li class='nav-item mr-3'>
              <a class='noUnderline nav-link text-white libreFont'>
                <router-link to='/Collaborate'>Collaborate</router-link>
              </a>
            </li>
            <li class='nav-item mr-3'>
              <a class='noUnderline nav-link text-white libreFont'>
                <router-link to='/HostEvents'>Host an event</router-link>
              </a>
            </li>
            <li class='nav-item mr-3'>
              <a v-if="this.$route.name === 'collaborate' || this.$route.name === 'post'" class='noUnderline nav-link text-white createPostText libreFont'>
                <router-link to='/CreatePost'>Create a post +</router-link>
              </a>
            </li>
            <li class='nav-item dropdown'>
              <span class='nav-link dropdown-toggle mr-3 text-black' @click='toggleDropdown' id='navbarDropdown' role='button'>
                <img class='' src='~@/assets/img/user.svg'>
              </span>
              <div class='drop dropdown-menu-right' v-show='dropState'>
                <a v-if='loggedIn' class='nav-link'><router-link to='/Account'>Account</router-link></a>
                <a v-else class='nav-link'><router-link to='signUp'>Sign up</router-link></a>
                <a v-if='loggedIn' class='nav-link' @click='logout'><router-link to='/'>Logout</router-link></a>
                <a v-else class='nav-link'><router-link to='/Login'>Login</router-link></a>
                <div class='dropdown-divider'></div>
                <a class='nav-link'><router-link to='/Collaborate'>Collaborate</router-link></a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </main>
</template>

<script>
import store from '../store'

export default {
  data () {
    return {
      dropState: false,
      hamBurgetState: false
    }
  },

  computed: {
    loggedIn () {
      return store.state.user
    },
    searchRedirect () {
      return this.$route.name !== 'collaborate' ? 'findEvents' : this.$route.name
    }
  },

  created () {
    window.addEventListener('click', (e) => {
      if (e.target.id !== 'navbarDropdown' && e.target.id !== 'hamburgerDropdown') {
        this.dropState = false
        this.hamBurgetState = false
      }
    })
  },

  methods: {
    logout () {
      this.$store.dispatch('logout')
    },
    toggleDropdown () {
      this.dropState = !this.dropState
    },
    toggleHamburger () {
      this.hamBurgetState = !this.hamBurgetState
    }
  }
}
</script>

<style scoped>
.libreFont {
  font-family: 'Lucida Sans';
}

.dropdown {
  border-radius: 20px;
  background-color: rgb(192, 189, 191);
}

.drop {
  width: 200px;
  border-radius: 10px;
  position: absolute;
  z-index: 1000;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  background-color: #f9f9f9;
}

.nav-item:hover {
  border-radius: 30px;
  background-color: rgb(192, 189, 191);
}

nav{
  background: rgba(0,0,0,0.4);
  z-index: 1000;
  position: fixed;
}

.logoColour {
  color: rgb(13, 201, 44);
}

.createPostText {
  font-size: 20px;
}

.noUnderline {
  color: inherit;
  text-decoration: none !important
}
</style>
