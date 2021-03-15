import {inspectToken} from '../../tools'

export default async function eventAuthenticate ({ next, store }) {
  if (!Object.keys(store.state.selectedEvent).length) {
    return next({
      path: '/FindEvents'
    })
  }

  let tokenState = store.state.jwt ? inspectToken(store.state.jwt) : ''

  if (tokenState === 'refresh') {
    this.$store.dispatch('refreshToken')
  } else if (tokenState === 'expired' || !tokenState) {
    return next({
      path: '/Login'
    })
  }

  return next()
}