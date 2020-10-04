<template>
  <section class='section container-fluid bg-dark py-5'>
    <div class='row'>
      <div class='text-white col-lg-12 text-center'>
        <h1 class='display-lg-3 display-5 mainTitle'>Explore Libre</h1>
      </div>
    </div>
    <div class='row text-center d-flex justify-content-center mt-2 mb-5'>
      <div class='col-lg-1 px-0'>
        <a class='' href='/'>Berlin</a>
      </div>
      <div class='col-lg-2 px-0'>
        <a class='' href='/'>Barcelona</a>
      </div>
      <div class='col-lg-1 px-0'>
        <a href='/'>London</a>
      </div>
    </div>
    <div class='row mt-4'>
      <div class='col-lg-6 d-flex justify-content-center'>
        <h5 class='pr-5 text-white'>Logo go here</h5>
      </div>
      <div class='col-lg-2'>
        <p class='text-lg-left text-center titles pb-lg-2'>Learn More</p>
        <ul class='list-unstyled text-lg-left text-center'>
          <li class='pb-2'>
            <a class='text-white' href='/'>About</a>
          </li>
          <li class='pb-2'>
            <a class='text-white' href='/'>How it works</a>
          </li>
          <li class='pb-2'>
            <a class='text-white' href='/'>FAQ</a>
          </li>
          <li>
            <router-link to='terms'><a class='text-white'>Terms & Conditions</a></router-link>
          </li>
        </ul>
      </div>
      <div class='col-lg-2'>
        <p class='text-lg-left text-center titles pb-2'>Get Involved</p>
        <ul class='list-unstyled text-lg-left text-center'>
          <li class='pb-2'>
            <a class='text-white' href='/'>Perform</a>
          </li>
          <li class='pb-2'>
            <a class='text-white' href='/'>Create Events</a>
          </li>
          <li class='pb-2'>
            <a class='text-white' href='/'>Careers</a>
          </li>
          <li>
            <a class='text-white' href='/'>Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
export default {

}
</script>

<style scoped>
.section {
    height: 500px;
}

@media screen and (max-width: 800px) {
  .section {
    height: 700px;
  }
}

.titles {
  font-size: 15px;
  color: rgb(13, 201, 44);
}

.mainTitle{
  font-family: Tahoma;
}
</style>
