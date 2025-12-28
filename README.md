# dotfiles

Personal dotfiles for macOS development environment.

## Setup

### 1. Install Dependencies

```sh
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# mise (runtime version manager)
brew install mise

# aqua (declarative CLI tool manager)
brew install aquaproj/aqua/aqua
```

### 2. Clone Repository

```sh
git clone https://github.com/nkoji21/dotfiles.git ~/ghq/github.com/nkoji21/dotfiles
```

### 3. Create Personal Git Config

Create `~/.gitconfig.local` with your personal information:

```gitconfig
[user]
	email = your-email@example.com
	name = Your Name
```

### 4. Run Install Script

```sh
cd ~/ghq/github.com/nkoji21/dotfiles
./install.sh
```
