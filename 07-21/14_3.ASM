.model small
.code
        Mov ah,1
        Int 33
        Mov dl,al
        Int 33
        Add dl,al
        Sub dl,58
        Mov ah,2
        Mov bh,dl
        Mov dl,'1'
        Int 33
        Mov dl,bh
        Int 33
        Mov ah,76
        Int 33
end
