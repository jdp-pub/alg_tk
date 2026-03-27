function bubble_sort(A)
    # make a copy to operate on
    V = A

    # preallocate memory
    sorted = false 
    swaps = 0
    vtemp = 0.0


    while !sorted
        swaps = 0
        for nx in 1:length(V)-1
            if V[nx]>V[nx+1]
                vtemp = V[nx]
                V[nx] = V[nx+1]
                V[nx+1] = vtemp
                swaps = swaps+1
            end
        end
        if swaps == 0
            sorted = true
        end
    end
    return V 
end
