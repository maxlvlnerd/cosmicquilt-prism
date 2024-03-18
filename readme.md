# Cosmic Reach on Prism

This is a small project so that you can run [Cosmic Reach](https://finalforeach.itch.io/cosmic-reach) over on [Prism Launcher](https://prismlauncher.org/)


## How to install

1. Download the zip of this project
2. Import it into prism
3. Profit

## How to update

1. Update the version numbers of stuff in both the `mmc-pack.json`, and all the patches in the `patches/<uuid>.json`
2. Update the Cosmic Reach jar from [itch](https://finalforeach.itch.io/cosmic-reach) and place it in the libaries folder
3. If you are updating Cosmic Launcher, also place the Cosmic Reach jar in the root of the `.minecraft` folder and call it `cosmic-reach.jar`
4. If you are updating Cosmic Launcher, compile it from source (instructions over on [their github](https://github.com/Y2Kwastaken/CosmicLoader)), and put it in the `libaries` folder, making sure to base Fabric's patch file in `patches/net.fabricmc.fabric-loader.json` incase there is an update to Fabric

## TODO

- [x] Impliment support for the [Cosmic Launcher](https://github.com/Y2Kwastaken/CosmicLoader)
    - [ ] Remove duplicate cosmic jar due to cosmic cauncher expecting it to be named a certain way
- [ ] Write a script to download the Cosmic jar rather than storing it in this git repo

## Note

Currently this contains the build of Cosmic Reach over in the `libaries/cosmicreach-<version>.jar`.\
This jar is by FinalForEach, and all of that is owned by FinalForEach, not by me!

Feel free to check the hash with the version on itch.io until I create a script to automatically generate the Prism Launcher instance straight from Itch
