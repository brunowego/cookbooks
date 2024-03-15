# React

<!--
https://github.com/alan2207/bulletproof-react

Redux
Redux-Saga

https://linkedin.com/learning/paths/improve-your-react-skills
https://linkedin.com/learning/paths/become-a-react-developer

https://thoughtbot.com/blog/using-redux-with-react-hooks

https://linkedin.com/learning/react-state-management/choosing-the-right-state-management-solution
https://app.pluralsight.com/library/courses/using-react-hooks/table-of-contents
https://linkedin.com/learning/react-hooks/understanding-modern-react
https://app.pluralsight.com/library/courses/reactjs-apps-docker-developing/table-of-contents
https://app.pluralsight.com/library/courses/react-framework-choosing/table-of-contents
https://app.pluralsight.com/paths/skills/building-web-applications-with-react
https://app.pluralsight.com/library/courses/react-apps-typescript-building/table-of-contents
https://app.pluralsight.com/library/courses/react-calling-apis/table-of-contents
https://app.pluralsight.com/guides/generating-dynamic-forms-from-json-in-react
https://app.pluralsight.com/library/courses/js-friends-session-05/table-of-contents
https://app.pluralsight.com/library/courses/js-friends-session-03/table-of-contents
https://www.youtube.com/watch?v=fxY1q4SCB64
https://www.youtube.com/watch?v=ontX4zfVqK8
https://leanpub.com/the-road-to-learn-react/

https://www.youtube.com/watch?v=I6ypD7qv3Z8

https://www.youtube.com/watch?v=gnkrDse9QKc

https://app.pluralsight.com/paths/skill/building-web-applications-with-react

https://github.com/ilkeraltin/react-spa-news

https://linkedin.com/learning/react-securing-applications-2/securing-react-applications
https://linkedin.com/learning/react-js-essential-training/welcome
https://linkedin.com/learning/learning-react-js-5/getting-started-with-react
https://linkedin.com/learning/react-testing-and-debugging/testing-and-debugging-your-react-apps
https://linkedin.com/learning/build-a-react-application-using-aws-amplify/react-and-aws-a-perfect-serverless-match
https://linkedin.com/learning/react-cloud-powered-apps-with-firebase/structuring-your-apps-for-the-cloud
https://linkedin.com/learning/building-modern-projects-with-react/react-going-from-good-to-great
-->

<!--
## Favorite Libraries

https://www.npmjs.com/package/mini-create-react-context
https://www.npmjs.com/package/ramda
https://www.npmjs.com/package/tiny-invariant
https://www.npmjs.com/package/react-is
https://www.npmjs.com/package/classnames
https://www.npmjs.com/package/resolve-pathname
https://www.npmjs.com/package/value-equal
https://www.npmjs.com/package/history
https://www.npmjs.com/package/decimal.js-light
https://www.npmjs.com/package/lodash
https://www.npmjs.com/package/react-lifecycles-compat
https://www.npmjs.com/package/hoist-non-react-statics
https://www.npmjs.com/package/rc-util
https://www.npmjs.com/package/react-ga
https://www.npmjs.com/package/gud
https://www.npmjs.com/package/symbol-observable
https://www.npmjs.com/package/reselect
https://www.npmjs.com/package/object-assign
https://www.npmjs.com/package/rc-calendar
https://www.npmjs.com/package/scheduler
https://www.npmjs.com/package/regenerator-runtime
https://www.npmjs.com/package/tinycolor2
https://www.npmjs.com/package/rc-drawer
https://www.npmjs.com/package/omit

https://avvvatars.com/
-->

## Tools

- [React Developer Tools (Google Chrome)](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
- [React Developer Tools (Mozilla Firefox)](https://addons.mozilla.org/pt-BR/firefox/addon/react-devtools/)
- [React - CodeSandbox](https://react.new)

## Terms

- React Server Components (RSC)

## Tips

### Visual Studio Code

```sh
#
code --install-extension dsznajder.es7-react-js-snippets

#
jq '."recommendations" += ["dsznajder.es7-react-js-snippets"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!--
rafce
-->

## Issues

### TBD

```log
Type error: Type '{ children: ReactNode; }' has no properties in common with type 'IntrinsicAttributes'.
```

TODO

### Missing JSX Provider

```log
Cannot use JSX unless the '--jsx' flag is provided
```

Check `./tsconfig.json` if `include` is set to `["src"]`.

<!-- **Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    "jsx": "react"
  }
}
``` -->

### Missing Use Effect

```log
Warning: Cannot update a component (`I18nProvider`) while rendering a different component (`LanguageProvider`). To locate the bad setState() call inside `LanguageProvider`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render
```

```tsx
import { useEffect } from 'react'

export function LanguageProvider() {
  useEffect(() => {
    // ...
  }, [])

  // ...
}
```

### TBD

```log
Warning: Encountered two children with the same key, ``. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.
```

### Encountered Two Children with the Same Key

```log
This JSX tag's 'children' prop expects a single child of type 'ReactChildren', but multiple children were provided. ts(2746)
```

Solution [here](https://sentry.io/answers/defining-proper-key-in-props/).

### TBD

```log
TypeError: Cannot read property 'map' of undefined
```

TODO

### TBD

```log
Warning: Cannot update a component (`Router`) while rendering a different component (`GoBack`). To locate the bad setState() call inside `GoBack`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render
```

TODO
