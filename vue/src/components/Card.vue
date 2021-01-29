<template>
  <div class='cardStyles p-0'>
    <router-link class='noUnderline' :to=cardLink>
      <img class='cardImage card-img-top' :src='require(`../assets/img/${cardImage}`)' alt='Card image cap'>
      <div class='card-body pl-0 pb-0 pt-2 ml-3'>
        <h5 class='mb-2'>{{cardTitle}}</h5>
        <p class='font-weight-light text libreFont'>{{cardText}}</p>
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  props: ['cardImage', 'cardText', 'cardLink', 'cardTitle']
}
</script>

<style scoped>
.libreFont {
  font-family: 'Lucida Sans';
}

.cardStyles {
  width: 200px;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
}

.cardStyles:hover {
  transition: 0.2s ease-in-out;
  box-shadow: 0 2px 4px rgba(0,0,0,0.15);
}

.cardImage {
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  height: 18vw;
}

.noUnderline {
  color: inherit;
  text-decoration: none !important
}

.text {
  font-size: 15px;
}

@media screen and (max-width: 500px) {
  .cardImage {
    height: 30vw;
  }
}
</style>
