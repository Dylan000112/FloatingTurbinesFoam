### Wind Turbine & Wave Coupling Modules (`src` Extensions)

* **`floatingSixDoFRigidMotion`**: Adapted directly from the `FloatingTurbine` framework without modifications to maintain full compatibility with core rigid body motion libraries.
* **`floatingTurbinesFoam`**: Core solver and class implementations derived from `FloatingTurbine` for coupled aero-hydro-elastic simulations of floating wind turbines.
  * **Parallel & Actuator Line Optimizations**:
  * *Parallel `findCell` Bug Fix*: Resolved a critical OpenFOAM parallel computing bug documented by Pere Frontera. In parallel simulations, the standard `findCell` method contains an algorithmic flaw where it genuinely fails to locate the inflow velocity point, despite it being physically inside the domain (throwing the `"Inflow velocity point not found in mesh"` error). This patch fixes the spatial search logic, ensuring robust point localization and stable MPI execution.
  * *Motion Synchronization*: Fixed a position tracking mismatch within `actuatorLineSource.C`, guaranteeing that the turbine's actuator line coordinates remain perfectly synchronized with the real-time 6-DoF kinematics of the floating platform.
* **`olaFlow` (`genAbs_wwc`)**: Coupled integration with the `olaFlow` wave-generation framework. It introduces the custom `genAbs_wwc` boundary condition, enabling the simultaneous generation and active absorption of fully coupled wind-wave-current fields.
* **`olaFlow_supplementary`**: Implements stabilized turbulence models tailored for free-surface wave simulations, effectively eliminating the non-physical overproduction of turbulence in the water column.
