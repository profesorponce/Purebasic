;---------------------------------------
; Programa CheckBox
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de controles checkbox
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
   #CHECKBOX_1
   #CHECKBOX_2
   #BUTTON_1
   #BUTTON_2
   #BUTTON_3
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 230, 230, "Check Box", #FLAGS)
     
      ; Ejemplo de uso de check boxs
      CheckBoxGadget(#CHECKBOX_1, 20, 20, 110, 20, "Check Box 1")
      CheckBoxGadget(#CHECKBOX_2, 20, 50, 110, 20, "Check Box 2")
      ButtonGadget(#BUTTON_1, 20, 90, 120, 30, "Ver estado")
      ButtonGadget(#BUTTON_2, 20, 130, 120, 30, "Marcar")
      ButtonGadget(#BUTTON_3, 20, 170, 120, 30, "Desmarcar")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_1
                    MessageRequester("Estado de #CHECKBOX_1", "Value="+Str(GetGadgetState(#CHECKBOX_1)))
                    MessageRequester("Estado de #CHECKBOX_2", "Value="+Str(GetGadgetState(#CHECKBOX_2)))
                    ;Quit = #True
                  Case #BUTTON_2  
                    SetGadgetState(#CHECKBOX_1, 1)
                    SetGadgetState(#CHECKBOX_2, 1)
                  Case #BUTTON_3  
                    SetGadgetState(#CHECKBOX_1, 0)
                    SetGadgetState(#CHECKBOX_2, 0)
                 EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 1
; EnableXP