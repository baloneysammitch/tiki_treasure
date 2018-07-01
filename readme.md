Things I've learned

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
