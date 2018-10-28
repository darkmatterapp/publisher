# Dark Matter : Publisher

An #indieweb personal publishing platform built in Ruby on Rails.

## Version

0.3.0

![Version 0.3.0](https://img.shields.io/badge/VERSION-0.3.0-green.svg)


## Development

[![Build Status](https://travis-ci.org/darkmatterapp/publisher.svg?branch=master)](https://travis-ci.org/darkmatterapp/publisher)
[![Code Climate](https://codeclimate.com/github/darkmatterapp/publisher/badges/gpa.svg)](https://codeclimate.com/github/darkmatterapp/publisher)

### tl;dr

[Strap your computer](https://macos-strap.herokuapp.com), first.

```
git clone https://github.com/darkmatterapp/publisher.git
cd publisher
./script/setup
./script/server
```


## Deploy to Heroku

Click this button to easily deploy to Heroku. (You must have a Heroku account.)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Scripts to Rule Them All

Dark Matter : Publisher uses the [Scripts to Rule Them All](https://githubengineering.com/scripts-to-rule-them-all) pattern.
See also: https://github.com/github/scripts-to-rule-them-all

`/script` is a collection of scripts for development on an OS X / macOS computer.
Development setup on a Windows or Linux computer will vary.

## Development Scripts

The rest of these instructions assume that you've [strapped your computer](https://macos-strap.herokuapp.com) already. If you haven't, you'll need to install somethings manually. (But really, you're better off using [Strap](https://osx-strap.herokuapp.com).)

- [Homebrew](https://brew.sh)
- Homebrew taps and extensions
- Xcode command line tools
- Postgres launchctl (for `setup` script)

### Bootstrap script

The `bootstrap` script is the first time development environment configuration for this app.
You should only need to run this script once.
It will install the proper Ruby and PostgreSQL database versions.

Clone this repo.

```
git clone https://github.com/darkmatterapp/publisher.git
cd publisher
```

Then run the `bootstrap` script.

```
./script/bootstrap
```

If that fails for you, [file an issue](https://github.com/darkmatterapp/publisher/issues)
with as much detail about your setup and any errors you got from the script.

### Setup script

After you've `bootstrap`ed, you'll need to `setup`.
The `setup` setups the Rails environment (creates, migrates and seeds databases, then clears logs and tmp).

```
./script/setup
```

### Server script

The `server` script starts the Rails server on port `3000`
(using **Foreman** which uses the `Procile` which uses **Puma**.)

```
./script/server
```

### Update script

Periodically, you can run the `update` script to check for new versions of dependencies and to update the database schema. If you ever get a `PendingMigrationError`, run this script to migrate your database.

```
./script/update
```

### Test script

Run the test suite using the `test` script.

```
./script/test
```

### Test server script

To run a process which runs tests on file change

```
./script/test_server
```

### Console script

If you need to use the app's console (in any environment), use the `console` script.

```
./script/console
```

If you need to use the console on a remote instance of the app, specific its Heroku app name as the first argument.

```
./script/console HEROKU_APP_NAME production
```

### CI Build script

Setup environment for CI to run tests. This is primarily designed to run on the continuous integration server.

```
./script/cibuild
```

### Database seed script

Drop the database, rebuild it, and fill it with seed data.

```
./script/seed
```


## Authors

- Shane Becker / [@veganstraightedge](https://github.com/veganstraightedge)
- Bookis Smuin / [@bookis](https://github.com/bookis)


## Contributing

See [CONTRIBUTING.md](https://github.com/darkmatterapp/publisher/blob/master/CONTRIBUTING.md).

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/darkmatterapp/publisher/issues).

## Code of Conduct

Everyone interacting in the Dark Matter project’s codebases, issue trackers, chat rooms, and mailing lists is expected to follow the
[Dark Matter code of conduct](https://github.com/darkmatterapp/publisher/blob/master/CODE_OF_CONDUCT.md).


## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. <br>
The ground you stand on is liberated territory.

In legal text, Dark Matter : Publisher is dedicated to the public domain
using Creative Commons -- CC0 1.0 Universal.

[http://creativecommons.org/publicdomain/zero/1.0](http://creativecommons.org/publicdomain/zero/1.0 "Creative Commons &mdash; CC0 1.0 Universal")

