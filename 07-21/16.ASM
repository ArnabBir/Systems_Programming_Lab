.model small
.code
        Mov ah,1
        Int 33
        Mov dl,al
        Int 33
        Cmp al,dl
        JLE L1
        Mov bh,dl
        Mov dl,al
        Mov al,bh
     L1:Sub dl,al
        Add dl,48
        Mov ah,2
        Int 33
        Mov ah,76
        Int 33
end
