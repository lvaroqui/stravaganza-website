import { Module, VuexModule, Mutation, Action } from 'vuex-module-decorators'
import { User } from '~/api/api'
import { $api } from '~/utils/api-accessor'

@Module({
  name: 'user',
  stateFactory: true,
  namespaced: true
})
export default class UserModule extends VuexModule {
  user: User | null = null

  @Mutation
  updateUser(user: User) {
    this.user = user
  }

  @Action
  async fetchUser() {
    const user = await $api.getCurrentUser()
    this.context.commit('updateUser', user.data)
  }

  get isAuthenticated(): boolean {
    return this.user !== null
  }
}
