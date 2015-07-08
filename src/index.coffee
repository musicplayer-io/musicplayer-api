request = require "request"

class APIRequest
  constructor: (@url, @token, @action, @cb) ->
  respond: (cb) ->
    (req, res, body) ->
      if cb?
        try
          cb JSON.parse body
        catch error
          cb {status: false, message: "Connection failed", error: error}

  get: (cb) ->
    request.get "#{@url}/remote/#{@token}/#{@action}", @respond(cb)
    
  post: (data, cb) ->
    if typeof data is "function"
      request.post "#{@url}/remote/#{@token}/#{@action}", @respond(data)
    else if data? and not cb?
      request.post "#{@url}/remote/#{@token}/#{@action}", {form: data}
    else if data? and typeof cb is "function"
      request.post "#{@url}/remote/#{@token}/#{@action}", {form: data}, @respond(cb)
    else
      request.post "#{@url}/remote/#{@token}/#{@action}"


class MusicPlayerAPI
  constructor: (@token, @url) ->
    @play = new APIRequest @url, @token, "play"
    @forward = new APIRequest @url, @token, "forward"
    @backward = new APIRequest @url, @token, "backward"
    @user = new APIRequest @url, @token, "user"
    @subreddits = new APIRequest @url, @token, "subreddits"
    @song = new APIRequest @url, @token, "song"

module.exports = (token, url) ->
  if typeof token is "string"
    return new MusicPlayerAPI token, (url or "http://reddit.musicplayer.io")
  else
    return new MusicPlayerAPI token.token, token.url
