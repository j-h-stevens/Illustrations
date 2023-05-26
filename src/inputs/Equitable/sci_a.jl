using JSON3, JSON, CSV, DataFrames

prd = copy(JSON3.read(JSON.json(CSV.File("src/inputs/Equitable/Structured_Capital_Income_Accelerated.csv") |> DataFrame)))

gf = Dict(:Growth_Function => :simple_boost)
yf = Dict(:Income_Function => :drop)
rf = Dict(:Return_Function => :cap_buff)
f = Dict(:Fees => Dict([:account, :rider] .=> [0.0069, 0.015]))
s = Dict(:Rollup => zeros(length(prd[:Rollup])))
w = Dict(:W => 0.05)

bh_slpp_m = Dict(:bh_slpp_m => merge(prd, gf, yf, f, s, w, rf))