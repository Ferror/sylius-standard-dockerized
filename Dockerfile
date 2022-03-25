FROM ferror/sylius-image:1.11

COPY . /app

RUN composer install --no-scripts
RUN bin/console cache:warmup
RUN yarn install --pure-lockfile
RUN node_modules/gulp/bin/gulp.js
