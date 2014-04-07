# Dummy

A light Sass &amp; coffee front-end base


# Usage

## CSS / SASS
- `layout`: The commun websites styles ( header/footer ) & template specific.
- `modules`: The components which can be used in any context
- `columns`: The grid system configuration

## Javascript / CoffeeScript
- `base`: A collection of JavaScript and jQuery helpers
- 'main': Website wide small chucks of scripts
- `components`: all external and generic scripts
- `htc`: Internet Explorer polyfill


Go check the Yeoman's [generator](https://github.com/Inouit/generator-dummy) !

# Features

## A Sass & coffee base
- A full css light grid system
- A simple font sizing : 1.6em = 16px;
- An unit based margin & padding system
- A collection of variables to manage default sizing, fonts and colors
- A background-size fallback for Internet Explorer (It need an absolute url configuration in `mixins.css#L33`)
- A display-inline fallback for Internet Explorer
- A slice & content max width management and a fallback for Internet Explorer < 8
- Some jQuery plugins helpers ready to use

## Grunt to make your life easier

- Compile your Scss files
- Prefixe your CSS
- Compile your CoffeScript files
- Serve your files & open the browser for you
- Live reload your modifications
- Generate annotated sources using [groc](https://github.com/nevir/groc)
  - You'll need the pygments package installed – otherwise you'll get a ! Failed to highlight error.
- Uglify your sources