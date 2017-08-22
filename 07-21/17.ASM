.model small
.code
        Mov AH,1
        Int 33
        Mov DL,AL
        Int 33
        Mov bl,al
        Mov AH,2
        Cmp bl,DL
        JLE L1
        Mov bh,DL
        Mov DL,'-'
        Int 33
        Mov DL,bl
        Mov bl,bh
    L1: Sub DL,bl
        Add DL,48
        Int 33
        Mov AH,76
        Int 33
end
