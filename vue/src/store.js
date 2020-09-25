import Vue from 'vue'
import Vuex from 'vuex'

const store = new Vuex.Store({
    state: {
        user: null
    },

    mutations: {
        userInfo (state, data) {
            state.user = data.user
        }
    },

    actions: {
        getUserInfo (context) {
            context.commit('userInfo', 'gideon')
            // create user endpoint
            // axiox.get('user/info').then((data) => {
            //   context.commit('userInfo', data)  
            // })
        }
    }
})