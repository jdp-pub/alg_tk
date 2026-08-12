# Introduction

This document records project implemented changes, planned changes, and potential directions. 

The version history follows [Semantic Versioning](https://semver.org/). 

Release dates are mm/dd/yyyy format.

## Ideas for the future

### Adjustments
- Adaptive integration in methods that require it.
- QR algorithm should be made implicitly shifted.
- relative and absolute tolerances.

### Compute
- Adjustable CPU/GPU multiprocessing routines/wrappers.
- pretty much everything will need to be adjusted to ensure competive speed. 
- "!" function versions, mutate state rather than make copies.
- Support for sparse matrices and arrays.

### Features
- Adaptive integration.
- Graph sorts.
- Optimal path solvers.
- Complete eigenvalue implementation (similar to LAPACK,ARPACK functionality).
- Reimplement some LAPACK,ARPACK functions natively, see if native can compete with wrapper implementations.
- Tensor network solvers.


---
Begin Version History
---
# v0.3.0 (Planned)
This update focuses on expanding core functionality, basic functionality in matrix operations; keeping scalability in mind. Future updates will adress optomizations to make the package competetive. This has not been tested for breaks with v0.2.0. Breaks should be expected.

## Add

### Source
- bessel.jl
    - ja: Bessel functions of the first kind
    - jn: spherical Bessel functions of the first kind
    - ia: modified Bessel functions of the first kind
    - ya: Bessel functions of the second kind
    - yn: spherical Bessel functions of the second kind
    - ka: modified Bessel functions of the second kind
    - ha1: Hankel functions of the first kind
    - ha2: Hankel functions of the second kind
    - hn1: Spherical Hankel functions of the first kind
    - hn2: Spherical Hankel functions of the second kind
- matrices.jl
    - dot(Matrix): Frobenius inner product.
    - contract(Matrix)
    - lpnorm(Matrix)
    - normalize(Matrix)
    - inv
    - det: determinant
    - MBO: Implement general matrix sizes.
- matrix_solvers.jl
    - eig_vals: Add other methods, arnoldi, lanczos, modularize
    - absolute and relative tolerances
- polynomial.jl
    - polyroots: modularize methods
    - newton_roots
    - companion_roots

# v0.2.0 (Unreleased)
This update focuses on expanding core functionality, basic functionality in diffeq solvers; keeping scalability in mind. Future updates will adress optomizations to make the package competetive. This has not been tested for breaks with v0.1.0. Breaks should be expected.

## Added

### Examples 
- SHO_glrk.jl: Simple harmonic oscillator example using Gauss-Legendre Runge-Kutta.
- SHO_rk45.jl: Simple harmonic oscillator example using 45th order Runge-Kutta.
- SHO_rk23.jl: Simple harmonic oscillator example using 23rd order Runge-Kutta.
- SHO_rk4.jl: Simple harmonic oscillator example using 4th order Runge-Kutta.
- SHO_des.jl: Simple harmonic oscillator example for ode() syntax.
- SHO-SDE_em.jl: Simple harmonic oscillator with stochastic term example using the Euler-Maruyama method. (TODO)

### Source
- array_sorts.jl
    - bubble_sort: Ascending or descending order sorting, added partial sorting.
    - insertion_sort
    - merge_sort
- diffeq_solvers.jl
    - des: Wrapper for DE solvers.
    - rk1: Runge-Kutta order 1.
    - rk2
    - rk23: rkbs wrapper
    - rkbs: Runge-Kutta Bogacki-Shampine method (TODO)
    - rk3
    - rk4
    - rk45: rkdp wrapper
    - rkdp: Runge-Kutta Dormand Price method.
    - glrk: Gauss-Legendre Runge Kutta.
    - em: Euler-Maruyama Method; Stocahstic DE solver. (TODO)
- matrices.jl
    - diag
    - dot
    - I
    - lpnorm
    - normalize
    - tr
- matrix_solvers.jl
    - eig_vals: Returns eigenvalues of a matrix using QR. 
    - qr_decomp: Accepts rectangular matrices.
    - round_number!: Rounds elements of a matrix to 0.
- polynomial.jl
    - lagrange_basis
    - lagrange_interpolation
    - lagrange_poly
    - normalized_legendre
    - polyroots

### Test
- test.sh: tests with flags
    - cmd to run all tests
    - run all tests with code coverage

### Website (TODO)
A new website was made using Documenter.jl for code documentation.
    - link CHANGELOG.md to website (TODO).

### Tests
    - array_sorts.jl
    - compare.jl
    - diffeq_solvers.jl (TODO)
    - integrate.jl
    - matrices.jl
    - matrix_solvers.jl (TODO)
    - polynomial.jl (TODO)

## Changed

- matrix_solvers: 
    - arnoldi: Defined expected types.
    - gs: Defined expected types.
    - lanczos: Defined expected types.
    - power_iteration: Defined expected types. Changed convergence type from iteration count to tolerance check.
    - qr_decomp: Defined expected types. Changed convergence type from iteration count to tolerance check.

## Fixed
- matrices.jl
    - Improper indexing in MBO. 

---

# v0.1.0 (4/14/2026)
Initial feature release, introduces ideas of this 
package.

## Added
### Examples
- ising_gse.jl: Shows the usage of MBO and ge functions.

### Source
- array_sorts.jl
    - bubble_sort: Sorts an array in O(n^2), fast  partial sorts. Only in descending order at the moment.
- compare.jl
    - vec_compare: Compares time taken for 2 functions that operate on vectors.
- matrices.jl 
    - MBO: Computes the many body operator given a set of interaction matrices.
- matrix_solvers.jl
    - arnoldi: Approximates the upper-Hessenberg form of a general matrix.
    - lanczos: Approximates the tridiagonal form of a hermitian matrix.
    - gs: uses Arnoldi to compute ground state energy and corresponding eigenvector of a given Hamiltonian matrix.
    - power_iteration: Computes maximum amplitude eigenvalue and corresponding eigenvector.
    - qr_decomp: QR decomposition for square matrices.
- Simularity.jl

### Test
 - runtests.jl
    - Full program testing suite.


