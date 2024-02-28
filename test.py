from lean_dojo import LeanGitRepo, trace

repo = LeanGitRepo("https://github.com/zoryzhang/analogyTP_lean", "d63e95f137c10b934910c01ea9dada488031b49f")
trace(repo, dst_dir="traced_lean4-example")