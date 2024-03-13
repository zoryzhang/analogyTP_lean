import Lake
open Lake DSL

package «examples» {
  -- add any package configuration options here
}

@[default_target]
lean_lib «examples» {
  -- add any library configuration options here
}

require mathlib from git
    "https://github.com/leanprover-community/mathlib4"