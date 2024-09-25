<div align="center">
  <h1>HATG (Hide Among The Grass)</h1>
  <p>
    <i>A performance-focused and lightweight solution to stealth in Arma 3.</i>
  </p>

  ### ***"What features does this mod offer?"***

  ### ***"Why does this exist?"***

  I noticed that the only real available mod that "solves" this problem, ACSTG AI Cannot See Through Grass, is very... questionable. It spams the server with creation/deletion requests and creates a ton of threads that clog the scheduler, causing massive slowdown especially as time goes on.

  This mod aims to solve that problem by using smarter methods to achieve the same goal. Also, it's open source/under the MIT license!

  If you value your performance, this mod is for you.

  ### ***"How is this different to ACSTG"***

  The main difference is that this mod is *faster* and *better for performance*.

  From quick code performance testing, ACSTG takes around 2 milliseconds to run with no AI present. With 100 AI present, this can skyrocket from anywhere to 4-6ms. That's the main loop that runs every second or so (I couldn't test the entire thing due to its heavy use of threads and scheduling, made the performance results inaccurate. If anything the loop may actually take longer.). It also floods the server network with creation/deletion requests, which is then passed on to every connected client.

  HATG will take around 0.6-0.8ms to run its loop every second with 120 AI present. That's a lot faster than ACSTG.

  For example:
  If you have 10 players attacking a position with around 70 enemy AI, ACSTG will potentially be spawning ~100-700 objects every second depending on how many players are "hidden". These are then being deleted ~1 second after they are being made, resulting in another ~100-700 deletions. It will also create multiple boxes per AI for each player.

  HATG works by creating a single box and attaching it to you to prevent the AI from seeing **you** - not 100m infront of you. These are called "mirrors" due to how they work. These "mirrors" metaphorically reflect the environment around you so the AI doesn't notice you're there. It doesn't matter how many AI there are, there will only be 1 box created per player. This is much better for both the scheduler and network as very few threads and network requests are ever made, compared to ACSTG which could make hundreds ***every second***.
  
  Under the same conditions as the example above, this time with HATG, only 10 objects will be made *at most*.

</div>
