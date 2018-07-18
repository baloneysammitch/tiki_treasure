Things I've learned

## General

* By default the VConsole connects to the wrong port. Use 29009 instead. Tilde (~) is a nice shortcut.

## Exporting
Getting an error when exporting via Source Engine export (dmx files)? Make sure to select Binary 9, Model 22.

## Textures
* Make sure your texture dimensionsa are divisible by 2
* Sometimes a png transparency is masquerading as black alpha value
* .jpeg files should be named .jpg to show up
* if exporting a new dmx files, your textures will disappear. You have to then select your mesh and manually input a texture search directory:
  materials/models/[texture_path]
* Whem importing a new model, always choose simplified names from source materials. If you don't, the texture names won't align with any future exported DMX file.

## Collision mesh
* Can't pick up your object? Your collision mesh is bad
* Did you re-export your file at a different size? Regenerate mesh
* Sometimes it just didn't save... remake it.
* Does your object lag while moving it? The collision mesh is too complicated
* Always generate your own. Don't use the importer options.

## Soundscapes
* They are a complete nightmare.
* Requires a scripts folder that lives in the compiled /games/ version of your map, not /content/.
* The Env_soundscape must be visible on player spawn!
* Run any wav file through Audacity and export using default settings to get the correct bitrate (44100). You will know you've done it right if it appears in the asset browser.
* Speaking of the asset browser... Filter by "sound" and then select the sounds. It will actually play the file!  View the log with ~ and watch to see if your sounds compiled correctly.
* Amazingly, the loop function doesn't work. The loop points have to be encoded into the wav file itself. Use Wavosaure. Ctrl + L to create loop points. Save. Done.

## snd_event_point

* Must be added to your soundevents/soundevents_addon.vsndevts file
* Will show up in the searchable sounds!
* You can only preview the sound if your headset is active (The game is running in the background)
