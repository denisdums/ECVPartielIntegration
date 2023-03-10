const mix = require('laravel-mix');
require('laravel-mix-copy-watched');

mix
    .setPublicPath('./public/dist')
    .browserSync({
        proxy:'birds.docker',
        files: ['assets/**/*', 'public/**/*', '!public/dist/**/*'],
    });


mix
    .sass('./assets/scss/app.scss', 'css')
    .options({
        processCssUrls: false,
    });

mix
    .js('./assets/js/app.js', 'js')

mix
    .copyWatched('./assets/images/**', 'public/dist/images', {base: './assets/images'})
    .copyWatched('./assets/fonts/**', 'public/dist/fonts', {base: './assets/fonts'});

mix.options({processCssUrls: false});

mix.sourceMaps(false, 'source-map').version();
