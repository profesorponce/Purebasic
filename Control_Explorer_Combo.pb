;---------------------------------------
; Programa Explorer_Combo
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de Explorer Combo
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
   #EXPLORER_COMBO
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 220, 200, "Explorer Combo", #FLAGS)
     
      ; Ejemplo de tipos de explorer combo
      ExplorerComboGadget(#EXPLORER_COMBO, 30, 50, 140, 25, GetHomeDirectory(),#PB_Explorer_Editable)
      ;#PB_Explorer_DrivesOnly   : The gadget will only display drives To choose from.
      ;#PB_Explorer_Editable     : The gadget will be editable With an autocomplete feature. With this flag set, it acts exactly like the one in Windows Explorer.
      ;#PB_Explorer_NoMyDocuments: The 'My Documents' Folder will Not be displayed As a separate item
      
      ButtonGadget(#BUTTON, 50, 100, 100, 20, "Get Path")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #EXPLORER_COMBO
                    SetWindowTitle(#WIN_MAIN, GetGadgetText(#EXPLORER_COMBO))
                  Case #BUTTON 
                    ;Quit = #True
                    MessageRequester("Unidad elegida", GetGadgetText(#EXPLORER_COMBO))
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 44
; EnableXP