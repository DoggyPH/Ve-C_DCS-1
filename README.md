# Intro
#### This repository is my first ever one so I am still learning how to use GitHub.
- This module is intended for the Roblox game **Ve>C**, which is a game that I am helping with.
- I basically use PascalCase for everything and parenthesis around if statements, which may seem weird to some people.
- It also uses the strict type checking version of Luau.

# Module Notes Copy and Paste

- There are some redundancies that I don't feel like fixing right now.  Tech debt, let's go !!!
- If there are FPS issues, I tried.  Try contacting me about them to get them fixed possibly.
- When you use a `DeltaTime` with the base shake functions, the results may differ because of the constant FPS fix I used.
- I have no idea how to fix this... lol.  The `LerpPosition` is the only thing really affected but it makes a noticable difference.

# New Information:
  - The base shake functions require you to manually set the `CameraOffset` of the Player's `Humanoid` so you need to wrap this into a `RunService` `RenderStepped` loop.
  - This is one of my first times messing with any sort of camera shake so expect some inconsistencies and bugs.
  - I am adding functions using perlin noise at a later date.
  - I will also be commenting on other parts of my code on a later date as well.
