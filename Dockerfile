FROM node:lts-slim

LABEL maintainer="Kamil (sp9usb) Mysliwiec <sp9usb@gmail.cm>"

COPY . /app

# Move to /app
WORKDIR /app

# Install requirements, build and remove devDependencies
# (from: https://stackoverflow.com/a/25571391/2885946)
RUN npm ci && \
    npm run build && \
    npm prune --production && \
    npm cache clean --force

# Run a server
ENTRYPOINT [ "node", "dist/src/index.js" ]
