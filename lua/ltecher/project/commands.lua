local function show_terminal()
    local terminal_buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal"
    end, vim.api.nvim_list_bufs())

    if #terminal_buffers == 0 then
        vim.cmd('below split')
        vim.cmd('terminal')
        return
    else
        if vim.fn.getbufinfo(terminal_buffers[1])[1].hidden == 1 then
            vim.cmd('below split')
            vim.api.nvim_set_current_buf(terminal_buffers[1])
        else
            vim.api.nvim_set_current_win(vim.fn.getbufinfo(terminal_buffers[1])[1].windows[1])
        end
    end
end

vim.api.nvim_create_user_command("ProjectBuild", function ()
    if io.open(vim.fn.getcwd() .. "/build_project.sh") == nil then
        print("No build_project.sh found in this directory")
        return
    end

    show_terminal()

    vim.fn.feedkeys('a')
    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("/bin/sh build_project.sh")
    vim.fn.feedkeys(enter)
end, {desc="Build the project as specified by build_project.sh"})

vim.api.nvim_create_user_command("ProjectRun", function ()
    if io.open(vim.fn.getcwd() .. "/run_project.sh") == nil then
        print("No run_project.sh found in this directory")
        return
    end

    show_terminal()

    vim.fn.feedkeys('a')
    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

    vim.fn.feedkeys("/bin/sh run_project.sh")
    vim.fn.feedkeys(enter)
end, {desc="Run the project as specified by run_project.sh"})
