# PrismLauncher CosmicQuilt
A PrismLauncher instance for running Cosmic Reach

## Usage
- Head over to the [Actions](https://github.com/maxlvlnerd/cosmicquilt-prism/actions) tab
- Download the Cosmic Reach artifact from the latest workflow run
- in PrismLauncher click the Add Instancte button on the top right
- click Import and select the downloaded zip (change instance name if needed)
- click Ok and you're done

## Contributing
Contributions are welcome
Bug Reports, Bug fixes, Tests, Documentation, Code Changes, really anything is greatly appreciated
I try my best to document my code and explain my choices but if anything is unclear feel free to ask questions

### Notes
To update the version of Cosmic Quilt and Cosmic Reach, use the script [./scripts/get_latest_context.sh](./scripts/get_latest_context.sh) to automatically fetch the latest version of cr & cq aswell as the MMC libraries for cq.

see [./flake.nix](./flake.nix) for how to build the prism instance (Note: nix build does not package the rendered templates into a zip like the github artifacts)

