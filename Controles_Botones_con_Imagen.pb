;---------------------------------------
; Programa Botones_con_Imagen
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;

; Inclusión de botones con imagenes
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run

;Ejercicio:
;
; Usar la propiedad SetGadgetText() para cambiar el texto de un botón
;
; Usar la propiedad GetGadgetText() y MessageRequester("Title", "Mensaje") para extraer 
; el texto de un botón
;
; --------------------------------------------
; NOTA: este programa requiere de los archivos
;
;		boton1.bmp
;            	boton2.bmp
;
; descargue estos archivos de la carpeta
; https://github.com/profesorponce/Purebasic

Enumeration
   #WIN_MAIN
   #BUTTON_1
   #BUTTON_2
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 Global Img_Window_0_0, Img_Window_0_1
 
 Img_Window_0_0 = LoadImage(#PB_Any,"D:\08.Programacion\Clases.2023\Clase.2023.09.26.(Purebasic)\Boton1.bmp")
 Img_Window_0_1 = LoadImage(#PB_Any,"D:\08.Programacion\Clases.2023\Clase.2023.09.26.(Purebasic)\Boton2.bmp")
 
 If OpenWindow(#WIN_MAIN, 0, 0, 220, 200, "Botones", #FLAGS)
     
      ; Ejemplo de tipos de botones con imagen      
      ButtonImageGadget(#BUTTON_1, 15, 40, 52, 90, ImageID(Img_Window_0_0))
      ButtonImageGadget(#BUTTON_2, 100, 40, 88, 58, ImageID(Img_Window_0_1))      
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_1
                     MessageRequester("Botón 1", "Actriz de cine.")
                     
                  Case #BUTTON_2
                     MessageRequester("Botón 2", "Tonto & Retonto.")
                     ;Quit = #True
      
                 EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; EnableXP