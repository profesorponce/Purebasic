;---------------------------------------
; Programa ComboBox
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de contoles combo box
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
   #COMBOBOX
   #BUTTON_1
   #BUTTON_2
   #BUTTON_3
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 230, 230, "ComboBox", #FLAGS)
   
   Position = 0 
   Operacion$ = ""
   
      ; Ejemplo de uso de combo box
   
      ComboBoxGadget(#COMBOBOX, 30, 20, 150, 30)
      ButtonGadget(#BUTTON_1, 20, 90, 120, 30, "Agregar")
      ButtonGadget(#BUTTON_2, 20, 130, 120, 30, "Ver selección")
      ButtonGadget(#BUTTON_3, 20, 170, 120, 30, "Limpiar")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #BUTTON_1
                   Result = AddGadgetItem(#COMBOBOX, Position, "Texto_"+Str(Position) )
                   If Result = 1
                     Operacion$ ="OK"
                   Else   
                     Operacion$ ="ERROR"
                   EndIf   
                   MessageRequester("Agregando a #COMBOBOX", "Resultado="+Operacion$)
                   Position = Position + 1 
                    ;Quit = #True
                 Case #BUTTON_2  
                   MessageRequester("Ver selección", "Resultado="+GetGadgetText(#COMBOBOX))
                 Case #BUTTON_3  
                   ClearGadgetItems(#COMBOBOX)
                   Position = 0 
                   MessageRequester("Borrado", "Se eliminaron todos los items")
                 EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 6
; EnableXP