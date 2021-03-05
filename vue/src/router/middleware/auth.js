export default function authenticate ({ next, store }) {
  if (!store.state.jwt || !store.state.selectedEvent) {
    return next({
      path: '/'
    })
  }
  return next()
}
