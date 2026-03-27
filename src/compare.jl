using BenchmarkTools

function vec_compare(func_list,n,avg_n=10)

    # preallocate memory
    times = zeros(length(func_list))
    time_avg = zeros(Float64,avg_n)


    for fx in 1:length(func_list)
        f = func_list[fx]

        for tx in 1:avg_n
            time_avg[tx] = @belapsed $f(rand($n))
        end
        times = mean(time_avg)
    end
    return times
end

