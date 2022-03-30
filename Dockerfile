FROM ferror/sylius-image:1.11

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY . /app

RUN composer install --no-scripts --no-interaction --no-dev --no-progress
RUN php bin/console cache:warmup --no-debug --env=prod # --no-optional-warmers

RUN yarn install && yarn add node-sass && yarn build

# SHOULD BE
#RUN yarn install --pure-lockfile --production --ignore-scripts
#RUN yarn build

RUN mkdir -p /app/public/media/image
RUN chmod -R 777 /app/var
