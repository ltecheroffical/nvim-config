local function get_finished_terminal()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf)
			and vim.bo[buf].buftype == "terminal"
		then
			local job_id = vim.b[buf].terminal_job_id
			if job_id == nil or vim.fn.jobwait({ job_id }, 0)[1] ~= -1 then
				return buf
			end
		end
	end
	return nil
end

local function run_in_terminal(command)
	local dead_buf = get_finished_terminal()

	if dead_buf then
		local info = vim.fn.getbufinfo(dead_buf)[1]
		if #info.windows > 0 then
			vim.api.nvim_set_current_win(info.windows[1])
		else
			vim.cmd('below split')
			vim.api.nvim_set_current_buf(dead_buf)
		end
		vim.cmd('enew')
		vim.cmd('term ' .. command)
		vim.cmd('bdelete! ' .. dead_buf)
	else
		vim.cmd('below split | term ' .. command)
	end
end

vim.api.nvim_create_user_command("ProjectBuild", function()
	if io.open(vim.fn.getcwd() .. "/build_project.sh") == nil then
		print("No build_project.sh found in this directory")
		return
	end
	run_in_terminal('/bin/sh build_project.sh')
end, { desc = "Build the project as specified by build_project.sh" })

vim.api.nvim_create_user_command("ProjectRun", function()
	if io.open(vim.fn.getcwd() .. "/run_project.sh") == nil then
		print("No run_project.sh found in this directory")
		return
	end
	run_in_terminal('/bin/sh run_project.sh')
end, { desc = "Run the project as specified by run_project.sh" })
