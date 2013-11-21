dummy
=====

A light Sass &amp; coffee front-end base


# Usage

- Clone
- remove .git folder
- add *node_modules* & *\_bower\_components* folders to project .gitignore
- run *npm install && bower install*
- move needed minified components from *\_bower\_components* to *components*
  - jQuery & Modernizr are needed
- grunt server
- work

# To discuss

## CSS
- mediaqueries in a separate file / inline in the main sheet
- usage of size unit ($u) : function(value) / value*$u

# Road map
- 0.3.0 : add autoprefix
- 1.0.0 : create a clean index.html & move test page in an demo/example folder
- 1.1.0 : auto docs sass & coffeescript
- 1.1.1 : add a dynamic demo for grid system
- 2.0.0 : make it a generator whith dependencies and optionnal components
- 2.1.0 : custom Modernizr build


# tree

_generated files*_

    css
     └─ src
         └─ columns.scss
         └─ config.scss
         └─ functions.scss
         └─ mixins.scss
         └─ ie.scss
         └─ main.scss
         └─ mediaqueries.scss
         └─ powermail.scss
         └─ reset.scss
         └─ styles.scss
     └─ ie.css*
     └─ main.css*
     └─ rte.css
    docs
    img
    js
     └─ components
     └─ htc
         └─ backgroundsize.min.htc
     └─ src
         └─ base.coffee
         └─ min.coffee
     └─ main.js*
    index.html
    bower.json
    gruntfile.coffee
    package.josn
    LICENCE
    README.md
    .bowerrc
    .editorconfig
    .gitignore
