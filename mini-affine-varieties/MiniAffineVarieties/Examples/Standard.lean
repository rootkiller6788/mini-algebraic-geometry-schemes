/-
# MiniAffineVarieties.Examples.Standard
L6 Canonical Examples with #eval verification.
-/
import MiniAffineVarieties.Core.Basic

namespace MiniAffineVarieties

open PolyExpr

set_option maxHeartbeats 600000

def parabolaPoly : PolyExpr 2 := .sub (.var ⟨1, by decide⟩) (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
def axesPoly : PolyExpr 2 := .mul (.var ⟨0, by decide⟩) (.var ⟨1, by decide⟩)
def cuspPoly : PolyExpr 2 := .sub (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩)) (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.var ⟨0, by decide⟩))
def nodePoly : PolyExpr 2 := .sub (.sub (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩)) (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.var ⟨0, by decide⟩))) (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
def ellipticPoly : PolyExpr 2 := .sub (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩)) (.add (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.var ⟨0, by decide⟩)) (.var ⟨0, by decide⟩))
def hyperbolaPoly : PolyExpr 2 := .sub (.mul (.var ⟨0, by decide⟩) (.var ⟨1, by decide⟩)) (.const 1)
def circlePoly : PolyExpr 2 := .sub (.add (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩))) (.const 1)
def spherePoly : PolyExpr 3 := .sub (.add (.add (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩))) (.mul (.var ⟨2, by decide⟩) (.var ⟨2, by decide⟩))) (.const 1)
def whitneyPoly : PolyExpr 3 := .sub (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩)) (.mul (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩)) (.var ⟨2, by decide⟩))

#eval eval parabolaPoly (fun _ => 0)
#eval eval parabolaPoly (fun i => match i with | ⟨0,_⟩ => 2 | ⟨1,_⟩ => 4)
#eval eval axesPoly (fun i => match i with | ⟨0,_⟩ => 0 | ⟨1,_⟩ => 42)
#eval eval cuspPoly (fun _ => 0)
#eval eval cuspPoly (fun i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => (-1 : Int))
#eval eval nodePoly (fun _ => 0)
#eval eval ellipticPoly (fun _ => 0)
#eval eval hyperbolaPoly (fun i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 1)
#eval eval circlePoly (fun i => match i with | ⟨0,_⟩ => 0 | ⟨1,_⟩ => 1)
#eval eval spherePoly (fun i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 0 | ⟨2,_⟩ => 0)
#eval eval whitneyPoly (fun i => match i with | ⟨0,_⟩ => 0 | ⟨1,_⟩ => 0 | ⟨2,_⟩ => 5)

theorem parabola_point_proof : eval parabolaPoly (fun i => match i with | ⟨0,_⟩ => 2 | ⟨1,_⟩ => 4) = 0 := by native_decide
theorem axes_point_proof : eval axesPoly (fun i => match i with | ⟨0,_⟩ => 0 | ⟨1,_⟩ => 42) = 0 := by native_decide
theorem cusp_origin_proof : eval cuspPoly (fun _ => 0) = 0 := by native_decide
theorem node_origin_proof : eval nodePoly (fun _ => 0) = 0 := by native_decide
theorem elliptic_origin_proof : eval ellipticPoly (fun _ => 0) = 0 := by native_decide
theorem circle_points_proof : eval circlePoly (fun i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 0) = 0 := by native_decide
theorem hyperbola_point_proof : eval hyperbolaPoly (fun i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 1) = 0 := by native_decide

end MiniAffineVarieties