<template>
  <section class='section container-fluid bg-dark py-5'>
    <div class='row'>
      <div class='text-white col-lg-12 text-center'>
        <h1 class='display-3 mainTitle'>Explore Libre</h1>
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
      <div class='col-lg-6 d-flex justify-content-center pr-5'>
        <h5 class='pr-5 text-white'>Logo go here</h5>
      </div>
      <div class='col-lg-2'>
        <p class='text-left titles pb-2'>Learn More</p>
        <ul class='list-unstyled text-left'>
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
            <a class='text-white' href='/'>Terms & Conditions</a>
          </li>
        </ul>
      </div>
      <div class='col-lg-2'>
        <p class='text-left titles pb-2'>Get Involved</p>
        <ul class='list-unstyled text-left'>
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

.titles {
  font-size: 15px;
  color: rgb(13, 201, 44);
}

.mainTitle{
  font-family: Tahoma;
}
</style>
