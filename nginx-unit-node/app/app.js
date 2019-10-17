#!/usr/bin/env node

const { createServer, IncomingMessage, ServerResponse } = require('unit-http')

require('http').ServerResponse = ServerResponse
require('http').IncomingMessage = IncomingMessage

const express = () => {
	const app = require('express')()

	app.get('/', (req, res) => res.send('Hello, Unit! express'))

	createServer(app).listen()
}

const koa = () => {
	const app = new (require('koa'))()

	app.use(ctx => ctx.body = 'Hello, Unit! koa');

	createServer(app.callback()).listen()
}

const fastify = () => {
	const app = require("fastify")({
		serverFactory: (handler) => createServer(handler)
	});

	app.get("/", (req, reply) => {
	  reply.send('Hello, Unit! fastify');
	});

	app.ready();
}

express()