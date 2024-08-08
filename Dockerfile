ARG NODE_VERSION=22

FROM node:${NODE_VERSION}-slim AS base

WORKDIR /app

# Build
FROM base AS build

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

# Run
FROM base

COPY --from=build /app/.output /app/.output

EXPOSE 3000

CMD [ "node", ".output/server/index.mjs" ]
