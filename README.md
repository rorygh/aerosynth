# aerosynth

Pipeline for synthetic aerial stereo dataset generation, stereo depth estimation, and point cloud semantic segmentation.

## Dataset generation

Two data sources are supported, each producing stereo RGB, depth, disparity, and semantic segmentation ground truth.

### SynthBlend

Procedural renderer using BlenderProc — fBm terrain, Poisson-disk tree placement, physically-based sky. Runs on Linux.

Left RGB | Segmentation (terrain · foliage · trunk)
---|---
<img src="docs/synthblend_rgb.png" width="360"> | <img src="docs/synthblend_seg.png" width="360">

### GTA V

ScriptHookV ASI mod that positions a scripted aerial camera and captures the DirectX depth buffer and stencil-based segmentation. **Built and run on Windows** — see [aerosynth-gtav](https://github.com/rorygh/aerosynth-gtav) for build and install instructions. A `convert.py` script normalises captures to the shared training format.

Left RGB | Segmentation (terrain · foliage · artificial)
---|---
<img src="docs/gtav_rgb.png" width="360"> | <img src="docs/gtav_seg.png" width="360">

## Stereo depth — RAFT-Stereo

RAFT-Stereo fine-tuned independently on each dataset. We show left RGB, right RGB, predicted disparity, and ground-truth disparity on a held-out frame.

**SynthBlend:**

![RAFT-Stereo SynthBlend inference](docs/raft_synthblend_inference.png)

**GTA V:**

![RAFT-Stereo GTA V inference](docs/raft_inference.png)

See [RAFT-Stereo](https://github.com/rorygh/RAFT-Stereo) for results and training instructions.

## Point cloud segmentation — SimpleUNet

Sparse voxel UNet trained on coloured point clouds back-projected from stereo depth. Trained independently on each dataset.

**SynthBlend** — GT vs predicted cross-sections (terrain · foliage · trunk):

![SimpleUNet SynthBlend prediction](docs/unet_synthblend_pred.png)

**GTA V** — oblique point cloud render, GT vs predicted (terrain · foliage · artificial):

![SimpleUNet GTA V prediction](docs/unet_pred.png)

See [SimpleUNet](https://github.com/rorygh/SimpleUNet) for results and training instructions.

## Getting started
Clone the repository and make sure to init submodules:
```bash
git submodule update --init --recursive
```

Set up whichever components you need  by running the `setup-env.sh` script. Each component's README has full training, evaluation, and visualisation instructions.
