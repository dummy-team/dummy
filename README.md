# ![Dummy](https://raw.githubusercontent.com/dummy-team/dummy/gh-pages/img/dummy.png)

## Solid foundations for modern development
_Sass, Javascript & automation_

The purpose of the dummy is to provide a consistent file structure with a normalized code and a collection of helpers and resets ([_Components served separately_](https://github.com/dummy-team/dummy-toolkit)). It wraps [ITCSS](http://itcss.io/) principles with a powerful automation system.

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dummy-team/dummy?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge)

# Features

## Pug as templating system
- Use layouts and partials to power your static websites

## A Sass & Javascript structure
- It follows [ITCSS](https://www.youtube.com/watch?v=1OKZOV-iLj4) concepts
- A simple font sizing : 1.6em = 16px
- A collection of variables to manage default sizing, fonts and colors

## Gulp to make your life easier
- Compiles your `*.pug` pages
- Compiles your `*.sass` files
- Prefixes your css
- Bundles your `*.js` files with [browserify](http://browserify.org/) and [Babeljs](http://babeljs.io)
- Minify css and uglify js
- Serves your files
- Synchronizes and reloads your modifications across browsers

# Usage
  First, ensure that you have the latest [Node.js](http://nodejs.org/) and [npm](http://npmjs.org/) installed.


## Plug and play
### Plug
#### Yo Dummies!
Scaffold a dummy with the yeoman generator:

1. Install [Yeoman](http://yeoman.io/), [yarn](https://yarnpkg.com/fr/) && [generator-dummies](https://github.com/dummy-team/generator-dummies)
- Go to your project folder, then run: `yo dummies`
- You can now import components from [dummy-toolkit](https://github.com/dummy-team/dummy-toolkit) with `yo dummies:toolkit`

#### Manual installation
Get it from github:

1. Download [latest release](https://github.com/dummy-team/dummy/releases)
- Run `npm install` to install all dependencies
- To build `pug`, `sass` and`js` run `gulp build`

```shell
curl -L https://github.com/dummy-team/dummy/archive/master.tar.gz | tar zx && cd ./dummy-master/ && npm i && gulp
```

### Play

1. To start working and serving files run `gulp`
- Browser-sync will prompt the server url (`localhost:3000`)
- You can now edit `*.pug`, `*.sass` & `*.js` files, `*.html`, `*.css`, `*.js` and assets will be overwritten

# Keep in touch

If you find any caveats using it or have suggestions to improve the tool we gladly accept [Pull Requests](https://github.com/dummy-team/dummy/tree/master/CONTRIBUTING.md#submitting-a-pull-request) and [issues](https://github.com/dummy-team/dummy/issues).

# Thanks
Thanks to Stéphanie Dragon who crafted such a nice logo !
