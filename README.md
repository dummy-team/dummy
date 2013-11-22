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
- grunt server
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

## Structure

- symling required components from js/\_bower\_components to js/components


# Release notes

- 0.1.0 :    First Sass & Coffe version of the Dummy
- 0.2.0 :    Reworked grid system : You can now use *class="column column-value"* in any wrapper to get your columns right
- 0.3.0 :    Vendors prefixe are now automatically added to the main.css file
- 0.4.0 :    The default grunt task now build coffeescript annotated sources
- 0.5.0 :    Sourcemapping for sass & coffescript files enabled
- 0.5.1 :    Improved documentation
- 0.6.0 :
  - Removed livereload script from html, you must use a browser extension listenning port 35729
  - Until generator is built, a gruntFile for typo3 has been added

# Road map

- 1.0.0 :
  - Create a clean index.html & move test page in an demo/example folder
- 1.0.1 : rewrite CoffeScript
- 1.0.2 : fix the doc task bug (breaking the chain of tasks)
- 1.1.1 : add a dynamic demo for grid system
- 2.0.0 : make it a generator whith dependencies and optionnal components
- 2.1.0 : custom Modernizr build

- Keep improving the grid system
- Full compatibility (livereloading) with *skinFlex* for *Typo3*


#Kown issues

- To build annotated sources for Sass files you need to run *grunt docco:buildSass*
- To build annotated sources for CoffeeScript files you need to run *grunt docco:buildCoffee*


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
    js
     └─ components
         └─ jquery.min.js
         └─ jquery.scrollTo.min.js
         └─ modernizr.js
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

