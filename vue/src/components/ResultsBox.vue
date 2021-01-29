<template>
  <main class='row d-flex justify-content-center cardStyles' v-bind:class='topBorder'>
    <div class='col-lg-4 pt-3 item px-lg-1 mt-lg-1 mr-lg-4'>
      <img class='cardImage card-img-top' :src='require(`../assets/images/${cardImage}.jpg`)' alt='Card image cap'>
    </div>
    <div class='noUnderline col-lg-6 item mt-3' >
      <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
        <h5 class='mb-lg-3'>{{cardTitle}}</h5>
        <p class='font-weight-light font-italic text'>{{cardText}}</p>
        <div class='mt-lg-5'>
          <p class='d-lg-inline font-weight-bold'>Artists:</p>
          <!-- <p class='d-inline font-italic' :v-for='(artist, index) in artists'>{{artist}} slam master funk</p><span :v-if='index < artists.length - 1'>,</span> -->
          <p class='d-lg-inline ml-lg-5 font-weight-bold'>Genres:</p>
          <p class='d-lg-inline mr-lg-5 font-italic'>{{genres}} beep bop</p>
          <p class='d-lg-inline font-weight-bold'>Capacity:</p>
          <p class='d-lg-inline font-italic'>{{capacity}} 100</p>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  props: [
    'cardImage',
    'cardText',
    'eventId',
    'cardTitle',
    'capacity',
    'date_time',
    'allows_own_drinks',
    'resultsIndex'
  ],

  computed: {
    topBorder () {
      return this.resultsIndex === 0 ? 'cardTopBorder' : ''
    }
  }

}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  cursor: pointer;
  border-bottom: solid rgba(13, 201, 44, 0.3);
  border-width: 2px;
}

.cardTopBorder {
  border-top: solid rgba(13, 201, 44, 0.3);
  border-width: 2px;
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
