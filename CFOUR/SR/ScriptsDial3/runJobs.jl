# Job settings 
nproc::Int64 = 1
wclim::String = "11:59:00"
name::String = "CH3OH_SR"
memory::String = "50gb"

point::Int64 = 30001
jobSplit::Int64 = 30
numberOfJobs::Int64 = 1000

for i in 1:numberOfJobs
    run(`sbatch -A dp060 --nodes=1  --ntasks=$(nproc) --time=$(wclim)  -J $(name)_$(point)-$(point + jobSplit) -o $(name)_$(point)-$(point + jobSplit).o -e $(name)_$(point)-$(point + jobSplit).e  --hint=compute_bound --no-requeue  --mem=$(memory) run-cfour.csh $(point) $(point + jobSplit)`)
    global point = point + jobSplit
    println(point)
end