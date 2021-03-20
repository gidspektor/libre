import axios from 'axios'
import store from './store'

export async function post (url, data) {
  const config = Object.assign(defaultConfig(), {
    url: store.state.endpoints.baseUrl + url,
    method: 'post',
    data: data
  })

  let response = await axios.request(config)

  return response
}

export async function get (url) {
  const config = Object.assign(defaultConfig(), {
    url: store.state.endpoints.baseUrl + url,
    method: 'get'
  })

  let response = await axios.request(config)

  return response
}

function defaultConfig () {
  return {
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer ' + localStorage.getItem('t')
    }
  }
}
