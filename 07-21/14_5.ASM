.model small
.code
        Mov ah,1
        Int 33
        Mov bh,al
        Int 33
        Mov ch,al
        Mov ah,2
        Mov dl,'-'
        Int 33
        Mov dl,ch
        Sub dl,bh
        Add dl,48
        Int 33
        Mov ah,76
        Int 33
end
