import Vue from 'vue'
import { Plugin } from '@nuxt/types'
import { StravaganzaApi } from '~/api'
import { $api, initializeApi } from '~/utils/api-accessor'

declare module 'vue/types/vue' {
  interface Vue {
    $api: StravaganzaApi
  }
}

const accessor: Plugin = ({ $axios }) => {
  initializeApi($axios)
  Vue.prototype.$api = $api
}

export default accessor
