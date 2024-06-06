;---------------------------------------
; Programa Editor
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control rich edit
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
   #EDITOR
   #BUTTON_1
   #BUTTON_2
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 240, 290, "Check Box", #FLAGS)
     
      ; Ejemplo de uso de editor
   
      EditorGadget(#EDITOR, 40, 30, 170, 160)
      ButtonGadget(#BUTTON_1, 70, 210, 100, 25, "Ver texto")
      ButtonGadget(#BUTTON_2, 70, 250, 100, 25, "Borrar texto")
      
      SetGadgetText(#EDITOR, "Escriba aquí...")

      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                  Case #BUTTON_1
                    MessageRequester("Contenido del editor", GetGadgetText(#EDITOR))
                    ;Quit = #True
                  Case #BUTTON_2  
                    SetGadgetText(#EDITOR, "")        
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 6
; EnableXP