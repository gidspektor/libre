export default async function authenticate ({ next, store }) {
  if (!Object.keys(store.state.selectedEvent).length) {
    return next({
      path: '/FindEvents'
    })
  }
  return next()
}
