vim.api.nvim_create_user_command("ProjectBuild", function ()
    -- Run build_project.sh
    vim.cmd("!sh ./build_project.sh")
end, {desc="Build the project as specified by build_project.sh"})

vim.api.nvim_create_user_command("ProjectRun", function ()
    -- Run run_project.sh
    vim.cmd("!sh ./run_project.sh")
end, {desc="Run the project as specified by run_project.sh"})
