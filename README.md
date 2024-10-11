<div align="center">
  <h1>HATG (Hide Among The Grass)</h1>
  <p>
    <i>A performance-focused solution to stealth in Arma 3.</i>
  </p>

  # ***"What features does this mod offer?"***

  The ability to hide among the grass.

  The ability to revamp your stealth gameplay. Ever wanted a ghillie suit to actually stop the AI from seeing you? Now it does.

  A logical and simplistic approach to concealment. Shooting from afar with a suppressor? You'll remain hidden for longer.

  A minimalistic UI to help you know when you are hidden or not. This is OFF by default.

  Environmental consideration. During the night or if it is raining/foggy, detection distance will be lowered.

  Flexible CBA settings, allowing you to change just about anything in the mod.

  Singleplayer support. Your AI squad will have the same stealth possibilities as you do! (Only in SP)

  Localization. Note: Only English and Russian have been translated by humans. Feel free to check out our github at the bottom of the page and fix any translation errors!

  # ***"Why does this exist?"***

  I noticed that the only real available mod that "solves" this problem, ACSTG AI Cannot See Through Grass, is very... questionable. It spams the server with creation/deletion requests and creates a ton of threads that clog the scheduler, causing massive slowdown especially as time goes on.

  This mod aims to solve that problem by using smarter methods to achieve the same goal. Also, it's licensed under the [APL-SA](https://www.bohemia.net/community/licenses/arma-public-license-share-alike) license(*)!

  If you value your performance, this mod is for you.

  # ***"How is this different to ACSTG"***

  The main difference is that HATG is *faster* and *better for performance*.

![image](https://github.com/user-attachments/assets/e381caaa-27ef-48be-932a-ea870e12c48d)

  From quick code performance testing, ACSTG takes around 1ms to run with no AI present. With 100 AI present, this can skyrocket to 2-6ms. That's the main loop that runs every second or so (I couldn't test the entire thing due to its heavy use of threads and scheduling, made the performance results inaccurate. If anything the loop may actually take longer.). It also floods the server network with creation/deletion requests, which is then passed on to every connected client.

  HATG will take around 0.2-0.4ms to run its loop every second with 120 AI present. I don't need to say why that's better. (Runtime varies with mods, running scripts, etc)

  For example:
  If you have 10 players attacking a position with around 70 enemy AI, ACSTG will potentially be spawning ~100-700 objects every second depending on how many players are "hidden". These are then being deleted ~1 second after they are being made, resulting in another ~100-700 deletions. It will also create multiple boxes per AI for each player.

  HATG works by creating a single box and attaching it to you to prevent the AI from seeing **you** - not 100m infront of you. These are called "mirrors" due to how they work. These "mirrors" metaphorically reflect the environment around you so the AI doesn't notice you're there. It doesn't matter how many AI there are, there will only be 1 box created per player. This is much better for both the scheduler and network as very few threads and network requests are ever made, compared to ACSTG which could make hundreds ***every second***.
  
  Under the same conditions as the example above, this time with HATG, only 10 objects will be made *at most*.
</div>
