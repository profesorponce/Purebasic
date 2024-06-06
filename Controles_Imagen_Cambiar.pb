;---------------------------------------
; Programa Imagen_Cambiar
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Cambiar una imagen
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run
;
; --------------------------------------------
; NOTA: este programa requiere de los archivos
;
;		marilyn.bmp
;            	detectives.bmp
;
; descargue estos archivos de la carpeta
; https://github.com/profesorponce/Purebasic


Enumeration
   #WIN_MAIN
   #IMAGE_FILE
   #IMAGE_DISPLAY
   #BUTTON_CAMBIAR
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 430, 570, "Marilyn", #FLAGS)
   
   If CreateGadgetList(WindowID(#WIN_MAIN))
     
      If LoadImage(#IMAGE_FILE, "Marilyn1.bmp")
       
         ImageGadget(#IMAGE_DISPLAY, 10, 10, 280, 150, ImageID(#IMAGE_FILE))
         ButtonGadget(#BUTTON_CAMBIAR, 170, 540, 100, 20, "Cambiar magen")
         
         Repeat
           
            Event.l = WaitWindowEvent()
            Select Event
               Case #PB_Event_Gadget
                  Select EventGadget()
                     Case #BUTTON_CAMBIAR
                       If LoadImage(#IMAGE_FILE, "Detectives.bmp")
                          ImageGadget(#IMAGE_DISPLAY, 10, 10, 280, 150, ImageID(#IMAGE_FILE))  
                       EndIf 
                  EndSelect
              EndSelect
              
         Until Event = #PB_Event_CloseWindow Or Quit = #True
       
      EndIf ;LoadImage
    
   EndIf ;CreateGadgetList
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; FirstLine = 15
; EnableXP