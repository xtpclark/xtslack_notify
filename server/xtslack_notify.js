#!/usr/bin/env node
var Slack = require('node-slack');

# Create your slack incoming webhook identifier
# https://api.slack.com/incoming-webhooks

var slack = new Slack('https://hooks.slack.com/services/WhatEver/Your/WebhookIs');

# Set your postgresql connection string
var pg = require ('pg'),
    pgConnectionString = "postgres://user:password@host/demodb";

var client = new pg.Client(pgConnectionString);
client.connect();
client.query('LISTEN "slack_notify_watcher"');
client.on('notification', function(data) {

var msg=data.payload;

console.log(msg);

// need to do this better...
// text: msg, channel: chan, username: script - see other options.

slack.send({text: msg,  channel: '#the_channel_for_your_message', username: 'xTuple Slacker'});

});
