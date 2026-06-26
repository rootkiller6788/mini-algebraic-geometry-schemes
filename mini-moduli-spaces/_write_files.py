
import os

def w(path, content):
    dirname = os.path.dirname(path)
    if dirname:
        os.makedirs(dirname, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

# lakefile.lean
w("lakefile.lean", """import Lake
open Lake DSL

package «mini-moduli-spaces» where

@[default_target]
lean_lib «MiniModuliSpaces» where
  roots := #[Test.Smoke
  supportInterpreter := true

lean_exe «example-test» where
  root := Test.Regression
  supportInterpreter := true
""")

print("lakefile done")
