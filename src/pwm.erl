-module(pwm).
-vsn("0.0.1").

-behaviour(gen_server).

-define(SERVER, ?MODULE).

%%%
%% API
%%%

-export([start_link/0,
	 frequency/1,
	 radians/1]).

%%%
%% Behaviour
%%%

-export([init/1,
	 handle_call/3,
	 handle_cast/2,
	 handle_info/2,
	 terminate/2,
	 code_change/3]).

%%%
%%
%%%

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

frequency(Frequency) ->
    gen_server:call(?SERVER, {frequency, Frequency}).

radians(Radians) ->
    gen_server:call(?SERVER, {radians, Radians}).

%%%
%%
%%%

init(_) ->
    {ok, []}.

handle_call({frequency, Frequency}, _From, State) ->
    io:fwrite("Frequency: ~p~n", [Frequency]),
    {reply, {ok, Frequency}, State};

handle_call({radians, Radians}, _From, State) ->
    io:fwrite("Radians: ~p~n", [Radians]),
    {reply, {ok, Radians}, State};

handle_call(What, _From, State) ->
    {reply, {error, What}, State}.

handle_cast(_What, State) ->
    {noreply, State}.

handle_info(_What, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
