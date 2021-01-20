<template>
  <main class='container-fluid'>
    <div class='row'>
      <nav class='col-12 navbar navbar-expand-lg navbar-light mb-5'>
        <a class='navbar-brand ml-5' >
          <router-link to='/'><strong class='text-white font-italic'>Libre</strong></router-link>
        </a>
        <button class='navbar-toggler bg-light' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
          <span class='navbar-toggler-icon' id='hamburgerDropdown' @click='toggleHamburger'></span>
          <div class='drop dropdown-menu-right' v-show='hamBurgetState'>
            <a class='nav-link' href='#'>Sign up</a>
            <a class='nav-link' href='#'>Log in</a>
            <div class='dropdown-divider'></div>
            <!-- <router-link class='nav-link' :to="{createEvents}">Host events</router-link> -->
            <a class='nav-link' href='#'>Help</a>
          </div>
        </button>
        <div class='collapse navbar-collapse d-flex-md justify-content-end' id='navbarSupportedContent'>
          <ul class='navbar-nav'>
            <li class='nav-item mr-3'>
              <a v-if="this.$route.name !== 'createEvents'" class='nav-link text-white ' href='#/createEvents'>Host an event</a>
              <a v-else class='nav-link text-white ' href='#/FindEvents'>Find an event</a>
            </li>
            <li class='nav-item dropdown'>
              <span class='nav-link dropdown-toggle mr-3 text-black' @click='toggleDropdown' id='navbarDropdown' role='button'>
                <img class='' src='~@/assets/img/user.svg'>
              </span>
              <div class='drop dropdown-menu-right' v-show='dropState'>
                <a class='nav-link' href='#'>Sign up</a>
                <a class='nav-link' href='#'>Log in</a>
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
export default {
  data () {
    return {
      dropState: false,
      hamBurgetState: false
    }
  },
  computed: {
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
</style>
