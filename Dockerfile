FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

COPY . .

WORKDIR /app/example
RUN flutter clean && flutter pub get
ARG CACHEBUST=1
RUN flutter build web -t lib/widgetbook.dart --base-href=/ --no-tree-shake-icons --pwa-strategy=none --release

FROM nginx:alpine AS runtime

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/example/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]