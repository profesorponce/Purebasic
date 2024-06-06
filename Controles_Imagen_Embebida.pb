;---------------------------------------
; Programa Imagen_Embebida
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Embeber imágenes dentro del ejecutale
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run
;
; --------------------------------------------
; NOTA: este programa requiere de los archivos
;
;            	detectives.bmp
;
; descargue estos archivos de la carpeta
; https://github.com/profesorponce/Purebasic

Enumeration
   #WIN_MAIN
   #IMAGE_MEMORY
   #IMAGE_DISPLAY
   #BUTTON_CLOSE
EndEnumeration
 
Global Quit.b = #False

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 485, 460, "Detectives", #FLAGS)
  
   If CreateGadgetList(WindowID(#WIN_MAIN))
    
      If CatchImage(#IMAGE_MEMORY, ?Image)
       
         ImageGadget(#IMAGE_DISPLAY, 10, 10, 280, 150, ImageID(#IMAGE_MEMORY))
         ButtonGadget(#BUTTON_CLOSE, 200, 430, 100, 20, "Cerrar ventana")
         
         Repeat
            Event.l = WaitWindowEvent()
            Select Event
               Case #PB_Event_Gadget
                  Select EventGadget()
                     Case #BUTTON_CLOSE
                        Quit = #True
                  EndSelect ;EventGadget
            EndSelect ;Event
              
         Until Event = #PB_Event_CloseWindow Or Quit = #True
    
      EndIf ;CatchImage
    
   EndIf ;CreateGadgetList
 
EndIf ;OpenWindow
End

DataSection
   Image:
   IncludeBinary "Detectives.bmp"
EndDataSection
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; EnableXP