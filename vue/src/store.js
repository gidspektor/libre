import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    UserPostResults: [],
    selectedPost: localStorage.getItem('post'),
    eventSearchResults: [],
    selectedEvent: localStorage.getItem('event'),
    jwt: localStorage.getItem('t'),
    endpoints: {
      obtainJWT: 'http://127.0.0.1:8000/api/auth/login/',
      refreshJWT: 'http://127.0.0.1:8000/api/auth/refresh_login/',
      baseUrl: 'http://127.0.0.1:8000/api/'
    },
    isGuest: false,
    setkeywordLocationSearch: ''
  },

  mutations: {
    setPostSearchResults (state, data) {
      state.UserPostResults = data
    },
    setSelectPost (state, data) {
      localStorage.setItem('post', JSON.stringify(data))
      state.selectedPost = JSON.stringify(data)
    },
    setkeywordLocationSearch (state, data) {
      state.setkeywordLocationSearch = data
    },
    updateToken (state, newToken) {
      localStorage.setItem('t', newToken)
      state.jwt = newToken
    },
    removeToken (state) {
      localStorage.removeItem('t')
      state.jwt = null
    },
    userInfo (state, data) {
      state.user = data
    },
    setEventSearchResults (state, data) {
      state.eventSearchResults = data
    },
    setSelectedEvent (state, data) {
      localStorage.setItem('event', JSON.stringify(data))
      state.selectedEvent = JSON.stringify(data)
    },
    setGuest (state, data) {
      state.isGuest = data
    },
    logout (state, data) {
      localStorage.clear()
      state.user = null
      state.jwt = null
      state.selectedEvent = null
    }
  },

  actions: {
    async obtainToken (context, data) {
      const payload = {
        username: data[0],
        password: data[1]
      }

      let response = await axios.post(this.state.endpoints.obtainJWT, payload)

      if (!response.error) {
        await this.dispatch('getUserInfo', response.data.token)
      }

      context.commit('updateToken', response.data.token)
    },
    async refreshToken (context) {
      const payload = {
        token: this.state.jwt
      }
      let response = await axios.post(this.state.endpoints.refreshJWT, payload)

      if (!response.error) {
        await this.dispatch('getUserInfo', response.data.token)
      }

      context.commit('updateToken', response.data.token)
    },
    async getUserInfo (context, token) {
      let response = await axios.get(this.state.endpoints.baseUrl + 'user-info', {
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'Authorization': 'Bearer ' + token
        }
      })
      context.commit('userInfo', response.data.user)
    },
    eventSearchResults (context, data) {
      context.commit('setEventSearchResults', data)
    },
    selectEvent (context, data) {
      context.commit('setSelectedEvent', data)
    },
    setGuest (context, data) {
      context.commit('setGuest', data)
    },
    setkeywordLocationSearch (context, data) {
      context.commit('setkeywordLocationSearch', data)
    },
    logout (context, data) {
      context.commit('logout')
    },
    selectPost (context, data) {
      context.commit('setSelectPost', data)
    },
    postSearchResults (context, data) {
      context.commit('setPostSearchResults', data)
    }
  }
})
