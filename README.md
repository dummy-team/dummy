dummy
=====

A light Sass &amp; coffee front-end base


# Usage

- Clone
- remove .git folder
- add *node_modules*, *.sass-cache* & *\_bower\_components* folders to project .gitignore
- run *npm install && bower install*
- move needed minified components from *\_bower\_components* to *components*
  - jQuery, Modernizr & scrollTo are needed
- run *grunt server*
- work

# Features

- A full css light grid system (/docs/sass/annotated-source/columns.html)
- A simple font sizing : 1.6em = 16px;
- An unit based margin & padding system
- A collection of variables to manage default sizing, fonts and colors
- A background-size fallback for Internet Explorer
- Some jQuery plugins helpers ready to use
- A watch task to compile CoffeeScripts & Sass
- Autoprefixer for css
- Live reloading
- A task to generate annotated sources fo Sass & CoffeScript files


# To discuss

## CSS

- mediaqueries in a separate file / inline in the main sheet
- usage of size unit ($u) : function(value) / value*$u
- gutter multiple of $ u
- use .column + .column to handle margins in grid

## HTML

- Use of templates ?

## Structure

- symling required components from js/\_bower\_components to js/components : add to generator ?
- lint files / check for code syntax conventions
- ignore doccumentation ?

## Tasks

- Add a task checking git freshness before running any task. (grunt-git ?)

# Release notes

- 0.8.0 :
  - Changed server task to serve (best practice)
  - Switched default port to 0 to enable simple multiple server running simultaneously
- 0.7.0 :    Documentation build is now automated
- 0.6.1 :    Moved examples from index.html to demo/index.html
- 0.6.0 :
  - Removed livereload script from html, you must use a browser extension listenning port 35729
  - Until generator is built, a gruntFile for typo3 has been added
- 0.5.1 :    Improved documentation
- 0.5.0 :    Sourcemapping for sass & coffescript files enabled
- 0.3.0 :    Vendors prefixe are now automatically added to the main.css file
- 0.4.0 :    The default grunt task now build coffeescript annotated sources
- 0.2.0 :    Reworked grid system : You can now use *class="column column-value"* in any wrapper to get your columns right
- 0.1.0 :    First Sass & Coffe version of the Dummy

# Road map

- before 1.0.0 : solve discussions questions and implement them
- 1.0.1 : rewrite CoffeScript
- 1.1.0 : add a dynamic demo for grid system
- 1.3.0 : prepare for testing
- 1.4.0 : Add imagemin to handle optimization
- 2.0.0 : make it a generator with dependencies and optionnal components
- 2.1.0 : custom Modernizr build

- Write Inouit's coding guidelines.
- Keep improving the grid system
- Full compatibility (livereloading) with *skinFlex* for *Typo3*
- Add grunt-notify https://github.com/dylang/grunt-notify


#Kown issues

- *docco* tasks don't chain.


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
     └─ ie.map.css*
     └─ main.css*
     └─ main.map.css*
     └─ rte.css
    docs
     └─ assets
         └─ custom.css
     └─ coffee
         └─ annotated-source
     └─ sass
         └─ annotated-source
    js
     └─ components
     └─ htc
         └─ backgroundsize.min.htc
     └─ src
         └─ base.coffee
         └─ main.coffee
     └─ base.js*
     └─ main.js*
    index.html
    bower.json
    gruntfile.coffee
    gruntfile_typo3.coffee
    package.json
    LICENCE
    README.md
    .bowerrc
    .editorconfig
    .gitignore

# Dependencies

The build and serve tasks use the plugin *grunt-contrib-sass*, it requires you to have *Ruby* and *Sass* installed.
The sourcemap generator requires *Sass 3.3.0*, which can be installed with *gem install sass --pre*

