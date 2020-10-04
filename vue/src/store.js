import Vue from 'vue'
import Vuex from 'vuex'

const store = new Vuex.Store({
  state: {
    user: null,
    searchResults = []
  },

  mutations: {
    userInfo (state, data) {
      state.user = data.user
    },

    setSearchResults (state, data) {
      state.searchResults = data
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