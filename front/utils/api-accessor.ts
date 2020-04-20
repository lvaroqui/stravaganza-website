import { NuxtAxiosInstance } from '@nuxtjs/axios'
import { StravaganzaApi, Configuration } from '~/api'

// eslint-disable-next-line import/no-mutable-exports
let $api: StravaganzaApi

export function initializeApi(axiosInstance: NuxtAxiosInstance) {
  $api = new StravaganzaApi(
    new Configuration(),
    'http://localhost:3100',
    axiosInstance
  )
}

export { $api }
