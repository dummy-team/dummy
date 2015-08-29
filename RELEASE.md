# Release notes

##v5

- **5.0.0**
  - ITCSS ready
  - Add visual identity to the dummy (thanks to Stéphanie)
  - Parameter configuration added to  Grunt 
  - Grunt task improvements

##v4

- **4.5.6**
  - Add usage help
  - Add contributing guide

- **4.5.5**
  - Remove useless livereload option from watch task

- **4.5.4**
  - Add images to browser sync

- **4.5.3**
  - Fix .editorconfig syntax

- **4.5.2**
  - Use $text-color instead of $black in globals

- **4.5.1**
  - Remove old livereload

- **4.5**
  - Replaced coffeeify with browserify

- **4.4**
  - A better smoothAnchor plugin
  - A better fixToTop plugin

- **4.3**
  - Upgraded grunt-browser-sync
  - Fixed favicon
  - Replaced autoprefixer task with postcss
  - Placed `min-width` & `min-height` in `PropertySortOrder` of sccs-lint
  - Renamed `_helpers.scss` `_placeholders.scss`
  - Updated coffeelint configuration and sources accordingly

- **4.2.1**
  - Fixed headings extends
  - Added `$text-color` scss variable
  - Moved `%input` placeholder to helpers
  - Moved `body` `font-family` definition to globals
  - Placed `box-sizing` in `PropertySortOrder` of sccs-lint

- **4.2**
  - Splits jquery helpers into components

- **4.1.2**
  - Cleaned BrowserSync tasks
  - Fixed Source mapping for Sass & CoffeeScript
  - Browserify CoffeeScript sources

- **4.1.0**
  Documentation, form styles and minor rewrite
  - Commented Scss
  - Added form styling
  - Previous mixins are now placeholders

- **4.0.0**
  Complete rewrite of Dummy
  - Dropped old browser support (2 version back)
  - Follow the new [guidelines](https://github.com/Inouit/dummy/blob/master/README.md)
  - `modules.scss` is now split under `components`
  - Scss comments follow Sassdoc syntax
  - Coffeescript files comment follow Codo syntax
  - Compiled files are no longer versioned
  - Cleaned Sass mixins

##v3
- **3.0.2**:
  - Grunt registerTasks
  - CSS declaration in duplicate for h*-like

- **3.0.1**:
  - Improved build and watch tasks

- **3.0.0**:
  - A brand new column system !
  - BrowserSync now replace livereload
  - Improved build and watch tasks

##v2
- **2.0.0-beta.3**:
    - Various fixes
- **2.0.0-beta.2**:
    - The npm dependencies are now setted to get the latest version available
    - Various fixes
- **2.0.0-beta.1**:
    - Updated grunt-groc dependencie to use the Plou/grunt-groc and Plou/groc modules
- **2.0.0-alpha.1**:
    - Warning! The groc plugin isn't compatible yet, the pull request nevir/groc#157 is pending. See #9 for further details You can edit the grunt-groc sources meanwhile.
    - Fix #10 : The column class isn't needed anymore
    - Removed groc documentation generation on watch task, remember to run the build task before commit the doc
- **2.0.0-alpha.0**:
    - Warning! The groc plugin isn't compatible yet, the pull request nevir/groc#157 is pending. See #9 for further details You can edit the grunt-groc sources meanwhile.
    - Replaced docco with groc
    - Reworked Sass structure
    - A **full rewrite** of the grunt tasks and bower files location
      - Added cssmin
      - Added uglify tasks
      - Moved all grunt related files into the grunt folder
      - moved bower configuration with grunt
      - Improvements in the port managment

    The structure and most of the tasks comes from **[@Gregcop1](https://github.com/Gregcop1)**

## v1
- **1.1.0**:
    - Cleanned html files
    - A more consistent content and base style in demo and landing page
    - Added a slice managing base code
    - Updated bower dependencies versions
    - bug fixes

- **1.0.0**:
    - Reworked column system, column mixin added
    - Added support of inline-block for ie7
    - Added print.scss to handle print layout

## Beta

- **0.11.1**: Added step classes to fixToTop jquery plugin
- **0.11.0**: Transfered repository ownership to Inouit organisation
- **0.10.1**:
    - Added grunt configuration to enable stand alone use
    - Removed compiled javascript files from gitignore to keep compatibility with generator-dummies
- **0.10.0**:
    - A slice & content max width management improved ( ie8 fallback)

## Alpha
- **0.9.0**: *Dummy* is dead, long live *generator-dummy*
- **0.8.3**: Removed generated documentation from repository
- **0.8.2**: Added notifications to tasks
- **0.8.1**: fixed a regression from 0.8.0
- **0.8.0**:
  - Changed server task to serve (best practice)
  - Switched default port to 0 to enable simple multiple server running simultaneously
- **0.7.0**:    Documentation build is now automated
- **0.6.1**:    Moved examples from index.html to demo/index.html
- **0.6.0**:
  - Removed livereload script from html, you must use a browser extension listenning port 35729
  - Until generator is built, a gruntFile for typo3 has been added
- **0.5.1**:    Improved documentation
- **0.5.0**:    Sourcemapping for sass & coffescript files enabled
- **0.3.0**:    Vendors prefixe are now automatically added to the main.css file
- **0.4.0**:    The default grunt task now build coffeescript annotated sources
- **0.2.0**:    Reworked grid system: You can now use *class="column column-value"* in any wrapper to get your columns right
- **0.1.0**:    First Sass & Coffe version of the Dummy
