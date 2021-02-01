export function sanitizeString (string) {
  string = string.replace(/[^a-z'A-Z ]/, '').replace(/ /g, '-')
  string = string.replace(/^[^a-zA-Z]*|[^a-zA-Z]*$/gi, '')
  string = string.replace(/[/(){};:*]/g, '')
  return string
}

export function validateEmail (email) {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return re.test(String(email).toLowerCase())
}
