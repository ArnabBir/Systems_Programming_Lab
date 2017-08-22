.model small
.code
        Mov ah,2
        Mov ch,1
     L2:Mov bh,1
     L1:Mov dl,65
        Int 33
        Add bh,1
        Mov bl,6
        Sub bl,ch
        Cmp bh,bl
        JLE L1
        Mov DL,','
        Int 33
        Add Ch,1
        Cmp ch,4
        JLE L2
        Mov ah,76
        Int 33
end
