.model small
.code
        Mov ah,2
        Mov bh,1
     L1:Mov DL,64
        Add DL,bh
        Int 33
        Add bh,1
        Cmp bh,5
        JLE L1
        Mov ah,76
        Int 33
end
