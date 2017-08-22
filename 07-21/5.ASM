.model small
.code
        Mov ah,2
        Mov dl,70
        Int 33
        Mov dl,69
        Int 33
        Mov dl,68
        Int 33
        Mov dl,67
        Int 33
        Mov dl,66
        Int 33
        Mov ah,4ch
        Int 21h
end
