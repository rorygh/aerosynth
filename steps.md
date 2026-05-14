- Use AirGPU
  - US West Oregon - 60 ms delay
  - airgpu-4ffd752226+-
  - 4ffd752226.my.airgpu.com address
  - Nvidia L4
  - ADM EPYC 3.7 GhZ, 8 vCPU, 32 gB ram
  - 500 gb storage
  - Win 11
  - $1.40 per hour
  - Paid Saphire 5/12
- Used Moonlight
- Ctrl+alt+shift+q disconnect
- Created steam account
- Created rockstar account
- Installed rockstar launcher
- Cloned the repository https://github.com/David0tt/DeepGTAV
- Installed Visual Studio 2022 (https://www.junian.dev/tech/visual-studio-community-download-links/)
  - "Desktop developement with C++" and "Game Developement with C++" selected
- Installed `git` (`winget install Git.Git`)
- Did not download recent copy of scripthook and instead downgraded GTAV
- Originally replaced the save game data in Documents/Rockstar Games/GTA V/Profiles/ with the contents of DeepGTAV-PreSIL/bin/SaveGame
- Used Nightlight Launcher to allow for downgrade (https://github.com/onajlikezz/Nightlight-Game-Launcher/releases)
- With the new launher, instead copied the savegame data to the new alternate location at `C:\Users\user\AppData\Roaming\Goldberg SocialClub Emu Saves\GTA V\0F74F4C4`
- Used manual downgrade (https://drive.google.com/file/d/1Nk4B2-SDRO3ZNWNmYQWnyLYhsM34GOrG/view?pli=1) TODO: where did this come from?
- After running downgrade created an alternate launcher with Nightlight
- Installed miniconda
- Created conda environment with
```
conda create -n DeepGTAV numpy ipykernel opencv matplotlib zeromq
```
- Ran the following to test data collection:
  - First opened DeepGTAV through Nightlight
  -
    ```
    cd c:/scripts/DeepGTAV/VPilot && conda activate DeepGTAV && python .\presentation_VisDrone.py --save_dir "C:\temp"
    ```

# Stereo Forestry Refrences
- https://www.researchgate.net/publication/401132088_Training_Deep_Stereo_Matching_Networks_on_Tree_Branch_Imagery_A_Benchmark_Study_for_Real-Time_UAV_Forestry_Applications
- Stereo model idea: https://github.com/princeton-vl/RAFT-Stereo.git
- Ideas for how to benchmark stereo: https://www.cvlibs.net/datasets/kitti/eval_scene_flow.php?benchmark=stereo
- 3D segmentation model ideas: https://github.com/facebookresearch/sparseconvnet
- Simple imporved pointnet type architecture: https://github.com/guochengqian/pointnext

# Reference GTA Mods
- See the original DeepGTAV mods: https://github.com/aitorzip/DeepGTAV
- The old PreSil version: https://github.com/bradenhurl/DeepGTAV-PreSIL
- 