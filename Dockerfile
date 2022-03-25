FROM ferror/sylius-image:1.11

COPY . /app

RUN php composer install --no-scripts
RUN php bin/console cache:warmup --no-debug --env=prod
RUN yarn install --pure-lockfile
RUN node_modules/gulp/bin/gulp.js
