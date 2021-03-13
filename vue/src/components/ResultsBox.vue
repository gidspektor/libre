<template>
  <main class='row my-2 mx-2 d-flex justify-content-center'>
    <h5 v-if='isNotAvailable' class='soldOutText jumbotron vertical-center mt-lg-5 d-flex justify-content-center'>Sold Out</h5>
    <div :class='isNotAvailable' @click='goToEventsPage' class='col-11 d-flex justify-content-center cardStyles'>
      <div class='col-lg-4 pt-3 item px-lg-1 mt-lg-1 mr-lg-4'>
        <img class='cardImage card-img-top' :src='require(`../assets/images/${cardImage}.jpg`)' alt='Card image cap'>
      </div>
      <div class='noUnderline mt-lg-5 col-lg-6 item mt-3'>
        <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
          <h5 class='mb-lg-3 libreFont font-weight-bold'>{{cardTitle}}</h5>
          <p class='font-weight-light font-italic text'>{{cardText}}</p>
          <div class='mt-lg-5'>
            <p class='d-lg-inline font-weight-bold libreFont'>When:
              <span class='libreFont font-weight-light'>{{this.formatDate(date_time)}}</span>
            </p>
            <p class='d-lg-inline ml-lg-5 font-weight-bold libreFont'>Bring your own booze:
              <span class='libreFont font-weight-light'>{{formatAllowDrinks}}</span>
            </p>
            <p class='d-lg-inline ml-lg-5 font-weight-bold libreFont'>Capacity:
              <span class='libreFont font-weight-light'>{{capacity}}</span>
            </p>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import {formatDate} from '../tools'
export default {
  data () {
    return {
      formatDate: formatDate
    }
  },

  props: [
    'cardImage',
    'cardText',
    'cardTitle',
    'capacity',
    'date_time',
    'allows_own_drinks',
    'event',
    'atl'
  ],

  computed: {
    formatAllowDrinks () {
      return this.allows_own_drinks ? 'Yes' : 'No'
    },
    isNotAvailable () {
      return !this.atl ? 'soldOut' : ''
    }
  },

  methods: {
    goToEventsPage () {
      return !this.atl ? null : this.$emit('go-to-events-page', this.event)
    }
  }
}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  cursor: pointer;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  border: solid rgba(12, 12, 12, 0.3);
  border-width: 2px;
}

.cardStyles:hover {
  transition: 0.2s ease-in-out;
  box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.15);
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

.libreFont {
  font-family: 'Lucida Sans';
}

.soldOutText {
  position: absolute;
}

.soldOut {
  opacity: 0.3;
}

@media screen and (max-width: 500px) {
  .cardImage {
    height: 30vw;
  }
  .cardStyles {
    height: auto;
  }
}
</style>
