<!--This file was generated, do not modify it.-->
## Line with colormap

````julia:ex1
# by Lazaro Alonso
using CairoMakie, ColorSchemes
CairoMakie.activate!() # HIDE
let
    x = LinRange(0, 2π, 100)
    fig = Figure(resolution = (600, 400))
    ax = Axis(fig[1, 1], xlabel = "x")
    obj = lines!(x, sin.(x); color = x, colormap = :viridis, linewidth = 5)
    lines!(x, cos.(x), color = :black, label = "cos(x)", linewidth = 1)
    lines!(x, -cos.(x), color = :dodgerblue, label = "-cos(x)")
    axislegend(ax)
    Colorbar(fig[1, 2], obj, label = "sin(x)")
    colgap!(fig.layout, 5)
    # display(fig)
    save(joinpath(@OUTPUT, "LinesAndMulticoloredLineCbarOut.svg"), fig) # HIDE
end;
````

\fig{LinesAndMulticoloredLineCbarOut.svg}

````julia:ex2
using Pkg # HIDE
````

#### Dependencies

````julia:ex3
Pkg.status(["CairoMakie", "ColorSchemes"]) # HIDE
````

