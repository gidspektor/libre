<template>
  <main class='section container-fluid mt-5 pt-5'>
    <div class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'>
      <div class='noUnderline col-lg-11 item mt-2'>
        <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
          <h5 class='mb-lg-3'>{{post.title}}</h5>
          <h6>{{post.location}}</h6>
          <p class='font-weight-light font-italic text'>{{post.description}}</p>
        </div>
      </div>
    </div>
    <div class='row d-flex justify-content-center'>
      <textarea v-model='comment' class='form-control inputfield mt-4 col-lg-10 col-10' placeholder='Leave a comment'></textarea>
    </div>
    <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
      {{ error }}
    </div>
  </main>
</template>

<script>
import store from '../../store'

export default {
  data () {
    return {
      post: '',
      error: '',
      comment: ''
    }
  },

  created () {
    this.post = JSON.parse(store.state.selectedPost)
  }
}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  cursor: pointer;
  border-bottom: solid rgb(230, 227, 227);
}

.noUnderline {
  color: inherit;
  text-decoration: none !important
}

.item {
  display: inline-block;
}

.text {
  font-size: 14px;
}

.section {
  height: 700px;
}

.inputfield {
  height: 200px;
  resize: none;
}
</style>
