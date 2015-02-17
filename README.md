# Dummy

A light Sass &amp; coffee front-end base


# Usage

## CSS / SASS
- `config`: Most of the website constantes, font, colors, gutter...
- `layout`: The commun websites styles ( header/footer ) & template specific.
- `modules`: The components which can be used in any context
- `columns`: The grid system configuration

## Javascript / CoffeeScript
- `base`: A collection of JavaScript and jQuery helpers
- 'main': Website wide small chucks of scripts
- `components`: all external and generic scripts
- `htc`: Internet Explorer polyfill

# Features

## A Sass & coffee base
- A full css light column system
- A simple font sizing : 1.6em = 16px;
- A collection of variables to manage default sizing, fonts and colors
- A background-size fallback for Internet Explorer (It need an absolute url configuration in `mixins.css#L33`)
- A display-inline fallback for Internet Explorer
- A slice & content max width management and a fallback for Internet Explorer < 8
- Some jQuery plugins helpers ready to use

## Grunt to make your life easier

- Compile your `scss` files
- Prefixe your CSS
- Compile your CoffeScript files
- Serve your files & open the browser for you
- Sync and reload your modifications accross browsers
- Generate annotated sources using [groc](https://github.com/nevir/groc)
  - You'll need the pygments package installed – otherwise you'll get a `! Failed to highlight` error.
- Uglify your sources

# Coding guide

In order to keep team work efficient, and to smoothen going back on older code here's our coding guide. Some good practices are includes too.

## SCSS

```scss

  .selector { [position] [block] [inline] [decorations]
    &.classModifier {}
    @media {}

    .nestedSelector {}
  }
  // example
  .item {
    position: relative; display: block; margin: 0; border:1px; padding:0; width: 50%;
    font-size: 1.6em; font-weight: 400; background: #ddd;

    &:hover { background-color: #eee; }
    @media screen { width: 100%; }

    .nestedSelector { color: #222; font-weight: 100; }
  }
```
### Atomic design

Try to keep layout and modules aparts. Without going as far as design a complete [style guide](http://www.slideshare.net/stephenhay/style-guides-are-the-new-photoshop-fronteers-2012) try to keep in mind the concepts behind [atomic design](http://patternlab.io/about.html).

### Selectors

  - The selectors names use camelCasing.
  - You shouldn't use ID as they [weight too much](http://www.w3.org/TR/css3-selectors/#specificity) and may results in `!important` usage. As a workaround use `[id="selector"]` which have the same weight as a class selector.
  - Try to not go deeper than two or three nested selectors
  - Use shorthand declaration when needed but keep specific in modifiers.

### Ordering
Declarations are ordered by the impact they have on the flux:
  1. Position: `absolute/relative`, `left/right`, `float`...
  2. Sizing from outer to inner: `margin`, `border`, `padding`, `width`...
  4. Inline related properties: `font`, `text-indent`...
  5. Decorations: `background`, `text-transform`...

#### Splited line declaration
  When a line becomes too long split it between Block and Inline properies.


## CoffeeScript

### Base
Use the `base.coffee` to put some basics helpers used in `main.coffee` file

### Main
Use this file to put scripts used only once or on every pages. Don't use it to create slideshows or module like behavious. In this case create a external component.
