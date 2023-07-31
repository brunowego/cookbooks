<!--
main.ts
import type { StorybookConfig } from '@storybook/react-vite'

const config: StorybookConfig = {
  stories: ['../src/stories/**/*.mdx', '../src/components/**/*.stories.tsx'],
  addons: [
    '@storybook/addon-essentials',
    {
      name: '@storybook/addon-styling',
      options: {},
    },
  ],
}

export default config
-->

<!--
globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  body {
    @apply dark:bg-black dark:text-white;
  }
}
-->

<!--
preview.ts
import '../src/styles/globals.css'
import type { Decorator, Parameters } from '@storybook/react'
import { withThemeByDataAttribute } from '@storybook/addon-styling'

export const decorators = [
  withThemeByDataAttribute({
    themes: {
      light: 'light',
      dark: 'dark',
    },
    defaultTheme: 'light',
    attributeName: 'data-mode',
  }) as Decorator,
]

export const parameters: Parameters = {
  parameters: {
    actions: { argTypesRegex: '^on[A-Z].*' },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/,
      },
    },
  },
}

export const globalTypes = {
  darkMode: true,
  className: {},
}

// export const preview: Preview = {
//   globalTypes: {
//     darkMode: {
//       defaultValue: true,
//     },
//     className: {
//       defaultValue: 'custom-classname',
//     },
//   },
// }
-->

<!--
postcss.config.cjs
const { join } = require('path')

/**
 * @type { import('postcss').ProcessOptions }
 */
const postcssConfig = {
  plugins: {
    tailwindcss: {
      config: join(__dirname, 'tailwind.config.ts'),
    },
    autoprefixer: {},
  },
}

module.exports = postcssConfig
-->

<!--
tailwind.config.ts
import tailwindPreset from '@splendal/config/tailwind-preset'
import type { Config } from 'tailwindcss'

export default {
  presets: [tailwindPreset],
  content: tailwindPreset.content,
  theme: {
    fontFamily: {
      sans: ['var(--font-poppins)'],
    },
    container: {
      center: true,
      padding: '1.5rem',
    },
  },
} satisfies Config
-->
