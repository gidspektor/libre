import axios from 'axios'
import store from './store'

export default axios.create({
  baseURL: store.state.endpoints.baseUrl,
  headers: {
    'X-Requested-With': 'XMLHttpRequest',
    'Authorization': 'Bearer ' + localStorage.getItem('t')
  }
})
