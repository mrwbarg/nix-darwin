{ lib }:
{
  deobfuscateEmail =
    obfuscated:
    lib.replaceStrings [ "--AT--" "--DOT--" "--DASH--" "--PLUS--" ] [ "@" "." "-" "+" ] obfuscated;
}
