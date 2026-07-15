FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

COPY . .

WORKDIR /app/example
RUN flutter pub get
RUN flutter build web -t lib/widgetbook.dart --base-href=/flutter/ --no-tree-shake-icons --release

FROM nginx:alpine AS runtime

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/example/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]