.model small
.code
        Mov ah,1
        Int 33
        Mov dl,al
        Int 33
        Add dl,al
        Mov ah,2
        Sub dl,48
        Cmp dl,57
        JLE L1
        Mov bh,dl
        Mov dl,49
        Int 33
        Mov dl,bh
        Sub dl,10
     L1:Int 33
        Mov ah,76
        Int 33
end
