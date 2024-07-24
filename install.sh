#!/bin/sh
# Inspired by https://github.com/release-lab/install

echo "Installing Quix CLI"

set -e

get_arch() {
    a=$(uname -m)
    case ${a} in
        "x86_64" | "amd64" )
            echo "x64"
        ;;
        "aarch64" | "arm64" | "arm")
            echo "arm64"
        ;;        
        *)
            echo "unsupported"
        ;;
    esac
}

get_os() {
    os=$(uname -s | awk '{print tolower($0)}')
    if [ "$os" = "darwin" ]; then
        echo "osx"
    else
        echo "$os"
    fi
}

# Function to sign the binary
sign_binary() {
    os=$1
    executable=$2
    use_sudo=${3:-false}  # Set default value to false if not provided explicitly

    if [ "$os" = "osx" ]; then
        echo "Signing '${executable}'"
        if [ "$use_sudo" = "true" ]; then
            sudo codesign -s - "${executable}"
        else
            codesign -s - "${executable}"
        fi
    fi
}

# Function to add path to profile files and return if updated
add_to_path() {
    profile_file=$1
    if [ -f "$profile_file" ]; then
        if ! grep -q "$HOME/.local/bin" "$profile_file"; then
            echo 'export PATH=$HOME/.local/bin:$PATH' >> "$profile_file"
            return 0
        fi
    fi
    return 1
}

# Parse arguments
for i in "$@"; do
    case $i in
        -v=*|--version=*)
            version="${i#*=}"
            shift # past argument=value
        ;;
        *)
            # unknown option
        ;;
    esac
done

owner="quixio"
repo="quix-cli"
githubUrl="https://github.com"
exe_name="quix"

downloadFolder="${TMPDIR:-/tmp}"
mkdir -p "${downloadFolder}" # make sure download folder exists
os=$(get_os)
arch=$(get_arch)

if [ "$arch" = "unsupported" ]; then
    echo "Unsupported architecture: ${arch}"
    exit 1
fi

file_extension="tar.gz"
file_name="${os}-${arch}.${file_extension}" # the file name to download

downloaded_file="${downloadFolder}/${file_name}" # the file path to download
default_executable_folder="$HOME/.local/bin" # Default to user local bin folder

# Check if executable is already installed in /usr/local/bin
if [ -x "/usr/local/bin/${exe_name}" ]; then
    executable_folder="/usr/local/bin"
else
    executable_folder="$default_executable_folder"
    mkdir -p "${executable_folder}"
fi

# if version is empty
if [ -z "$version" ]; then
    asset_uri="${githubUrl}/${owner}/${repo}/releases/latest/download/${file_name}"
else
    asset_uri="${githubUrl}/${owner}/${repo}/releases/download/${version}/${file_name}"
fi

echo "[1/5] Detected '${os}-${arch}' architecture"
echo "[2/5] Downloading '${asset_uri}' to '${downloaded_file}'"
curl --fail --location --output "${downloaded_file}" "${asset_uri}"

echo "[3/5] Installing '${exe_name}' to '${executable_folder}'"
if [ ! -w "${executable_folder}" ]; then
    echo "Permission denied for ${executable_folder}. Trying with sudo..."
    sudo tar -xzf "${downloaded_file}" -C "${executable_folder}"
    exe="${executable_folder}/${exe_name}"
    sudo chmod +x "${exe}"
    sign_binary "$os" "$exe" "true"
else
    tar -xzf "${downloaded_file}" -C "${executable_folder}"
    exe="${executable_folder}/${exe_name}"
    chmod +x "${exe}"
    sign_binary "$os" "$exe"
fi

echo "[4/5] Cleaning '${downloaded_file}'"
rm -f "${downloaded_file}"

# Check if PATH includes $HOME/.local/bin and update profile files if necessary
profile_updated=false
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    echo "$HOME/.local/bin is not in your PATH. Adding it now."

    if [ "$os" = "osx" ]; then
        add_to_path "$HOME/.zshrc" && profile_updated=true
        add_to_path "$HOME/.bash_profile" && profile_updated=true
    else
        add_to_path "$HOME/.profile" && profile_updated=true
        add_to_path "$HOME/.bashrc" && profile_updated=true
    fi
fi

if $profile_updated; then
    echo "Quix CLI was installed successfully, but you need to reload your shell for the changes to take effect."
else
    if command -v $exe_name --version >/dev/null; then
        echo "Quix CLI was installed successfully"
    else
        echo "We couldn't verify the installation of '${exe_name}'."
        echo "Please ensure that the directory is in your PATH and try again:"
        echo "  export PATH=${executable_folder}:\$PATH"
    fi
fi

echo "Run '${exe_name} --help' to get started"

exit 0
