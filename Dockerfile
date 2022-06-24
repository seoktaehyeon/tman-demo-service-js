FROM node:15 AS npm-build
COPY . .
RUN npm install && \
    npm run build

FROM nginx:1.17-alpine
LABEL maintainer="will.shi@jingxianginfo.com" 
WORKDIR /usr/share/nginx/html
COPY --from=npm-build ./dist/ ./tman-demo-app/
COPY nginx.conf /etc/nginx/nginx.conf
COPY health_check.sh ./health_check.sh
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=10s --start-period=10s --retries=3 CMD [ "./health_check.sh" ]
