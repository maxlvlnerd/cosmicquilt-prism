# Cosmic Reach on Prism

This is a small project so that you can run [Cosmic Reach](https://finalforeach.itch.io/cosmic-reach) over on [Prism Launcher](https://prismlauncher.org/) using mod loaders such as [Cosmic Quilt](https://codeberg.org/CRModders/cosmic-quilt) (which allows you to run the [Quilt Loader](https://quiltmc.org/) on Cosmic Reach)


## How to install

1. Download the zip of this project
2. Import it into prism
3. Profit

## How to update

### Cosmic Reach
1. Update the Cosmic Reach jar from [Itch](https://finalforeach.itch.io/cosmic-reach) and place it in the `libaries` folder (making sure to use the correct naming scheme)
2. Update the version number of stuff in both the `mmc-pack.json`, and version in the Cosmic Reach patch at `patches/finalforeach.cosmicreach.json`

### Cosmic Quilt
1. Edit the patch at `patches/org.coolcosmos.cosmicquilt.json`
2. Update the version number in both the root of the json, and in the location of the first library
3. Edit the version number in the base `mmc-pack.json`


## Note

Currently this contains the build of Cosmic Reach over in the `libaries/cosmicreach-<version>.jar`.\
This jar is by FinalForEach, and all of that is owned by FinalForEach, not by me!

Feel free to check the hash with the version on itch.io until I create a script to automatically generate the Prism Launcher instance straight from Itch