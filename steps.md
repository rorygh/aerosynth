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

# Running RAFT-Stereo
## Creating the Pod
I will later turn this into a dockerfile
- Created new pod
  - PyTorch template: runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04
  - 60 GB volume storage (non-persistent)
- It gave me this sample commmand to connect to the pod
```bash
ssh root@213.173.105.26 -p 19233 -i ~/.ssh/id_ed25519
```
- I replaced my ssh config with the updated runpod info using this bash command:
```bash
cat > ~/.ssh/config << 'EOF'
Host runpod
    HostName 213.173.105.26
    User root
    Port 19233
    IdentityFile ~/.ssh/id_ed25519
EOF
```
- After running `ssh runpod`, I created and cloned the repository;
```bash
cd /workspace && git clone https://github.com/princeton-vl/RAFT-Stereo.git
```
- I permenantly enabled vim key bindings for the terminal with this command:
```bash
echo "set -o vi" >> ~/.bashrc
```
- I then removed the existing git history and origin, and re-initialized git:
```bash
cd RAFT-Stereo && rm -rf .git && git init
```
- I ensured that the remote repository was correct with:
```bash
git remote -v
```
- I went to github and created my own private RAFT-Stereo repository at `https://github.com/rorygh/RAFT-Stereo.git`
- I set the new remote origin:
```bash
git remote add origin https://github.com/rorygh/RAFT-Stereo.git
```
- I configured my name and email like this
```bash
git config --global user.name "Rory M" && git config --global user.email "rory@mcclenagan.net"
```
- Before commiting, I went to GitHub → Settings → Developer Settings → Personal Access Tokens → Tokens (classic) and generated a new (classic) token named "runpod" with "repo" scope (I will try using a secret another time)
- I then used the token to set the remote:
```bash
git remote set-url origin https://rorygh:$TOKEN_HERE@github.com/rorygh/RAFT-Stereo.git
```
- I did my initial commit like this:
```bash
git add . && git commit -m "Initial commit" && git push -u origin master
```
- Connected in VSCode via the "Remote-SSH: Connect to Host" command
- Installed Python Claude Code extension in VSCode on SSH
- In the remote settings had to add this line
```
    "python.useEnvironmentsExtension": true
```
- Created a basic requirements file:
```
matplotlib
tensorboard
scipy
opencv-python-headless
tqdm
opt_einsum
imageio
scikit-image
```
- Installed with pip
- Installed unzip to allow for data downloads:
```
apt-get update && apt-get install -y unzip
apt-get install -y p7zip-full
```
- Ran both data download scripts
- Ran the model downlaod script
- Ran demo:
```bash
python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ETH3D/two_view_testing/*/im0.png -r=datasets/ETH3D/two_view_testing/*/im1.png
```

- 
- 
