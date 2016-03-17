//****************************** Variables ******************************
var gulp = require('gulp'),
    connect = require('gulp-connect'),
    less = require('gulp-less'),
    coffee = require('gulp-coffee'),
    gutil = require('gulp-util'),
    inject = require('gulp-inject'),
    gulpSequence = require('gulp-sequence'),
    uglify = require('gulp-uglify'),
    concat = require('gulp-concat'),
    minifyCss = require('gulp-minify-css'),
    rename = require("gulp-rename"),
    clean = require('gulp-clean'),
    ngAnnotate = require('gulp-ng-annotate'),
    angularFilesort = require('gulp-angular-filesort'),
    gulpNgConfig = require('gulp-ng-config'),
    imagemin = require('gulp-imagemin'),
    pngquant = require('imagemin-pngquant'),
    rev = require('gulp-rev');

    //Used libraries
    var libraries = ['node_modules/bootstrap/dist/css/bootstrap.min.css',
                     'node_modules/font-awesome/css/font-awesome.min.css',
                     'node_modules/angular-ui-bootstrap/dist/ui-bootstrap-csp.css',
                     'node_modules/jquery/dist/jquery.min.js',
                     'node_modules/bootstrap/dist/js/bootstrap.min.js',
                     'node_modules/angular/angular.min.js',
                     'node_modules/angular-animate/angular-animate.min.js',
                     'node_modules/angular-ui-router/release/angular-ui-router.min.js',
                     'node_modules/angular-ui-bootstrap/dist/ui-bootstrap.js',
                     'node_modules/restangular/dist/restangular.min.js'];

//****************************** Tasks for each environment ******************************
gulp.task('default', ['local']);
gulp.task('local', gulpSequence('clean-dist', 'config-local', 'build-files', 'build-dist', 'inject', 'webserver', 'watch-files'));
gulp.task('development', gulpSequence('clean-dist', 'config-dev', 'build-files-server', 'build-dist', 'inject'));

//****************************** Inject config file for each environment ******************************
gulp.task('config-local', function () {
    gulp.src('config.json')
        .pipe(gulpNgConfig('videoApp', {
            environment: 'local',
            createModule: false
        }))
        .pipe(gulp.dest('tmp/js'));
});

gulp.task('config-dev', function () {
    gulp.src('config.json')
        .pipe(gulpNgConfig('videoApp', {
            environment: 'development',
            createModule: false
        }))
        .pipe(gulp.dest('tmp/js'));
});

//****************************** Files processing ******************************
gulp.task('build-files', gulpSequence(['build-css', 'build-js'], 'clean-tmp'));
gulp.task('build-files-server', gulpSequence(['build-css-server', 'build-js-server'], 'clean-tmp'));

//CSS file processing
gulp.task('build-css', ['minify-css']);
gulp.task('build-css-server', ['minify-css-server']);

gulp.task('minify-css-server', ['compile-less'], function () {
    return gulp.src('tmp/css/**/*.css')
        .pipe(minifyCss({compatibility: 'ie8'}))
        .pipe(rename(function (path) {
            path.extname = ".min.css"
        }))
        .pipe(rev())
        .pipe(gulp.dest('dist/css'));
});

gulp.task('minify-css', ['compile-less'], function () {
    return gulp.src('tmp/css/**/*.css')
                .pipe(minifyCss({compatibility: 'ie8'}))
                .pipe(rename(function (path) {
                    path.extname = ".min.css"
                }))
                .pipe(gulp.dest('dist/css'))
                .pipe(connect.reload());
});

gulp.task('compile-less', function() {
    return gulp.src('assets/styles/main.less')
                .pipe(less())
                .pipe(gulp.dest('tmp/css'));
});

//JS file processing
gulp.task('build-js', ['minify-js']);
gulp.task('build-js-server', ['minify-js-server']);

gulp.task('minify-js-server', ['ng-annotate'], function(){
    return gulp.src('tmp/js/app.js')
        .pipe(uglify())
        .pipe(rename(function (path) {
            path.extname = ".min.js"
        }))
        .pipe(rev())
        .pipe(gulp.dest('dist/js'));
});

gulp.task('minify-js', ['ng-annotate'], function(){
    return gulp.src('tmp/js/app.js')
                .pipe(uglify())
                .pipe(rename(function (path) {
                    path.extname = ".min.js"
                }))
                .pipe(gulp.dest('dist/js'))
                .pipe(connect.reload());
});

gulp.task('ng-annotate', ['concat-js'], function () {
    return gulp.src('tmp/js/app.js')
                .pipe(ngAnnotate())
                .pipe(gulp.dest('tmp/js'));
});

gulp.task('concat-js', ['compile-coffee'], function(){
    return gulp.src(['tmp/js/**/*.js', '!tmp/js/app.js'])
                .pipe(angularFilesort())
                .pipe(concat('app.js'))
                .pipe(gulp.dest('tmp/js'));
});

gulp.task('compile-coffee', function(){
    return gulp.src('app/**/*.coffee')
                .pipe(coffee({bare: true}).on('error', gutil.log))
                .pipe(gulp.dest('tmp/js'));
});

//Clean dist folder
gulp.task('clean-dist', function(){
    return gulp.src('dist', {read: false})
                .pipe(clean());
});

//Clean tmp folder
gulp.task('clean-tmp', function(){
    return gulp.src('tmp', {read: false})
                .pipe(clean());
});

//****************************** Inject files into index.html ******************************
gulp.task('inject', function(){
    var target = gulp.src('dist/index.html');

    var vendorFiles = ['dist/vendor/bootstrap.min.css',
                       'dist/vendor/font-awesome.min.css',
                       'dist/vendor/ui-bootstrap-csp.css',
                       'dist/vendor/jquery.min.js',
                       'dist/vendor/bootstrap.min.js',
                       'dist/vendor/angular.min.js',
                       'dist/vendor/angular-animate.min.js',
                       'dist/vendor/angular-ui-router.min.js',
                       'dist/vendor/ui-bootstrap.js',
                       'dist/vendor/restangular.min.js'];

    //Custom css and js files
    var customFiles = ['dist/css/**/*.min.css', 'dist/js/**/*.min.js'];

    //It's not necessary to read the files (will speed up things), we're only after their paths:
    var sources = gulp.src(vendorFiles.concat(customFiles), {read: false});
    return target.pipe(inject(sources, {addRootSlash: false, ignorePath: 'dist/'}))
                 .pipe(gulp.dest('dist'));
});

//****************************** Run a web server in port 9000 ******************************
gulp.task('webserver', function() {
    connect.server({
        root: 'dist',
        port: 9000,
        livereload: true
    });
});

//****************************** Watch files for changes ******************************
gulp.task('watch-files', function() {
    gulp.watch('assets/styles/**/*.less', ['build-css']);
    gulp.watch('app/**/*.coffee', ['build-js']);
});

//****************************** Build dist folder ******************************
gulp.task('build-dist', function() {
    //Copy html
    gulp.src(['./**/*.html', '!node_modules/**/*.html'])
        .pipe(gulp.dest('dist'));

    //Copy and process images
    gulp.src('assets/img/**/*')
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant()]
        }))
        .pipe(gulp.dest('dist/assets/img'));

    //Copy custom fonts
    gulp.src('assets/styles/fonts/**/*')
        .pipe(gulp.dest('dist/assets/styles/fonts'));

    //Copy font awesome fonts
    gulp.src('node_modules/font-awesome/fonts/**/*')
        .pipe(gulp.dest('dist/fonts'));

    //UI Bootstrap templates
    gulp.src('node_modules/angular-ui-bootstrap/template/**/*')
        .pipe(gulp.dest('dist/uib/template'));

    //Copy vendor files
    return gulp.src(libraries)
        .pipe(gulp.dest('dist/vendor'));
});
