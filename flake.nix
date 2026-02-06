{
  description = "Take Your Time - Flutter time awareness app";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            flutter
            android-tools
            jdk17
            cmake
            ninja
            pkg-config
            gtk3
            pcre
            libepoxy
            scrcpy
            git
            watchexec
          ];

          shellHook = ''
            export ANDROID_HOME="$HOME/Android/Sdk"
            export ANDROID_SDK_ROOT="$ANDROID_HOME"
            export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
            export CHROME_EXECUTABLE="${pkgs.chromium}/bin/chromium"
            export FLUTTER_ROOT="${pkgs.flutter}"
            export PATH="$HOME/.pub-cache/bin:$PATH"

            echo "🎮 Take Your Time dev environment loaded"
            echo "Run 'flutter doctor' to verify setup"
            echo ""
            echo "Quick commands:"
            echo "  flutter run -d linux        # Run on Linux desktop"
            echo "  flutter run -d chrome       # Run in browser"
            echo "  flutter run                 # Run on connected device/emulator"
            echo "  flutter pub get             # Install dependencies"
          '';
        };
      };
    };
}
