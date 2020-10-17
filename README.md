Readme
======

## Experiments

### XamlSamples

Adapted from <https://github.com/jsuarezruiz/xamarin-forms-gtk-samples/tree/master/XamlSamples>.

```bash
$ cd XamlSamples
$ dotnet restore
$ msbuild
$ mono ./XamlSamples.GTK/bin/Debug/net452/XamlSamples.GTK.exe
```

#### Omnisharp XamlCTask failure

```log
[fail]: OmniSharp.MSBuild.ProjectLoader
        The "XamlCTask" task could not be instantiated from "~/.nuget/packages/xamarin.forms/3.0.0.446417/build/netstandard1.0/Xamarin.Forms.Build.Tasks.dll". 
System.IO.FileNotFoundException: Could not load the file 'Microsoft.Build, Version=15.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.
File name: 'Microsoft.Build, Version=15.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
  at System.AppDomain.Load (System.String assemblyString, System.Security.Policy.Evidence assemblySecurity, System.Boolean refonly, System.Threading.StackCrawlMark& stackMark) [0x00016] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.AppDomain.Load (System.String assemblyString) [0x00002] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at (wrapper remoting-invoke-with-check) System.AppDomain.Load(string)
  at System.Reflection.Assembly.Load (System.String assemblyString) [0x00005] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.Runtime.Serialization.FormatterServices.LoadAssemblyFromString (System.String assemblyName) [0x00000] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.Reflection.MemberInfoSerializationHolder..ctor (System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext context) [0x0002a] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at (wrapper managed-to-native) System.Reflection.RuntimeConstructorInfo.InternalInvoke(System.Reflection.RuntimeConstructorInfo,object,object[],System.Exception&)
  at System.Reflection.RuntimeConstructorInfo.InternalInvoke (System.Object obj, System.Object[] parameters, System.Boolean wrapExceptions) [0x00005] in <76de7e475ebf461fa70313315a8e1a25>:0 
[fail]: OmniSharp.MSBuild.ProjectLoader
        The "XamlCTask" task has been declared or used incorrectly, or failed during construction. Check the spelling of the task name and the assembly name.
[warn]: OmniSharp.MSBuild.ProjectManager
        Failed to load project file '~/dev/jrg-xamarin-experiments/XamlSamples/XamlSamples.GTK/XamlSamples.GTK.csproj'.
~/dev/jrg-xamarin-experiments/XamlSamples/XamlSamples.GTK/XamlSamples.GTK.csproj
~/.nuget/packages/xamarin.forms/3.0.0.446417/build/netstandard1.0/Xamarin.Forms.targets(92,3): Error: The "XamlCTask" task could not be instantiated from "~/.nuget/packages/xamarin.forms/3.0.0.446417/build/netstandard1.0/Xamarin.Forms.Build.Tasks.dll". 
System.IO.FileNotFoundException: Could not load the file 'Microsoft.Build, Version=15.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.
File name: 'Microsoft.Build, Version=15.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
  at System.AppDomain.Load (System.String assemblyString, System.Security.Policy.Evidence assemblySecurity, System.Boolean refonly, System.Threading.StackCrawlMark& stackMark) [0x00016] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.AppDomain.Load (System.String assemblyString) [0x00002] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at (wrapper remoting-invoke-with-check) System.AppDomain.Load(string)
  at System.Reflection.Assembly.Load (System.String assemblyString) [0x00005] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.Runtime.Serialization.FormatterServices.LoadAssemblyFromString (System.String assemblyName) [0x00000] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at System.Reflection.MemberInfoSerializationHolder..ctor (System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext context) [0x0002a] in <76de7e475ebf461fa70313315a8e1a25>:0 
  at (wrapper managed-to-native) System.Reflection.RuntimeConstructorInfo.InternalInvoke(System.Reflection.RuntimeConstructorInfo,object,object[],System.Exception&)
  at System.Reflection.RuntimeConstructorInfo.InternalInvoke (System.Object obj, System.Object[] parameters, System.Boolean wrapExceptions) [0x00005] in <76de7e475ebf461fa70313315a8e1a25>:0 
~/.nuget/packages/xamarin.forms/3.0.0.446417/build/netstandard1.0/Xamarin.Forms.targets(92,3): Error: The "XamlCTask" task has been declared or used incorrectly, or failed during construction. Check the spelling of the task name and the assembly name.

[fail]: OmniSharp.MSBuild.ProjectManager
        Attempted to update project that is not loaded: ~/dev/jrg-xamarin-experiments/XamlSamples/XamlSamples.GTK/XamlSamples.GTK.csproj

```



## Issues

### Nipkgs

#### Rep

 -  [Nix + DotNet / Mono; overcoming "You must add a reference to assembly 'netstandard'" - Learn - NixOS Discourse](https://discourse.nixos.org/t/nix-dotnet-mono-overcoming-you-must-add-a-reference-to-assembly-netstandard/8190/8)

     -  [Using the ReferenceAssemblies NuGet package to build .NET Framework libraries on Linux, without installing Mono](https://andrewlock.net/using-reference-assemblies-to-build-net-framework-libararies-on-linux-without-mono/)

        According to this, one can *completely replace mono with dotnet sdk* and
        instead add a `PackageReference` to
        `Microsoft.NETFramework.ReferenceAssemblies` (as `PrivateAssets="All"`).

         -  [dotnet/releases/reference-assemblies at master · microsoft/dotnet](https://github.com/Microsoft/dotnet/tree/master/releases/reference-assemblies)

            Official doc.

            `$ msbuild /t:restore && msbuild`

            Does it work with dotnet build too?

     -  [Build for desktop framework on non-windows platforms · Issue #335 · dotnet/sdk](https://github.com/dotnet/sdk/issues/335#issuecomment-497976291)

         >  On top of that, **this will be the supported approach from now on**. But
         >  it gets better - in the .NET Core 3.0 SDK, the reference assembly
         >  packages will be automatically used if necessary, so in theory
         >  there's no workarounds required at all!


#### Oudated mono

 -  [Mono 6.10 (existing mono is 6.0, outdated) · Issue #92984 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/92984)

 -  [mono5: 5.20.1.27 -> 5.20.1.34, mono6: 6.0.0.313 -> 6.10.0.104 by dasj19 · Pull Request #93043 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/93043)

 -  [Nix + DotNet / Mono; overcoming "You must add a reference to assembly 'netstandard'" - Learn - NixOS Discourse](https://discourse.nixos.org/t/nix-dotnet-mono-overcoming-you-must-add-a-reference-to-assembly-netstandard/8190/8)

    Talks about dirty `export FrameworkPathOverride=${pkgs.mono}/lib/mono/4.7.2-api` workaround.


#### Broken monodevelop

 -  [monodevelop: mark broken · NixOS/nixpkgs@6b4abb9](https://github.com/NixOS/nixpkgs/commit/6b4abb9fa74368fb0760f59ab9c70c9e1657f0ed)

 -  [Monodevelop fails to build · Issue #37751 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/37751)
