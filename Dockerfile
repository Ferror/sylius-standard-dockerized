FROM ferror/sylius-image:1.11

COPY . /app

RUN composer install --no-scripts --no-interaction --no-dev
RUN php bin/console cache:warmup --no-debug --env=prod # --no-optional-warmers
RUN yarn install --pure-lockfile --production
RUN node_modules/gulp/bin/gulp.js
RUN chmod -R 777 /app/var
