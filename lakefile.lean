import Lake
open Lake DSL

package «my_project» {
  -- add any package configuration options here
  moreLinkArgs := #["-L./.lake/packages/LeanCopilot/.lake/build/lib", "-lctranslate2"]
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «MyProject» {
  -- add any library configuration options here
}

require LeanCopilot from git "https://github.com/lean-dojo/LeanCopilot.git" @ "v1.1.1"
