# Geolocation

TODO

<!-- apps/web/src/app/contexts/geolocation-permission.ts -->

<!--
```ts
import { createContext } from 'react'

type GeolocationPermissionContext = {
  geolocationPermission: PermissionState
}

const GeolocationPermissionContext =
  createContext<GeolocationPermissionContext>({
    geolocationPermission: 'prompt',
  })

export default GeolocationPermissionContext
``` -->

<!-- apps/web/src/app/providers/geolocation-permission.tsx -->

<!-- ```tsx
'use client'

import { type ReactNode, useEffect } from 'react'

import useQueryPermission from '@/hooks/use-query-permission'

import GeolocationPermissionContext from '../contexts/geolocation-permission'

type GeolocationPermissionProviderProps = {
  children: ReactNode
}

const name = 'geolocation' as const

export default function GeolocationPermissionProvider({
  children,
}: GeolocationPermissionProviderProps) {
  const { state, isLoading } = useQueryPermission({ name })
  // const { setCountryState } = useCountryState()

  useEffect(() => {
    if (state === 'prompt') {
      navigator.geolocation.getCurrentPosition(
        ({ coords }) => {
          console.log(coords)

          // setCountryState('go')

          // Successfully obtained geolocation
          // TODO: Detect what is the Brazilian state of the user
          // TODO: Save the state on the context
        },
        (error) => {
          console.error('Error obtaining geolocation:', error)
        },
      )
    }
  }, [state])

  if (isLoading) {
    return null
  }

  return (
    <GeolocationPermissionContext.Provider
      value={{ geolocationPermission: state }}
    >
      {children}
    </GeolocationPermissionContext.Provider>
  )
}
``` -->
