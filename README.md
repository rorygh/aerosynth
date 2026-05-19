# aerosynth

Pipeline for synthetic aerial forestry stereo dataset generation, stereo depth estimation, and semantic segmentation.

## Submodules

| Submodule | Description |
|---|---|
| [SynthBlend](SynthBlend/) | Synthetic stereo dataset generation using BlenderProc — renders aerial forest scenes with depth, disparity, and category segmentation ground truth |
| [RAFT-Stereo](RAFT-Stereo/) | RAFT-Stereo fine-tuned on SynthBlend for stereo depth estimation |
| [SimpleUNet](SimpleUNet/) | UNet trained on SynthBlend for aerial forest semantic segmentation |

## Pod setup

Run once on a new pod (before cloning):

```bash
GH_TOKEN=<your_token> bash setup-pod.sh
```

Sets up git identity, installs system packages (unzip, rclone), installs Miniconda, and clones this repo with all submodules into `/workspace/aerosynth`.

## Workflow

1. **Generate data** — run `SynthBlend` to render stereo scenes
2. **Train stereo model** — fine-tune `RAFT-Stereo` on the rendered output
3. **Train segmentation model** — train `SimpleUNet` on the rendered output

Each submodule has its own `setup-env.sh` and README with per-component instructions.
