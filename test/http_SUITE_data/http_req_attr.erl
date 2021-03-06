%% Feel free to use, reuse and abuse the code in this file.

-module(http_req_attr).
-behaviour(cowboyku_http_handler).
-export([init/3, handle/2, terminate/3]).

init({_, http}, Req, _) ->
	{Attr, Req2} = cowboyku_req:qs_val(<<"attr">>, Req),
	{ok, Req2, Attr}.

handle(Req, <<"host_and_port">> = Attr) ->
	{Host, Req2} = cowboyku_req:host(Req),
	{Port, Req3} = cowboyku_req:port(Req2),
	Value = [Host, "\n", integer_to_list(Port)],
	{ok, Req4} = cowboyku_req:reply(200, [], Value, Req3),
	{ok, Req4, Attr}.

terminate(_, _, _) ->
	ok.
