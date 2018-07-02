const gulp = require('gulp')
const plumber = require('gulp-plumber')
const notify = require('gulp-notify')
const source = require('vinyl-source-stream')
const buffer = require('vinyl-buffer')
const pug = require('gulp-pug')
const sass = require('gulp-sass')
const postcss = require('gulp-postcss')
const autoprefixer = require('autoprefixer')
const minifyCSS = require('gulp-csso')
const sourcemaps = require('gulp-sourcemaps')
const browserify = require('browserify')
const babelify = require('babelify')
const browserSync = require('browser-sync').create()
const uglify = require('gulp-uglify')

gulp.task('pug', function(){
  return gulp.src('src/templates/page/*.pug')
    .pipe(plumber({errorHandler: notify.onError({
        message: "<%= error.message %>",
        title: "Template compilation"
      })}))
    .pipe(pug({
      basedir: '.'
    }))
    .pipe(gulp.dest('dist/'))
    .pipe(browserSync.stream())
})

gulp.task('sass', function(){
  return gulp.src('src/sass/*.sass')
    .pipe(plumber({errorHandler: notify.onError({
        message: "<%= error.message %>",
        title: "CSS preprocessing"
      })}))
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(postcss([autoprefixer({browsers: ['last 3 version']})]))
    .pipe(minifyCSS())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('dist/css'))
    .pipe(browserSync.stream({match: '**/*.css'}))
})

gulp.task('js', () => {
  return browserify('src/js/main.js',  {debug: true})
    .transform(babelify.configure({ presets: ["@babel/preset-env"], sourceMaps: true }))
    .on('error', notify.onError({
        message: "<%= error.message %>",
        title: "Babelify JS"
      }))
    .bundle()
    .on('error', notify.onError({
        message: "<%= error.message %>",
        title: "JS compilation"
      }))
    .pipe(source('main.js'))
    .pipe(buffer())
    // .pipe(sourcemaps.init({loadMaps: true}))
    // .pipe(uglify())
    // .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('dist/js'))
    .pipe(browserSync.stream())
})

gulp.task('copyAssets', function() {
  return gulp.src('src/assets/**/*')
    .pipe(gulp.dest('dist/'))
    .pipe(browserSync.stream())
})

gulp.task('serve', function() {

    browserSync.init({
        server: "./dist/",
        open: false,
    })

    gulp.watch('src/sass/**/*.sass').on('all', gulp.parallel('sass'))
    gulp.watch('src/js/**/*.js').on('all', gulp.parallel('js',))
    gulp.watch('src/templates/**/*.pug').on('all', gulp.parallel('pug'))
    gulp.watch('src/assets/**').on('all', gulp.parallel('copyAssets'))
  })

gulp.task('build', gulp.parallel('copyAssets', 'pug', 'sass', 'js'))
gulp.task('default', gulp.parallel('build', 'serve'))
