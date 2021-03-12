<template>
  <main class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'>
    <div class='noUnderline col-lg-8 item mt-2'  @click='goToPostPage'>
      <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
        <h5 class='mb-lg-3'>{{title}}</h5>
        <h6>{{location}}</h6>
        <p class='font-weight-light font-italic text'>{{description}}</p>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  props: [
    'title',
    'description',
    'location',
    'userPost'
  ],

  methods: {
    goToPostPage () {
      return this.$emit('go-to-post-page', this.userPost)
    }
  }
}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  cursor: pointer;
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
