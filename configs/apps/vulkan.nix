{ config, pkgs, libs, ... }:

{
  users.users.nixos.packages = with pkgs; [
    glslang # or shaderc
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers # maybe?
    # glm and whatnot …
  ];
  # If it doesn’t get picked up through nix magic
  #   VULKAN_SDK = "${vulkan-validation-layers}/share/vulkan/explicit_layer.d";
}
