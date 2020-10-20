<template>
  <main class='row d-flex justify-content-center my-lg-4'>
    <div class='cardStyles bg-white m-0 py-lg-0 pl-lg-0 col-lg-9'>
      <div class='col-lg-5 item px-lg-1 mt-lg-1'>
        <img class='cardImage card-img-top' :src='require(`../assets/img/castle.jpg`)' alt='Card image cap'>
      </div>
      <div class='noUnderline col-lg-4 item' :to=cardLink>
        <div class='card-body pb-lg-0 pt-lg-2 mr-lg-0'>
          <h5 class='mb-lg-5'>{{cardTitle}}The Castle</h5>
          <p class='font-weight-light font-italic text'>{{cardText}}
            ejfoiewhgoihwoiwehgoiewhoigheoighoierhgoierhgoierhgoiehgoidrgsrkfjgrjgporj
            rgojdfpgijripgjpiorjgpirejgpierjgpijergijpigjerijepijepgjeirjgrepijripejiperj
            grgpiejgpierjgpirjgpirejgiprejiprejrgpiregjpriejgpiergjpriejgpiergjiprejgeiprgj
          </p>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  props: ['cardImage', 'cardText', 'cardLink', 'cardTitle']
}
</script>

<style scoped>
.cardStyles {
  height: 270px;
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
  font-size: 12px;
}

@media screen and (max-width: 500px) {
  .cardImage {
    height: 30vw;
  }
}
</style>
