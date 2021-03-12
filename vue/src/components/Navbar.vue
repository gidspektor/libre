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
            <a v-if='loggedIn' class='nav-link' href='#/Account'>Account</a>
            <a v-else class='nav-link' href='#/SignUp'>Sign up</a>
            <a v-if='loggedIn' class='nav-link' @click='logout' href='/'>Logout</a>
            <a v-else class='nav-link' href='#/Login'>Login</a>
            <div class='dropdown-divider'></div>
            <a class='nav-link' href='#'>Help</a>
          </div>
        </button>
        <div class='collapse navbar-collapse d-flex-md justify-content-end' id='navbarSupportedContent'>
          <ul class='navbar-nav'>
            <li class='nav-item mr-3'>
              <a v-if="this.$route.name !== 'collaborate' && this.$route.name !== 'Post'" class='nav-link text-white libreFont' href='#/createEvents'>Host an event</a>
              <a v-else class='nav-link text-white createPostText libreFont' href='#/CreatePost'>Create a post +</a>
            </li>
            <li class='nav-item dropdown'>
              <span class='nav-link dropdown-toggle mr-3 text-black' @click='toggleDropdown' id='navbarDropdown' role='button'>
                <img class='' src='~@/assets/img/user.svg'>
              </span>
              <div class='drop dropdown-menu-right' v-show='dropState'>
                <a v-if='loggedIn' class='nav-link' href='#/Account'>Account</a>
                <a v-else class='nav-link' href='#/SignUp'>Sign up</a>
                <a v-if='loggedIn' class='nav-link' @click='logout' href='/'>Logout</a>
                <a v-else class='nav-link' href='#/Login'>Login</a>
                <div class='dropdown-divider'></div>
                <a class='nav-link' href='#/Collaborate'>Collaborate</a>
                <a class='nav-link' href='#'>Help</a>
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
  position: absolute;
  z-index: 1000;
}

.logoColour {
  color: rgb(13, 201, 44);
}

.createPostText {
  font-size: 20px;
}
</style>
