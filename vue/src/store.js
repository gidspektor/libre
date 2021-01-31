import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    eventSearchResults: [],
    selectedEvent: []
  },

  mutations: {
    userInfo (state, data) {
      state.user = data.user
    },

    setEventSearchResults (state, data) {
      state.eventSearchResults = data
    },

    setSelectedEvent (state, data) {
      state.selectedEvent = data
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

    eventSearchResults (context, data) {
      context.commit('setEventSearchResults', data)
    },

    selectEvent (context, data) {
      context.commit('setSelectedEvent', data)
    }
  }
})
