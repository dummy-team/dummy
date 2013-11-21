dummy
=====

A light Sass &amp; coffee front-end base


# Usage

- Clone
- remove .git folder
- add *node_modules* & *_bower_components* folders to project .gitignore
- run [code]npm install && bower install[/code]
- move needed minified components from *_bower_components* to *components*
  - jQuery & Modernizr are needed
- grunt server
- work

# To discuss

## CSS File organisation
- mediaqueries in a separate file / inline in the main sheet


# Road map
- add autoprefix
- auto docs sass & coffeescript
- add a dinamyc demo for grid system
- make it a generator whith dependencies and optionnal components
- custom Modernizr build


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
