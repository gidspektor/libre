export default async function postAuthenticate ({ next, store }) {
  if (!store.state.selectedPost || !Object.keys(store.state.selectedPost).length) {
    return next({
      path: '/Collaborate'
    })
  }

  return next()
}
