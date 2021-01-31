<template>
<main>
<div class='myModal'>
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div @click='closeModal' class='closeModal d-inline col-4'>&times;</div>
      <div class='px-3 modalHead text-center pb-2'>
        <h5 class='modal-title d-inline font-weight-bold'>Log in or sign up</h5>
      </div>
      <div class="modal-body">
        <div class='row d-flex justify-content-center'>
          <button @click='goToEventPage' type='button' class='col-11 btn btn-primary libreFont text-center'>Continue as guest</button>
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
        <div class='row d-flex justify-content-center mt-lg-3'>
          <button type='button' class='col-11 btn customButton'>
            <div>
              <div class='d-inline libreFont'>Continue with email</div>
            </div>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
  </main>
</template>

<script>
export default {
  methods: {
    goToEventPage () {
      this.$router.push('EventPage')
    },
    closeModal () {
      this.$emit('close-modal')
    }
  }
}
</script>

<style scoped>
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
</style>
