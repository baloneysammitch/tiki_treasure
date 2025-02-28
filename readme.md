Things I've learned

## General

* By default the VConsole connects to the wrong port. Use 29009 instead. Tilde (~) is a nice shortcut.
* https://developer.valvesoftware.com/wiki/Inputs_and_Outputs#Debugging

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

## env_entity_maker
Where to begin... You can't parent a point_template to an entity, so instead you have to use a env_entity_maker. If you want to spawn entity in a certain direction, you need to tick the PostSpawn Inherit Angles option. However, the angles will be crazy. The orientation of the env_entity_maker is useless. So is the parent object. Don't screw with the PostSpawn Inherit Angles either. They are all dead ends.

Instead, make a dummy object and use it as a proxy to handle the angles. Parent the env_entity_maker to the dummy entity, and parent the dummy entity to your true parent.

The position of the entity being spawned in relation to the point template ALSO matters. Put the point_template exactly on top of your target spawn entity. Zero all rotations. Again, the ONLY rotation that matters is the parent of the env_entity_maker.


## Skybox cubemap

Get sweet HDRI images for free from https://hdrihaven.com/ and convert them to cubemaps with https://matheowis.github.io/HDRI-to-CubeMap/
