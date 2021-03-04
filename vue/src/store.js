import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    eventSearchResults: [],
    selectedEvent: [],
    jwt: localStorage.getItem('t'),
    endpoints: {
      obtainJWT: 'http://127.0.0.1:8000/api/auth/login/',
      refreshJWT: 'http://127.0.0.1:8000/api/auth/refresh_login/'
    }
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
    async obtainToken (context, data) {
      const payload = {
        username: data[0],
        password: data[1]
      }

      let response = await axios.post(this.state.endpoints.obtainJWT, payload)

      if (response.error) {
        console.log(response.error)
      }

      return context.commit('updateToken', response.data.token)
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
    // inspectToken (context) {
    //   const token = state.jwt
    //   if (token) {
    //     const decoded = jwt_decode(token)
    //     const exp = decoded.exp
    //     const orig_iat = decoded.orig_iat
    //     if (exp - (Date.now() / 1000) < 1800 && (Date.now() / 1000) - orig_iat < 628200) {
    //       context.dispatch('refreshToken')
    //     } else if (exp - (Date.now() / 1000) < 1800) {
    //       // DO NOT REFRESH
    //     } else {
    //       // PROMPT USER TO RE-LOGIN, THIS ELSE CLAUSE COVERS THE CONDITION WHERE A TOKEN IS EXPIRED AS WELL
    //     }
    //   }
    // },
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
