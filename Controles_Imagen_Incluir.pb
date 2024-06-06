;---------------------------------------
; Programa Imagen_Incluir
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de Imágenes
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run
;
; --------------------------------------------
; NOTA: este programa requiere de los archivos
;
;		marilyn.bmp
;
; descargue estos archivos de la carpeta
; https://github.com/profesorponce/Purebasic

Enumeration
   #WIN_MAIN
   #IMAGE_FILE
   #IMAGE_DISPLAY
   #BUTTON_CLOSE
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 430, 570, "Marilyn", #FLAGS)
   
   If CreateGadgetList(WindowID(#WIN_MAIN))
     
      If LoadImage(#IMAGE_FILE, "Marilyn1.bmp")
       
         ImageGadget(#IMAGE_DISPLAY, 10, 10, 280, 150, ImageID(#IMAGE_FILE))
         ButtonGadget(#BUTTON_CLOSE, 170, 540, 100, 20, "Cerrar ventana")
         
         Repeat
           
            Event.l = WaitWindowEvent()
            Select Event
               Case #PB_Event_Gadget
                  Select EventGadget()
                     Case #BUTTON_CLOSE
                        Quit = #True
                  EndSelect
              EndSelect
              
         Until Event = #PB_Event_CloseWindow Or Quit = #True
       
      EndIf ;LoadImage
    
   EndIf ;CreateGadgetList
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; EnableXP