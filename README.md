
<h1 align="center">
  <br>
  <img width="650" src="https://cloud.githubusercontent.com/assets/304283/8581435/f5fcf59a-25c0-11e5-80fd-0ac130f628a5.jpg" alt="music player api">
  <br>
  <br>
</h1>


> Music Player for Reddit API

Node.js wrapper around the API for the Music Player for Reddit.

An authentication token is required which you can get after logging in and
clicking [generate token](http://reddit.musicplayer.io/remote).

# Installation

`npm install musicplayer`

# Usage

```
var MusicPlayerAPI = require('musicplayer')("YOUR_TOKEN");

MusicPlayerAPI.user.get(function(result) {
  if (result.status == false) return console.error(result.message);

  var user = result.data;
  console.log("I am logged in as " + user.name);
})
```

## Play

* get : Get the state of the player, `true` for playing

```
MusicPlayerAPI.play.get(function(result) {
  if (result.status == false) return console.error(result.message);
  console.log(result.data);
})
```

* post : Toggles the state of the player

```
MusicPlayerAPI.play.post(function(result) {
  if (result.status == false) return console.error(result.message);
  console.log(result.success);
})
```

## Forward

* post : Skips to the next playable song

```
MusicPlayerAPI.forward.post();
```

## Backward

* post : Rewinds back to the previous playable song

```
MusicPlayerAPI.backward.post();
```

## User

* get : Gets the information from the logged in user

```
MusicPlayerAPI.user.get(function(result) {
  if (result.status == false) return console.error(result.message);

  var user = result.data;
  console.log("I am logged in as " + user.name);
})
```

## Subreddits

* get : Gets a list of subreddits

```
MusicPlayerAPI.subreddits.get(function(result) {
    if (result.status == false) return console.error(result.message);
    console.log(result.data);
})
```

* post : Posts a list of subreddits
* Arguments: `{subreddits: "sub1+sub2"}`

```
MusicPlayerAPI.subreddits.post({
    subreddits: "listentothis+music"
  }, function(result) {
    if (result.status == false) return console.error(result.message);
    console.log(result.subreddits);
})
```

## Song
