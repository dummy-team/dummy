# ![Dummy](https://raw.githubusercontent.com/Inouit/dummy/gh-pages/img/dummy.png)

A light Sass &amp; Coffee front-end base

The purpose of the dummy is to provide a consistent file structure with a normalized code and a collection of helpers and resets. It wraps [ITCSS](http://itcss.io/) principles with a powerful automation system.

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Inouit/dummy?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge)

# Features

## A Sass & coffee base
- It follows [ITCSS](https://www.youtube.com/watch?v=1OKZOV-iLj4) concepts
- A simple font sizing : 1.6em = 16px
- A collection of variables to manage default sizing, fonts and colors
- A slice & content max width management
- Some jQuery plugins helpers ready to import

## Grunt to make your life easier

- Compiles your `*.scss` files
- Prefixes your css
- Compiles your CoffeeScript files
- Serves your files
- Lint your files:
  - [Scss](https://github.com/Inouit/dummy/blob/master/grunt/.scss-lint.yml)
  - [CoffeeScript](https://github.com/Inouit/dummy/blob/master/grunt/coffeelint.json)
- Synchronizes and reloads your modifications across browsers (many images added at once may cause performance issues)
- [SassDoc](http://sassdoc.com/annotations/) friendly
- ([Codo](https://github.com/coffeedoc/codo)) friendly

# Usage
  First, ensure that you have the latest [Node.js](http://nodejs.org/) and [npm](http://npmjs.org/) installed. [scss-lint](https://github.com/brigade/scss-lint#requirements) requires a gem from ruby.

  Test that Grunt's CLI is installed by running `grunt --version`.  If the command isn't found, run `npm install -g grunt-cli`.  For more information about installing Grunt, see the [getting started guide](http://gruntjs.com/getting-started).


## Plug and play
### Plug
1. Download [latest release](https://github.com/Inouit/dummy/releases)
- Go to the `grunt` subfolder
- Run `npm install` to install all dependencies
 installed
- To build `css` and`js` run `grunt build`

```shell
curl -L https://github.com/Inouit/dummy/archive/master.tar.gz | tar zx && cd ./dummy-master/grunt && npm install && grunt build && grunt
```

### Play
1. Edit [`browserSync.coffee`](https://github.com/Inouit/dummy/blob/master/grunt/tasks/options/browserSync.coffee) task to your need (server or proxy and files path).
- To start working and serving files run `grunt` inside `grunt` folder
- Browser-sync will prompt the server url (`localhost:3000`)
- You can now edit `*.scss` & `*.coffee` files, `*.css` & `*.js` will be overwritten

## Customize tasks
The grunt tasks and file structure should work in most use cases. You may still need to do some changes, from file location to new grunt tasks.  

### Source folders
  To ease the integration process, the [parameters](https://github.com/Inouit/dummy/blob/master/grunt/parameters.coffee) allow to add files to the watched files, refine few options and change source and destination paths. Options found in the `parameters_local.coffee` will override defaults.

### Add grunt tasks
  We use a module based structure for our grunt tasks, so it should be easy to edit any existing task. All task configurations stored in the [options folder](https://github.com/Inouit/dummy/tree/master/grunt/tasks/options). are loaded in the grunt file. Grunt task alias are in the [tasks folder](https://github.com/Inouit/dummy/tree/master/grunt/tasks).

  To get farther into the mind behind this, checkout [Diviser pour mieux grunter (fr)](https://medium.com/dev-notes/diviser-pour-mieux-grunter-a745f41e1a32).

# Keep in touch

If find any caveats using it or have suggestions to improve the tool we gladly accept [Pull Requests](https://github.com/Inouit/dummy/tree/master/CONTRIBUTING.md#submitting-a-pull-request) and [issues](https://github.com/Inouit/dummy/issues).

# Thanks
Thanks to Stéphanie who crafted such a nice logo !
