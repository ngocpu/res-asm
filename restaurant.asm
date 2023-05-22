.model small
.stack 100h
.data

    m0 dw "         !!!!!Welcome in our project!!!!!$"
    m2 dw 10,13,10,13, "Menu:1.Product1  100/- 2.Product2  50/- 3.Product3  20 $"
    m3 dw 10,13,10,13, "Please select the menu number:$"
    m8 dw 10,13,10,13, "SORRY!!!There is no more than 3 item!$" 
    m4 dw 10,13,10,13, "Please go to back menu!$"
    m5 dw 10,13,10,13, "Enter quantity:$" 
    m6 dw 10,13,10,13, "Total price: $"
    m7 dw 10,13,10,13, "*****THANK YOU*****$"
    m13 dw 10,13,10,13, "Next-odrer : Press <1>$",
    m14 dw 10,13,10,13, "Exit : Press Any key$"
    m15 dw 10,13,10,13, "Final Total Price:$"
    
    tong dw 0 
    1price dw 100
    2price dw 50
    3price dw 20
      
.code
    main proc
        
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        Lea dx,m0
        int 21h  
        
        menu:
        ;in ra chuoi m2
        mov ah,9
        Lea dx,m2
        int 21h
        
        ;in ra chuoi m3
        mov ah,9
        Lea dx,m3
        int 21h
        
        ;nhap so thu tu cua mon an muon chon
        mov ah,1
        int 21h        
        
        ;so sanh gia tri da nhap voi stt nhung mon an co trong danh sach
        cmp al,31h
        je product1
        cmp al,32h
        je product2
        cmp al,33h
        je product3
        
                 
        re_select:
        ;in chuoi m8
        mov ah,9
        Lea dx,m8
        int 21h 
        
        ;in chuoi m4
        mov ah,9
        Lea dx,m4
        int 21h
        
        ;nhay den ham menu
        jmp menu  
        
        product1:
            ;in chuoi m5
            mov ah,9
            Lea dx,m5
            int 21h 
            
            ;xoa noi dung thanh ghi ax
            xor ax,ax
            
            ;goi indec
            call indec
            
            ;tinh gia tien
            mul 1price 
            
            ;chuyen gia tien vao bx
            mov bx,ax
            
            ;nhay den totalprice
            jmp totalprice
                
        product2:
        
            mov ah,9
            Lea dx,m5
            int 21h
            
            xor ax,ax            
            
            call indec
    
            mul 2price
            
            mov bx,ax
            
            jmp totalprice 
            
        product3:    
            mov ah,9
            Lea dx,m5
            int 21h 
            
            xor ax,ax
            
            call indec
           
            mul 3price
            
            mov bx,ax
            
            jmp totalprice 
                
        totalprice:
            ;in chuoi m6
            mov ah,9
            Lea dx,m6
            int 21h 
            
            xor ax,ax ;xoa noi dung thanh ghi ax
            add tong,bx ;tinh tong cua tong + bx luu vao tong
            mov ax,bx ;chuyen gia tri bx sang ax 
            call outdec ;goi outdec
            
            ;in chuoi m13
            mov ah,9
            Lea dx,m13
            int 21h
            
            ;in chuoi m14
            mov ah,9
            Lea dx,m14
            int 21h
            
            ;nhap so de tiep tuc hoac ket thuc chuong trinh
            mov ah,1
            int 21h
            
            ;so sanh 
            cmp al,31h
            je menu
            
            ;in chuoi m15
            mov ah,9
            lea dx,m15
            int 21h
          
            mov ax,tong ;chuyen gia tri cua tong vao ax            
            call outdec ;goi outdec
                        
            ;in chuoi m7
            mov ah,9
            Lea dx,m7
            int 21h
            
        mov ah,4ch
        int 21h
        
        main endp
    include indec.txt  
    include outdec.txt 
    end main
