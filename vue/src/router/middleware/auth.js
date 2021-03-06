export default function authenticate ({ next, store }) {
  store.dispatch('inspectToken')
  if (!store.state.jwt || !store.state.selectedEvent) {
    return next({
      path: '/'
    })
  }
  return next()
}
