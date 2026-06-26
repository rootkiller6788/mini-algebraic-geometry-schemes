# 迷你代数几何与概形

一套**从零开始、零依赖的 Lean 4 实现**，涵盖从仿射簇到导出范畴与相交理论的代数几何核心内容。每个模块将研究生级别的教科书定理转化为经过验证、可执行的代码，实现理论与实践的桥接。

## 子模块总览

| 子模块 | 主题 | 参考课程 |
|--------|--------|-------------|
| [mini-schemes](mini-schemes/) | 交换环、素理想、Spec(R)、Zariski 拓扑、环化空间、结构层、纤维积、层上同调 | Princeton MAT 560, Harvard Math 232B, Berkeley Math 256B |
| [mini-affine-varieties](mini-affine-varieties/) | 多项式环 k[x₁,...,xₙ]、理想、代数集 V(I)、Zariski 拓扑、不可约分支、坐标环、Hilbert 零点定理、Krull 维数 | MIT 18.725, Harvard Math 232A, Berkeley Math 256A |
| [mini-coherent-sheaves](mini-coherent-sheaves/) | 拟凝聚层、凝聚层、局部自由层、向量丛、Serre 对偶、Riemann-Roch 定理、消没定理、稳定性条件 | Harvard Math 232B, Princeton MAT 560, MIT 18.725 |
| [mini-cohomology-of-schemes](mini-cohomology-of-schemes/) | Čech 上同调、导出函子、概形上层上同调、étale 上同调、射影空间上同调、曲线的 Riemann-Roch、K3 曲面上同调 | Harvard Math 259X, Berkeley Math 256B |
| [mini-curves-surfaces](mini-curves-surfaces/) | 代数曲线、曲线的 Riemann-Roch、代数曲面、曲面上的相交理论、极小模型纲领基础、代数与计算桥接 | Harvard Math 233, Columbia Math GR6360 |
| [mini-derived-categories](mini-derived-categories/) | 链复形、同伦范畴 K(A)、三角范畴、在拟同构处的局部化、导出函子 Ext/RHom、谱序列、DG 范畴 | Harvard Math 253X, UChicago Math 28400 |
| [mini-intersection-theory](mini-intersection-theory/) | 代数圈、有理等价、Chow 群、相交积、重数、Chern 类、Bezout 定理、投影公式、变形到法锥（Fulton） | MIT 18.726, Harvard Math 263 |
| [mini-moduli-spaces](mini-moduli-spaces/) | 精细/粗模空间、可表示函子、Hilbert 概形、曲线模空间 M_g、向量丛模空间、代数叠、Bridgeland 稳定性条件 | Harvard Math 259X, MIT 18.727 |

## 设计理念

- **Lean 4 之外零外部依赖** — 纯 Lean 4（v4.7.0）形式化，仅使用核心库 `Init` 和 `Std`
- **模块自包含** — 每个目录自带 `lakefile.lean`、`Main.lean`、`docs/`、`examples/`、`Benchmark/` 或 `Test/`
- **理论到代码的映射** — 每个模块包含 `docs/` 目录，内有课程对齐说明、逐定理引用和证明策略
- **基于谓词的方法** — 使用 Lean 的谓词类型而非 `Set`，实现构造性、可计算的形式化，与经典代数几何相对应

## 构建方式

每个模块相互独立。进入模块目录后运行：

```bash
cd mini-schemes
lake build       # 构建模块
lake exe main    # 运行主入口
cd ../mini-cohomology-of-schemes
lake build       # 构建并运行上同调计算
```

需要 **Lean 4**（v4.7.0）及 **lake** 构建工具。

## 项目结构

```
mini-algebraic-geometry-schemes/
├── mini-schemes/                # 核心概形理论（Spec、Zariski、环化空间、层）
├── mini-affine-varieties/       # 仿射簇（Hilbert 零点定理、维数理论）
├── mini-coherent-sheaves/       # 凝聚层（Serre 对偶、Riemann-Roch、消没定理）
├── mini-cohomology-of-schemes/  # 概形上同调（Čech、Étale、射影空间上同调）
├── mini-curves-surfaces/        # 代数曲线与曲面
├── mini-derived-categories/     # 导出范畴（三角范畴、导出函子、DG 范畴）
├── mini-intersection-theory/    # 相交理论（Chow 群、Chern 类、Fulton 方法）
└── mini-moduli-spaces/          # 模空间（Hilbert 概形、代数叠）
```

## 许可证

MIT
