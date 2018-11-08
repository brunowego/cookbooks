# Engines

```sh
rails new [app] --api -d postgresql -T
cd [app]
```

```sh
rails plugin new [engine] --mountable --api -d postgresql -T
```

```sh
mkdir -p engines
mv [engine] engines
```

> Prefix all things inside the engine with the main app name. Ex.: app_engine
