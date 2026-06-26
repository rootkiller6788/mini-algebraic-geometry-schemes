import Lake
open Lake DSL

package «mini-moduli-spaces» where

@[default_target]
lean_lib «MiniModuliSpaces» where
  roots := #[`MiniModuliSpaces]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"

lean_exe «smoke-test» where
  root := `Test.Smoke
  supportInterpreter := true

lean_exe «example-test» where
  root := `Test.Examples
  supportInterpreter := true

lean_exe «regression-test» where
  root := `Test.Regression
  supportInterpreter := true
