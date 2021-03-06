%% Feel free to use, reuse and abuse the code in this file.

-module(ws_timeout_hibernate).
-behaviour(cowboyku_websocket_handler).
-export([init/3]).
-export([websocket_init/3, websocket_handle/3,
	websocket_info/3, websocket_terminate/3]).

init(_Any, _Req, _Opts) ->
	{upgrade, protocol, cowboyku_websocket}.

websocket_init(_TransportName, Req, _Opts) ->
	{ok, Req, undefined, 1000, hibernate}.

websocket_handle(_Frame, Req, State) ->
	{ok, Req, State, hibernate}.

websocket_info(_Info, Req, State) ->
	{ok, Req, State, hibernate}.

websocket_terminate(_Reason, _Req, _State) ->
	ok.
