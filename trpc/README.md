# TypeScript Remote Procedure Call (tRPC)

<!--
https://github.com/BeBoRE/ei-noah-bot

https://github.com/search?q=path%3Apackage.json+content%3Atrpc+content%3Anext&type=code

https://github.com/openstatusHQ/openstatus
https://github.com/hearkus/hearkus/tree/trunk/packages/trpc-router
https://github.com/echobind/bisonapp
https://github.com/juliusmarminge/acme-corp/tree/main
-->

## Links

- [Code Repository](https://github.com/trpc/trpc)
- [Main Website](https://trpc.io)
- Docs
  - [Usage with Next.js](https://trpc.io/docs/nextjs)

## Docs

- [Learn With Jason / Let's Learn tRPC!](https://learnwithjason.dev/let-s-learn-trpc)

## Tips

### cURL Request

TODO

<!--
http://localhost:4000/trpc/hello?batch=1&input={"0":{"name":"Bruno"}}
-->

<!--
curl --json '{"procedure": "getTarefas"}' http://localhost:3000/trpc

curl --json '{"procedure": "getTarefa", "args": 1}' http://localhost:3000/trpc

curl --json '{"procedure": "updateTarefa", "args": {"id": 1, "title": "Novo título"}}' http://localhost:3000/trpc

curl --json '{"procedure": "addTarefa", "args": "Nova tarefa"}' http://localhost:3000/trpc

curl --json '{"procedure": "deleteTarefa", "args": 4}' http://localhost:3000/trpc
-->
