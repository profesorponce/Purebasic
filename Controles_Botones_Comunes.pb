;---------------------------------------
; Programa Botones_Comunes
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de botones comunes
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run

;Ejercicio:
;
; Usar la propiedad SetGadgetText() para cambiar el texto de un botón
;
; Usar la propiedad GetGadgetText() y MessageRequester("Title", "Mensaje") para extraer 
; el texto de un botón


Enumeration
   #WIN_MAIN
   #BUTTON_0
   #BUTTON_1
   #BUTTON_2
   #BUTTON_3
   #BUTTON_4
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 220, 200, "Botones", #FLAGS)
     
      ; Ejemplo de tipos de botones disponibles
      ButtonGadget(#BUTTON_0, 10, 10, 200, 20, "Botón estándar")
      ButtonGadget(#BUTTON_1, 10, 40, 200, 20, "Botón izquierdo", #PB_Button_Left)
      ButtonGadget(#BUTTON_2, 10, 70, 200, 20, "Botón derecho", #PB_Button_Right)
      ButtonGadget(#BUTTON_3, 10,100, 200, 60, "Boton multilinea  (corte de texto automático)", #PB_Button_MultiLine)
      ButtonGadget(#BUTTON_4, 10,170, 200, 20, "Botón salir", #PB_Button_Toggle)
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_4
                     Quit = #True
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 6
; EnableXP