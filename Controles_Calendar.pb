;---------------------------------------
; Programa Calendar
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control tipo calendario
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
   #CALENDAR_1
   #BUTTON_1
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 300, 230, "Calendario", #FLAGS)
     
      ; Ejemplo de uso de calendario
      CalendarGadget(#CALENDAR_1, 30, 30, 240, 160, 0)
      ButtonGadget(#BUTTON_1, 45, 195, 200, 20, "Ver fecha")
   
      ;funciones asociadas al calendario
      ;SetGadgetState(): Set the currently displayed date. 
      ;GetGadgetState(): Get the currently displayed date. 
      ;SetGadgetItemState(): Make a specific date appear bold (Windows only). 
      ;GetGadgetItemState(): Get the bold state of a specific Date (Windows only). 
      ;SetGadgetAttribute(): With the following attributes: 
      
      ;FormatDate("%mm/%dd/%yyyy", Date()) ; usar esta funcion string para obtener fecha en formato adecuado
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_1
                    MessageRequester("Fecha elegida del calendario", FormatDate("%dd/%mm/%yyyy", GetGadgetState(#CALENDAR_1)))
                    ;Quit = #True
                 EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; EnableXP