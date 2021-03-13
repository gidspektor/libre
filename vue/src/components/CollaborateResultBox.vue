<template>
  <main class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'>
    <div class='noUnderline col-lg-8 item mt-2'  @click='goToPostPage'>
      <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
        <h5 class='mb-lg-3'>{{title}}</h5>
        <h6>{{location}}</h6>
        <p class='font-weight-light font-italic text'>{{description}}</p>
      </div>
      <h6 class='mt-5'>{{userName}}</h6>
      <h6 class='mb-3'>{{formatDate(date)}}</h6>
    </div>
  </main>
</template>

<script>
import {formatDate} from '../tools'
export default {
  props: [
    'title',
    'description',
    'location',
    'userPost',
    'userName',
    'date'
  ],

  data () {
    return {
      formatDate: formatDate
    }
  },

  methods: {
    goToPostPage () {
      this.$store.dispatch('selectPost', this.userPost)
      this.$router.push('Post')
    }
  }
}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  border-bottom: solid rgb(230, 227, 227);
}

.cardImage {
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  height: 18vw;
}

.noUnderline {
  color: inherit;
  text-decoration: none !important
}

.item {
  cursor: pointer;
  display: inline-block;
}

.text {
  font-size: 14px;
}

@media screen and (max-width: 500px) {
  .cardImage {
    height: 30vw;
  }
}
</style>
