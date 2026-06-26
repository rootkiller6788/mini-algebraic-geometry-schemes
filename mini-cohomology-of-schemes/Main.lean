import MiniCohomologyOfSchemes
open MiniCohomologyOfSchemes

#eval P1_h0_O_d 0
#eval P1_h0_O_d 2
#eval P1_h1_O_d (-2)
#eval P1_euler_characteristic 0
#eval P1_euler_characteristic 3
#eval P2_h0_O_d 1
#eval P2_h0_O_d 2
#eval riemann_roch_curve 0 2
#eval riemann_roch_curve 1 0
#eval genus_from_h1 1
#eval elliptic_cohomology 0
#eval elliptic_cohomology 1
#eval cohom_P1_h0_table
#eval cohom_P1_h1_table
#eval chi_P1_full 0
#eval chi_P1_full (-2)
#eval K3_surface_cohom 0
#eval K3_surface_cohom 1
#eval K3_surface_cohom 2
#eval M_g_dim 2
#eval M_g_dim 3
#eval Pn_motivicDecomposition 2
#eval standardConjectures

def main : IO Unit := IO.println "MiniCohomologyOfSchemes: Build successful!"
