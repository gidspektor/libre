import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    eventSearchResults: [],
    selectedEvent: localStorage.getItem('event'),
    jwt: localStorage.getItem('t'),
    endpoints: {
      obtainJWT: 'http://127.0.0.1:8000/api/auth/login/',
      refreshJWT: 'http://127.0.0.1:8000/api/auth/refresh_login/',
      baseUrl: 'http://127.0.0.1:8000/api/'
    },
    isGuest: false
  },

  mutations: {
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

      if (response.error) {
        console.log(response.error)
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
    }
  }
})
