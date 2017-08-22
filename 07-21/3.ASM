.model small
.code
        Mov ah,2
        Mov dl,67
        Int 21h
        Mov dl,69
        Int 21h
        Mov dl,71
        Int 21h
        Mov dl,73
        Int 21h
        Mov dl,75
        Int 21h
        Mov ah,76
        Int 33
end
