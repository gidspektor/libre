import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    searchResults: null
  },

  mutations: {
    userInfo (state, data) {
      state.user = data.user
    },

    setSearchResults (state, data) {
      state.searchResults = data
      console.log('heyl')
      console.log(state.searchResults)
    }
  },

  actions: {
    getUserInfo (context) {
      context.commit('userInfo', 'gideon')
      // create user endpoint
      // axiox.get('user/info').then((data) => {
      //   context.commit('userInfo', data)
      // })
    },

    searchResults (context, data) {
      context.commit('setSearchResults', data)
    }
  }
})
