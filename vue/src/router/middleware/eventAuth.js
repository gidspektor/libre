import {inspectToken} from '../../tools'

export default async function eventAuthenticate ({ next, store }) {
  if (!store.state.selectedEvent || !Object.keys(store.state.selectedEvent).length) {
    return next({
      path: '/FindEvents'
    })
  }

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
