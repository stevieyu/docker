FROM node:alpine as base

FROM base as deps

COPY package*.json ./

RUN npm ci


FROM base as builder

COPY . .
COPY --from=deps /node_modules ./node_modules
RUN npm run build


FROM base as runner

COPY --from=builder /.next/standalane ./
COPY --from=builder /public ./public
COPY --from=builder /.next/static ./.next/static

EXPOSE 3000

ENV PORT 3000

CMD HOSTNAME='0.0.0.0' node server.js
