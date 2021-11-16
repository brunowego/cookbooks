# Next.js

<!--
https://courses.leighhalliday.com/next-level-next-js

https://www.youtube.com/watch?v=_VuGmykVgTg

https://fireship.io/courses/react-next-firebase/deploy-firebase/

https://www.youtube.com/watch?v=S1oOlKQo8CY
https://www.freecodecamp.org/news/how-to-use-feature-toggles-in-next-js-and-react/
-->

## Links

- [Code Repository](https://github.com/vercel/next.js)
- [Main Website](https://nextjs.org/)
- [Awesome Next.js](https://github.com/unicodeveloper/awesome-nextjs)

## Utils

- [Boilerplate and Starter for Next JS 12+, Tailwind CSS 2.0 and TypeScript](https://github.com/ixartz/Next-js-Boilerplate)

## Guides

- [Start developing websites like it's 2025.](https://react2025.com/#course-overview)
- [Mastering Next.js](https://masteringnextjs.com/)

## Books

- [Build a SaaS with React and Next.js](https://www.cutintothejamstack.com/)

## Technologies

<!-- - Client-Side Rendering (CSR) -->
- Incremental Static Regeneration (ISR)
- Server-Side Rendering (SSR)
- Static Site Generation (SSG)

<!--
Examples

https://github.com/Expensify/App
https://github.com/dwarvesf/nextjs-boilerplate
https://github.com/vercel/virtual-event-starter-kit
https://github.com/plutomi/plutomi
https://github.com/basetool-io/basetool
https://github.com/ljtechdotca/next-reddit
https://github.com/ioofy/App
https://github.com/axeldelafosse/expo-next-monorepo-example
https://github.com/diego3g/umbriel
https://umbriel-dashboard-three.vercel.app/
https://github.com/fdaciuk/conduit-api
https://github.com/waptik/vvu-fleet-management-system
https://github.com/nohsangwoo/instaclone-backend-v3
https://github.com/Rowan-Paul/project-argus
https://github.com/myriadsocial/myriad-web
https://github.com/email2vimalraj/food-pos-app
https://github.com/jackmerrill/snacc.chat
https://github.com/calendso/calendso/
-->

## CLI

### Installation

#### NPM

```sh
npm install next@12.0.0
```

### Commands

```sh
npx next -h
```

### Configuration

```sh
# Git Ignore
cat << EOF > ./.gitignore
/.next
/node_modules
/.env
EOF

#
touch .example.env
```

### Bootstrap

```sh
#
npx -y create-next-app@latest [app-name] --ts

#
mkdir -p {components,hooks,lib}
```

### Configuration

```sh
#
npx next telemetry status

#
npx next telemetry disable
```

### Usage

```sh
#
npx next dev -p 3000
PORT=3000 npx next dev
npm run dev

#
npx next lint

#
npx next build
```

### Tips

#### Next.js Export

```sh
#
npx next export

#
echo '/out' >> ./.gitignore
```
