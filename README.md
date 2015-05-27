# Dummy

A light Sass &amp; Coffee front-end base

The purpose of this "framework" is to provide a consistent file structure with a normalized code and a collection of helpers and resets

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Inouit/dummy?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge)

# Features

## A Sass & coffee base
- A light column system (Deprecated, it will be rewritten into a more modern grid system)
- A simple font sizing : 1.6em = 16px
- A collection of variables to manage default sizing, fonts and colors
- A slice & content max width management
- Some jQuery plugins helpers ready to use

## Grunt to make your life easier

- Compiles your `scss` files
- Prefixes your css
- Compiles your CoffeeScript files
- Serves your files
- Lint your files:
  - [Scss](https://github.com/Inouit/dummy/blob/master/grunt/scss-lint.yml)
  - [CoffeeScript](https://github.com/Inouit/dummy/blob/master/grunt/coffee-lint.yml)
- Synchronizes and reloads your modifications across browsers
- [SassDoc](http://sassdoc.com/annotations/) friendly
- ([Codo](https://github.com/coffeedoc/codo)) friendly
