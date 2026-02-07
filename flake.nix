{
  description = "Take Your Time - Flutter time awareness app";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_x-darwin"];
      perSystem = {
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };

        devShells.default = let
          androidComposition = pkgs.androidenv.composeAndroidPackages {
            platformVersions = ["36"];
            buildToolsVersions = ["36.0.0" "28.0.3"];
            includeEmulator = false;
            includeSystemImages = true;
            systemImageTypes = ["google_apis_playstore"];
            abiVersions = ["x86_64"];
            includeNDK = true;
            includeSources = false;
          };
        in
          pkgs.mkShell {
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
              mesa-demos
              androidComposition.androidsdk
            ];

            ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
            ANDROID_SDK_ROOT = "${androidComposition.androidsdk}/libexec/android-sdk";
            ANDROID_AVD_HOME = "$HOME/.android/avd";
            CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";

            shellHook = ''
              echo "=================================="
              echo "Take Your Time - Development Shell"
              echo "=================================="
              echo ""
              echo "⚠️  By using this devshell, you automatically accept:"
              echo "   - Android SDK License"
              echo "   - Unfree package licenses (Android SDK components)"
              echo ""
              echo "Android SDK: $ANDROID_SDK_ROOT"
              echo "AVD Home: $ANDROID_AVD_HOME"
              echo ""

              mkdir -p "$HOME/.android/avd"

              echo "Devshell loaded. Take Your Time."
              echo ""
              if [[ $- == *i* ]]; then
                exec fish
              fi
            '';
          };
      };
    };
}
