# Phoenix101

Getting Started Phoenix with TDD.

## Usage

- Clone this repository

```
$ git clone https://github.com/shufo/phoenix_101
```

- Install dependencies

```bash
mix deps.get
cd assets && npm install && node node_modules/brunch/bin/brunch build
```

- migration

```
mix ecto.create
mix ecto.migrate
```

- run up the server

```
mix phx.server
```

- Write the modules to pass the tests

```
$ mix test
```

- Pull Request the your code

- Test results is shown in here

https://travis-ci.org/shufo/phoenix_101
