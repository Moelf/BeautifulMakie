md"""
## Simple x-y error bars
"""
## by Lazaro Alonso
using CairoMakie, Random
CairoMakie.activate!() #HIDE
let
    Random.seed!(145)
    x, y = 1:2:20, 5 * rand(10)
    yerr, xerr = 0.4 * abs.(randn(10)), abs.(randn(10))
    fig = Figure(resolution = (600, 400), font = "sans")
    ax = Axis(fig[1, 1]; xlabel = "variable", ylabel = "values")
    errorbars!(ax, x, y, yerr; whiskerwidth = 12, color = :orangered)
    errorbars!(ax, x, y, xerr; whiskerwidth = 12, direction = :x)
    ## display(fig)
    save(joinpath(@OUTPUT, "xyerrorbars.svg"), fig) # HIDE
end;
# \fig{xyerrorbars.svg}

using Pkg # HIDE
md"""
#### Dependencies
"""
using Pkg # HIDE
Pkg.status(["CairoMakie"]) # HIDE