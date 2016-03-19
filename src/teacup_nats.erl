% Copyright (c) 2016, Yuce Tekol <yucetekol@gmail.com>.
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
%
% * Redistributions of source code must retain the above copyright
%   notice, this list of conditions and the following disclaimer.
%
% * Redistributions in binary form must reproduce the above copyright
%   notice, this list of conditions and the following disclaimer in the
%   documentation and/or other materials provided with the distribution.
%
% * The names of its contributors may not be used to endorse or promote
%   products derived from this software without specific prior written
%   permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
% A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
% OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
% DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
% THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-module(teacup_nats).

-export([new/0,
         new/1,
         ping/1,
         pub/2,
         pub/3,
         sub/2,
         sub/3,
         unsub/2,
         unsub/3]).

%% == API

new() ->
    new(#{}).
 
new(Opts) ->
    teacup:new(nats@tc, Opts).

-spec ping(Ref :: teacup:teacup_ref()) -> ok.    
ping(Ref) ->
    teacup:cast(Ref, ping).

pub(Ref, Subject) ->
    pub(Ref, Subject, #{}).

-spec pub(Ref :: teacup:teacup_ref(), Subject :: binary(), Opts :: map()) ->
    ok.
pub(Ref, Subject, Opts) ->
    teacup:cast(Ref, {pub, Subject, Opts}).                        

sub(Ref, Subject) ->
    sub(Ref, Subject, #{}).

-spec sub(Ref :: teacup:teacup_ref(), Subject :: binary(), Opts :: map()) ->
    ok.
sub(Ref, Subject, Opts) ->
    teacup:cast(Ref, {sub, Subject, Opts, self()}).    

unsub(Ref, Subject) ->
    unsub(Ref, Subject, #{}).

-spec unsub(Ref :: teacup:teacup_ref(), Subject :: binary(), Opts :: map()) ->
    ok.
unsub(Ref, Subject, Opts) ->
    teacup:cast(Ref, {unsub, Subject, Opts, self()}).