.model small
.code
        Mov ah,2
        Mov ch,1
     L2:Mov bh,1
     L1:Mov dl,70
        Sub dl,bh
        Add dl,ch
        Add dl,ch
        Int 33
        Add bh,1
        Cmp bh,4
        JLE L1
        Mov dl,','
        Int 33
        Add ch,1
        Cmp ch,4
        JLE L2
        Mov ah,76
        Int 33
end
