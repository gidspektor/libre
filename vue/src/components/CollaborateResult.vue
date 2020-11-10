<template>
  <main class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'>
    <div class='noUnderline col-lg-8 item mt-2' :to=cardLink>
      <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
        <h5 class='mb-lg-3'>{{cardTitle}}The Castle</h5>
        <h6>{{country}}{{city}}{{area}}Spain - Barcelona, sants</h6>
        <p class='font-weight-light font-italic text'>{{cardText}}
          Everyone has a plumbus in their home. First they take the dingle bop and they smooth it out with a bunch of schleem. The schleem is then...repurposed for later batches.
          They take the dingle bop and they push it through the grumbo, where the fleeb is rubbed against it. It's important that the fleeb is rubbed, becasue the fleeb has all the fleeb juice.
          Then, a schlami shows up, and he rubs it...and spits on it.
          They cut the fleeb. There's several hizzards in the way.
          The blamfs rub against the chumbles, and the...plubis, and grumbo are shaved away.
          That leaves you with...a regular old plumbus.
        </p>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  props: ['cardText', 'cardLink', 'cardTitle', 'country', 'city']
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
