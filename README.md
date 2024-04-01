This is basically just a copy and paste from the notes of the module.  
Also this is my first ever GitHub repository so expect issues with this too.

- There are some redundancies that I don't feel like fixing right now.  Tech debt, let's go !!!
- If there are FPS issues, I tried.  Try contacting me about them to get them fixed possibly.
- When you use a DeltaTime with the base shake functions, the results may differ because of the constant FPS fix I used.
- I have no idea how to fix this... lol.  The LerpPosition is the only thing really affected but it makes a noticable difference.

  NEW:
    - The base shake functions require you to manually set the CameraOffset of the Player's Humanoid so you need to wrap this into a RunService RenderStepped loop.
    - This is one of my first times messing with any sort of camera shake so expect some inconsistencies and bugs.
    - I am adding functions using perlin noise at a later date.
