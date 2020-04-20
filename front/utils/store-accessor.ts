import { Store } from 'vuex'
import { getModule } from 'vuex-module-decorators'
import user from '~/store/user'

// eslint-disable-next-line import/no-mutable-exports
let userStore: user

function initialiseStores(store: Store<any>): void {
  userStore = getModule(user, store)
}

export { initialiseStores, userStore }
