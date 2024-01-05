#!/bin/sh
# inherited from https://github.com/release-lab/install

echo "Installing Quix CLI"

set -e

get_arch() {
    # darwin/amd64: Darwin axetroydeMacBook-Air.local 20.5.0 Darwin Kernel Version 20.5.0: Sat May  8 05:10:33 PDT 2021; root:xnu-7195.121.3~9/RELEASE_X86_64 x86_64
    # linux/amd64: Linux test-ubuntu1804 5.4.0-42-generic #46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
    a=$(uname -m)
    case ${a} in
        "x86_64" | "amd64" )
            echo "x64"
        ;;
        "aarch64" | "arm64" | "arm")
            echo "arm64"
        ;;        
        *)
            echo ${NIL}
        ;;
    esac
}

get_os(){
    os=$(uname -s | awk '{print tolower($0)}')
    if [ "$os" == "darwin" ]; then
        echo "osx"
    else
        echo "$os"
    fi
}

sign_binary() {
    os=$1
    executable=$2
    if [ "$os" == "osx" ]; then
        echo "Signing '${executable}'"
        codesign -s - "${executable}"
    fi
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
mkdir -p ${downloadFolder} # make sure download folder exists
os=$(get_os)
arch=$(get_arch)
file_extension="tar.gz"
file_name="${os}-${arch}.${file_extension}" # the file name should be download

downloaded_file="${downloadFolder}/${file_name}" # the file path should be download
executable_folder="/usr/local/bin" # Eventually, the executable file will be placed here

# if version is empty
if [ -z "$version" ]; then
    asset_uri="${githubUrl}/${owner}/${repo}/releases/latest/download/${file_name}"
else
    asset_uri="${githubUrl}/${owner}/${repo}/releases/download/${version}/${file_name}"
fi

echo "[1/5] Detected '${os}-${arch}' architecture"
echo "[2/5] Downloading '${asset_uri}' to '${downloadFolder}'"
curl --fail --location --output "${downloaded_file}" "${asset_uri}"

echo "[3/5] Installing '${exe_name}' to '${executable_folder}'"
tar -xzf "${downloaded_file}" -C "${executable_folder}"

exe="${executable_folder}/${exe_name}"
chmod +x "${exe}"

sign_binary "$os" "$exe"  # Sign the binary for macOS

echo "[4/5] Cleaning '${downloaded_file}'"
rm -f ${downloaded_file}

echo "[5/5] Adding '${exe_name}' to the environment variables"
if command -v $exe_name --version >/dev/null; then
    echo "Quix CLI was installed successfully"
else
    echo "We couldn't add '${exe_name}' to the environment variables"
    echo "Manually add the directory to your \$HOME/.bash_profile (or similar)"
    echo "  export PATH=${executable_folder}:\$PATH"
fi

echo "Run '${exe_name} --help' to get started"
exit 0
