<template>
  <nav class='navbar navbar-expand-lg navbar-light bg-light'>
    <a class='navbar-brand ml-5' href='#'>
      <strong class='font-italic'>Libre</strong>
    </a>
    <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
      <span class='navbar-toggler-icon'></span>
    </button>
    <div class='collapse navbar-collapse' id='navbarSupportedContent'>
      <ul class='navbar-nav ml-auto'>
        <li class='nav-item mr-3'>
          <a class='nav-link' href='#'>Host an event</a>
        </li>
        <li class='nav-item dropdown'>
          <a class='nav-link dropdown-toggle mr-3' @click='toggleDropdown' href='#' id='navbarDropdown' role='button'>
            <img src='~@/assets/img/user.svg'>
          </a>
          <div class='drop dropdown-menu-right' v-show='state'>
            <a class='nav-link' href='#'>Sign up</a>
            <a class='nav-link' href='#'>Log in</a>
            <div class='dropdown-divider'></div>
            <a class='nav-link' href='#'>Host events</a>
            <a class='nav-link' href='#'>Help</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  data () {
    return {
      state: false
    }
  },
  created () {
    window.addEventListener('click', (e) => {
      if (e.target.id !== 'navbarDropdown') {
        this.state = false
      }
    })
  },
  methods: {
    toggleDropdown () {
      this.state = !this.state
    }
  }
}
</script>

<style scoped>
  .drop {
    width: 200px;;
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
</style>
