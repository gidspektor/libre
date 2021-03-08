import {inspectToken} from '../../tools'

export default async function authenticate ({ next, store }) {
  if (!Object.keys(store.state.selectedEvent).length) {
    return next({
      path: '/FindEvents'
    })
  }

  let tokenState = store.state.jwt ? inspectToken(store.state.jwt) : ''

  if (tokenState === 'refresh') {
    this.$store.dispatch('refreshToken')
  }

  return next()
}
