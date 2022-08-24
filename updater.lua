-- 配置AstroNvim更新
  return {
    remote = "origin", -- 要使用的远程
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- 更新版本或者tag (STABLE ONLY)
    branch = "main", -- 更新依赖分支 (NIGHTLY ONLY)
    commit = nil, -- 更新到某个提交 (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- 跳过有关中断更改的提示
    show_changelog = true, -- 执行更新后显示更改日志
  }
