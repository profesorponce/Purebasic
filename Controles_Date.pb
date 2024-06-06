;---------------------------------------
; Programa Date
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control date
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
   #DATEGADGET
   #BUTTON_1
   #BUTTON_2
   #BUTTON_3
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 230, 230, "ComboBox", #FLAGS)
   
   Position = 0 
   Operacion$ = ""
   
      ; Ejemplo de uso de date gadget
   
      DateGadget(#DATEGADGET, 30, 20, 120, 25, "Seleccione fecha")
      ButtonGadget(#BUTTON_1, 20, 90, 120, 30, "Ver fecha")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #BUTTON_1
                   MessageRequester("Fecha elegida del calendario", FormatDate("%dd/%mm/%yyyy", GetGadgetState(#DATEGADGET)))
                    ;Quit = #True
                 EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 6
; EnableXP