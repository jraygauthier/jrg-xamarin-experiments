{pkgs ? null} @ args:
let
  pinnedNixpkgsSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/f1f038331f538550072acd8845f2138de23cb401.tar.gz";
    # Get this info from the output of: `nix-prefetch-url --unpack $url` where `url` is the above.
    sha256 = "1y5gnbikhyk7bfxqn11fk7y49jad9nlmaq1mr4qzj6fnmrh807js";
  };

  pinnedNixpkgs = import pinnedNixpkgsSrc {
    config = { allowBroken = false; };
  };

  pkgs = if args ? "pkgs" then args.pkgs else pinnedNixpkgs;
in

with pkgs;

let
  mono = mono6;

  dotnetCoreCombined = with dotnetCorePackages; combinePackages [
    sdk_3_1
    sdk_3_0
    sdk_2_1
  ];

in

mkShell {
  name = "dotnet-env";
  buildInputs = [
    (with dotnetCorePackages; combinePackages [
      sdk_3_1
      sdk_3_0
      sdk_2_1
    ])
    dotnetPackages.Nuget
    mono
    fsharp
    dotnetPackages.NUnit
    gtk-sharp-2_0
    # gtk-sharp-3_0
    gnome-sharp
    # monodevelop
    msbuild
    pkgconfig
  ];

  # Allow us to use dotnet tools such as dotnet ef.
  shellHook = ''
    export "DOTNET_ROOT=${dotnetCoreCombined}"
    export "PATH=$HOME/.dotnet/tools:$PATH"
    # Required by msbuild:
    export "GTK_SHARP_AssemblySearchPaths=${gtk-sharp-2_0}/lib/mono/gtk-sharp-2.0;${glib.out}/lib:${gtk2-x11}/lib;${gnome2.libglade}/lib;${gtk-sharp-2_0}/lib"
    # Required by mono when running the application (run time):
    export "MONO_PATH=${gtk-sharp-2_0}/lib/mono/gtk-sharp-2.0:${glib.out}/lib:${gtk2-x11}/lib:${gnome2.libglade}/lib:${gtk-sharp-2_0}/lib"
    # Required by the csharp assembly at runtime:
    export "LD_LIBRARY_PATH=${glib.out}/lib:${gtk2-x11}/lib:${gnome2.libglade}/lib:${gtk-sharp-2_0}/lib"
  '';
}
