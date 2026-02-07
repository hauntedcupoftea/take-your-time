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
            buildToolsVersions = ["35.0.0"];
            includeEmulator = false;
            includeSystemImages = false;
            includeNDK = true;
            cmdLineToolsVersion = "latest";
            cmakeVersions = ["3.22.1"];
            ndkVersions = ["28.2.13676358"];
            includeSources = false;
          };
        in
          pkgs.mkShell {
            buildInputs = with pkgs; [
              flutter
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
              androidComposition.androidsdk
            ];

            ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
            ANDROID_SDK_ROOT = "${androidComposition.androidsdk}/libexec/android-sdk";
            ANDROID_NDK_ROOT = "${androidComposition.androidsdk}/libexec/android-sdk/ndk/28.2.13676358";

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

              export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [
                pkgs.stdenv.cc.cc.lib
                pkgs.zlib
              ]}:$LD_LIBRARY_PATH"

              echo ""
              echo "Verifying SDK location..."
              echo "ANDROID_HOME: $ANDROID_HOME"
              echo "ANDROID_SDK_ROOT: $ANDROID_SDK_ROOT"

              echo ""
              echo "To use Waydroid:"
              echo "  1. Start Waydroid: waydroid session start &"
              echo "  2. Show UI: waydroid show-full-ui"
              echo "  3. Connect ADB: adb connect 192.168.250.2:5555"
              echo "  4. Run Flutter: flutter run"
              echo ""
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
