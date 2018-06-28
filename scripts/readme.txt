The contents of this folder must be placed in the \game\ folder (compiled). The scripts folder is useless here, but I'm checking it into git nonetheless.

C:\Program Files (x86)\Steam\steamapps\common\SteamVR\tools\steamvr_environments\game\steamtours_addons\[addon_name]



By default the VConsole connects to the wrong port. Use 29009 instead.

Run any wav file through Audacity and export using default settings to get the correct bitrate (44100).
You will know you've done it right if you immediately get a ".vsnd_c" file in your \game\ version of the sounds folder. You will also be able to search for it in the asset browser.

Gotchas:
* The Env_soundscape must be visible on player spawn!
* Amazingly, the loop function doesn't work. The loop points have to be encoded into the wav file itself. Use Wavosaure. Ctrl + L to create loop points. Save. Done.

