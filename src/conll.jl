export readconll

function readconll(path::String)
    data = Token[]
    lines = open(readlines, path)
    for line in lines
        line = chomp(line)
        items = split(line, '\t')
        isempty(line) && continue
        id = parse(Int, items[1])
        word = items[2]
        postag = items[5]
        head = parse(Int, items[7])
        @assert id >= 0 && head >= 0
        t = Token(id, word, postag, head)
        push!(data, t)
        # println("$(id) $(word)")
    end

    data
end