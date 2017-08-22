.model small
.code
        Mov ah,2
        Mov dl,65
        Int 21h
        Mov dl,48
        Int 21h
        Mov DL,8
        Int 21h
        Mov DL,80
        Int 21h
        Mov AH,4ch
        Int 21h
end
