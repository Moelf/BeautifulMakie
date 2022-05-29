# Parent file to run all scripts which may generate
# some output that you want to display on the website.
# this can be used as a tester to check that all the code
# on your website runs properly.

dir = @__DIR__

"""
    genplain(s)

Small helper function to run some code and redirect the output (stdout) to a file.
"""
function genplain(s::String)
    open(joinpath(dir, "animations/output", "$(splitext(s)[1]).out"), "w") do outf
        redirect_stdout(outf) do
            include(joinpath(dir, "animations", s))
        end
    end
end

genplain("animLinePoint.jl")
genplain("animScatters.jl")
genplain("gravities.jl")
genplain("flying.jl")
genplain("earthquakes.jl")


# output
using Glob
#files = glob("./animations/*.jl")
