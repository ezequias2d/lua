
add_rules("mode.debug", "mode.release")
add_rules("plugin.compile_commands.autoupdate", {outputdir = ".vscode"})

target("lua")
    set_kind("static")
    add_files("*.c")
    add_headerfiles("*.h")
    add_includedirs(".", {public = true})
    remove_files("lua.c", "luac.c", "onelua.c")
    
    if is_plat("linux") then
        add_defines("LUA_USE_LINUX")
    end
