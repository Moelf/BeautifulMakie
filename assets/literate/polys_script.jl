# This file was generated, do not modify it.

# by Lazaro Alonso
using CairoMakie, Makie.GeometryBasics
CairoMakie.activate!()
let
    n = 20
    function ngonShape(h, k, r, n)
        Polygon([Point2f(h .+ r * sin.(m * 2π / n), k .+ r * cos.(m * 2π / n)) for m in 1:n])
    end
    polysCentric = [ngonShape(0, 0, 3 / i^1.5, i) for i in 3:n]
    polysCircular = [ngonShape(√2 / 2 * sin(θ), √2 / 2 * cos(θ), 0.15 / √idx, idx + 2)
                     for (idx, θ) in enumerate(LinRange(0, 2π * (1 - 1 / (n - 2)), n - 2))]
    cmap = cgrad(:Homer1, n)

    with_theme(theme_light()) do
        fig, ax, = poly(polysCentric; color = 1:n-2, colormap = cmap,
            axis = (; aspect = DataAspect()), figure = (; resolution = (600, 400)))
        poly!(polysCircular; color = 1:n-2, colormap = cmap)
        hidedecorations!(ax; grid = false)
        hidespines!(ax)
        save(joinpath(@OUTPUT, "polygons.svg"), fig) # HIDE
        # display(fig)
    end
end;

using Pkg # HIDE

Pkg.status(["CairoMakie"]) # HIDE

