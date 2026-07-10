-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function executable(path)
  return path and vim.fn.executable(path) == 1
end

local function project_root()
  local marker = vim.fs.find({ "uv.lock", "pyproject.toml", ".git" }, {
    path = vim.uv.cwd(),
    upward = true,
  })[1]

  if not marker then
    return nil
  end

  return vim.fn.fnamemodify(marker, ":p:h")
end

local function python_from_venv(venv)
  for _, name in ipairs({ "python", "python3" }) do
    local python = venv and (venv .. "/bin/" .. name)
    if executable(python) then
      return python
    end
  end
end

local root = project_root()
local project_venv = root and (root .. "/.venv")
local nvim_python_venv = vim.fn.stdpath("data") .. "/python/.venv"

local venvs = {}
local function add_venv(venv)
  if venv then
    table.insert(venvs, venv)
  end
end

add_venv(vim.env.VIRTUAL_ENV)
add_venv(vim.env.CONDA_PREFIX)
add_venv(project_venv)
add_venv(nvim_python_venv)

for _, venv in ipairs(venvs) do
  local python = python_from_venv(venv)

  if python then
    vim.g.python3_host_prog = python

    if venv == project_venv then
      vim.env.PATH = venv .. "/bin:" .. vim.env.PATH
      vim.env.VIRTUAL_ENV = venv
      vim.g.uv_python_venv = venv
      vim.g.uv_kernel_name = vim.fn.fnamemodify(root, ":t")
    end

    break
  end
end
