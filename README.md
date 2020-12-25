# Tilegame Godot Client

Client for Tilegame built with the Godot Game Engine. Primary goal is 
to create a cross-platform game client that can connect to the same 
tilegame server.

The web build for the client is availiable at: 
https://tilegame.github.io/godot-client/web

## Why Godot?

The purpose of making the client in Godot is to enjoy all of the 
benefits that the game engine offers. Not only can it be built for the 
web, it can also be built into desktop and mobile applications. Since 
the web export on Godot has increased to a fairly good quality, I 
thought it was time to give it a try!

## Development

[Download Godot Engine](https://godotengine.org/download/) and then 
open the project that is found in the `src` directory. Builds are 
currently made by manually exporting web builds into the `web` 
directory using `index.html` as the filename.

## Current Goals

The primary goals are that of Basic Functionality.

- [x] HTTP capability
- [ ] Websockets capability
- [ ] Connect to the Tilegame server
- [ ] Error handling when unable to connect to the tilegame server
- [ ] Able to talk via Chatroom
- [ ] Able to walk around with a player character

Future goals will be written once the server has been improved.
