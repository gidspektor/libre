import {inspectToken} from '../../tools'

export default async function accountAuthenticate ({ next, store }) {
  let tokenState = inspectToken()

  if (tokenState === 'refresh') {
    this.$store.dispatch('refreshToken')
  } else if (tokenState === 'expired' || !tokenState) {
    return next({
      path: '/Login'
    })
  }

  return next()
}
