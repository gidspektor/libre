import jwtDecode from 'jwt-decode'

export function sanitizeSearchString (string) {
  string = string.replace(/[^a-z'A-Z ]/, '').replace(/ /g, '-')
  string = string.replace(/^[^a-zA-Z]*|[^a-zA-Z]*$/gi, '')
  string = string.replace(/[/(){};:*]/g, '')

  return string
}

export function validateEmail (email) {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

  return re.test(String(email).toLowerCase())
}

export function formatDate (dateTime) {
  dateTime = dateTime.split('T')
  let timeOnly = dateTime[1].split(':')
  let day = dateTime[0].split('-', 3)[2]
  let month = dateTime[0].split('-', 3)[1]

  return timeOnly[0] + ':' + timeOnly[1] + ', ' + day + '/' + month
}

export function inspectToken () {
  let state = ''

  if (localStorage.getItem('t')) {
    const decoded = jwtDecode(localStorage.getItem('t'))

    const exp = parseFloat(decoded.exp)
    let iat = null

    if (Object.keys(decoded).includes('orig_at')) {
      iat = parseFloat(decoded.orig_iat)
    } else {
      iat = parseFloat(decoded.iat)
    }

    if (exp - (Date.now() / 1000) < 1800 && (Date.now() / 1000) - iat > 86400) {
      state = 'refresh'
    } else if (exp - (Date.now() / 1000) < 3600 && exp - (Date.now() / 1000) > 0) {
      state = 'active'
    } else {
      state = 'expired'
    }
  }

  return state
}

export function checkJwtActive () {
  let tokenState = inspectToken()

  if (tokenState === 'active') {
    return tokenState
  } else {
    console.log('redo')
    setTimeout(() => {
      this.checkJwtActive()
    }, 2000)
  }
}
