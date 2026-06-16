-- Hypr-Deb entry config: upstream example/hyprland.lua split into
-- one module per section. Edit the module files in this directory;
-- this file only sets the load order.
-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
require("monitors")
require("my-programs")
require("autostart")
require("environment-variables")
require("permissions")
require("look-and-feel")
require("misc")
require("input")
require("keybindings")
require("windows-and-workspaces")
require("hypr-deb")
