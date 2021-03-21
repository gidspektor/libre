import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    postSearchResults: [],
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
    keywordLocationSearch: '',
    clientId: '737037142096-pmqa51ssn0q24g1gag0ckln70ff0vlo1.apps.googleusercontent.com',
    loading: false
  },

  mutations: {
    setLoading (state, data) {
      state.loading = data
    },
    setPostSearchResults (state, data) {
      state.postSearchResults = data
    },
    setSelectPost (state, data) {
      localStorage.setItem('post', JSON.stringify(data))
      state.selectedPost = JSON.stringify(data)
    },
    setkeywordLocationSearch (state, data) {
      state.keywordLocationSearch = data
    },
    updateToken (state, newToken) {
      localStorage.setItem('t', newToken)
    },
    removeToken (state) {
      localStorage.removeItem('t')
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

      await this.dispatch('getUserInfo', response.data.token)

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

      await this.dispatch('getUserInfo', response.data.token)

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
    },
    setLoading (context, data) {
      context.commit('setLoading', data)
    }
  }
})
