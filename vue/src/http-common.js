import axios from 'axios'

export default axios.create({
  baseURL: 'http://127.0.0.1:8000/api/',
  headers: {
    'X-Requested-With': 'XMLHttpRequest',
    'Authorization': 'Bearer ' + localStorage.getItem('t')
  }
})
