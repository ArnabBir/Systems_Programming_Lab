.model small
.code
        Mov ah,1
        Int 33
        Mov dl,al
        Int 33
        Add dl,al
        Sub dl,48
        Mov ah,2
        Int 33
        Mov ah,76
        Int 33
end
