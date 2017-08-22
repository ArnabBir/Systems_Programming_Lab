.model small
.code
        Mov ah,1
        Int 33
        Mov dl,al
        Int 33
        Mov bh,49
        Cmp al,'B'
        JE L1
        Mov bh,dl
     L1:Add dl,bh
        Sub dl,48
        Mov ah,2
        Int 33
        Mov ah,76
        Int 33
end
