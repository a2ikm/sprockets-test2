[![Build Status](https://travis-ci.org/a2ikm/sprockets-test2.svg?branch=master)](https://travis-ci.org/a2ikm/sprockets-test2)

# sprockets-test2

This is a tiny project to reproduce https://github.com/rails/sprockets/issues/600.

In this test case, `view.coffee` requires `template.jst.eco`.


## How to run test

On your machine, run this rake task to install gems and run tests for each sprockets 3.7 and 4.0.

```console
$ bundle exec rake test:all
```

If you want to run them only for sprockets 3.7, run this command.

```console
$ bundle exec rake test:sprockets_37
```

If only for 4.0, run this command.

```console
$ bundle exec rake test:sprockets_40
```
