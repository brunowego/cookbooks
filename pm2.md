# Process Manager 2 (PM2)

## CLI

### Installation

#### NPM

```sh
npm install pm2

# globally
npm install pm2 -g
```

### Commands

```sh
pm2 -h
```

### Usage

```sh
# Running app
pm2 start app.js

#
pm2 start api.js -i [process]

# List running apps
pm2 list

#
pm2 stop [app_name]
pm2 restart [app_name]
pm2 delete [app_name]

# View details
pm2 describe [app_name]

# Monitoring
pm2 monit

#
pm2 reload all --update-env

#
pm2 logs
pm2 logs [app_name]
pm2 logs --json
pm2 logs --format

#
pm2 flush

#
pm2 reloadLogs

#
pm2 startup
pm2 save
pm2 unstartup

#
pm2 install [module_name]

#
pm2 update

#
pm2 reset [app_name]

#
pm2 scale [app_name] 10

#
pm2 save

#
pm2 resurrect

#
pm2 generate
```
