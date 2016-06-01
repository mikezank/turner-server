#!/usr/bin/env ruby

# broker transfers Player requests to the GameServer

require 'rubygems'
require 'ffi-rzmq'

require_relative 'constants.rb'

context = ZMQ::Context.new
frontend = context.socket(ZMQ::ROUTER)
backend = context.socket(ZMQ::DEALER)

frontend.bind('tcp://*:' + GConst::BROKER_PLAYER_PORT)
backend.bind('tcp://*:' + GConst::BROKER_SERVER_PORT)

poller = ZMQ::Device.new(frontend, backend)

