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
   #BUTTON_3
   #IMAGEN_0
   #IMAGEN_1
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 Global Img_Window_0_0, Img_Window_0_1
 
 Global Flag_Imagen.b
 
 Img_Window_0_0 = LoadImage(#IMAGEN_0,"D:\08.Programacion\Clases.2023\Clase.2023.09.26.(Purebasic)\Boton1.bmp")
 Img_Window_0_1 = LoadImage(#IMAGEN_1,"D:\08.Programacion\Clases.2023\Clase.2023.09.26.(Purebasic)\Boton2.bmp")
 
 If OpenWindow(#WIN_MAIN, 0, 0, 220, 200, "Botones", #FLAGS)
     
      ; Ejemplo de tipos de botones con imagen      
   ButtonImageGadget(#BUTTON_1, 15, 40, 52, 90, ImageID(#IMAGEN_0))
   ButtonGadget(#BUTTON_2, 10, 10, 200, 20, "Cambiar imagen")
   ButtonGadget(#BUTTON_3, 110, 35, 100, 20, "Cambiar tamaño")
         
   Flag_Imagen = #False
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_1
                    MessageRequester("Botón 1", "Cambia de imagen.")
                    
                  Case #BUTTON_2
                    If Flag_Imagen = #False
                      Flag_Imagen = #True  
                      SetGadgetAttribute(#BUTTON_1,#PB_Button_Image, ImageID(#IMAGEN_0))
                    Else
                      Flag_Imagen = #False
                      SetGadgetAttribute(#BUTTON_1,#PB_Button_Image, ImageID(#IMAGEN_1))
                    EndIf  
                    
                  Case #BUTTON_3
                    If Flag_Imagen = #False
                      Flag_Imagen = #True  
                      ResizeGadget(#BUTTON_1, 15, 40, 52, 90)  
                    Else
                      Flag_Imagen = #False  
                      ResizeGadget(#BUTTON_1, 15, 40, 70, 120)  
                    EndIf 
                    
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 78
; FirstLine = 54
; EnableXP