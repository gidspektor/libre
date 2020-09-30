<template>
  <div class='row'>
    <div class='col-12'>
      <div class='search col-lg-7 pr-0 d-flex justify-content-center'>
        <div class='col-lg-4 searchItem pl-lg-3'>
          <div class='pt-2 text text-headers font-weight-bold'>Location</div>
          <input v-model='loaction' type='text' class='p-0 text searchText font-weight-light font-italic' placeholder='Where would you like to go?'>
        </div>
        <div class='col-lg-3 searchItem pr-0 mr-5'>
          <div class='pl-lg-3 pt-2 text text-headers font-weight-bold'>Genre</div>
          <input v-model='genre' type='text' class='pl-lg-3 pt-0 text searchText font-weight-light font-italic' placeholder='Choose a genre'>
        </div>
        <div class='col-lg-2 searchItem pr-lg-0 pl-lg-3'>
          <div class='pl-lg-3 pt-2 text text-headers font-weight-bold'>Date</div>
          <input v-model='date' type='date' class='pt-0 date'>
        </div>
        <div class='col-lg-1 ml-lg-5 pt-lg-3 searchItem'>
          <img class='icon' src='~@/assets/img/search.svg'>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      location: '',
      genre: '',
      date: ''
    }
  }
}
</script>

<style scoped>
.mainImage {
  background: url('~@/assets/img/home.jpg') no-repeat;
  height: 800px;
  background-size: cover;
  background-position: center;
}

.search {
  height: 60px;
  margin: 0 auto;
  margin-top: 20px;
  font-size: 18px;
  font-weight: bold;
  border: 3px solid #ffff;
  background-color: #ffff;
  text-transform: uppercase;
  text-decoration: none;
  border-radius: 60px;
}

.text {
  letter-spacing: 0.1em;
}

.text-headers {
  font-size: 11px;
}

.searchText {
  font-size: 12px;
  width: 100%;
}

.searchItem {
  display: inline-block;
  height: 100%;
  border-radius: 60px;
  transition: 0.4s ease-in-out;
}

.date {
  font-size: 12px;
  width: 120px;
}

.date:focus {
  outline: none;
}

input {
  width: 100%;
  font-size: 12px;
  background-color: transparent;
  box-sizing: border-box;
  border: none;
  transition: 0.4s ease-in-out;
}

.searchText:focus {
  outline: none;
}

.icon {
  height: 25px;
  width: 25px;
  cursor: pointer;
}
</style>
