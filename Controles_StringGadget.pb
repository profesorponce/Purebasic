;---------------------------------------
; Programa Editor
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control StringGadget (equivalente al
; textbox clásico de windows)
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run

;Ejercicio:
;
; Usar la propiedad SetGadgetText() para cambiar el texto
;
; Usar la propiedad GetGadgetText() y MessageRequester("Title", "Mensaje") para extraer 
; el texto de un botón


Enumeration
   #WIN_MAIN		; Ventana principal
  
   #EDIT_NOMBRE		; ID de controles de ingreso
   #EDIT_APELLIDO
   #EDIT_DNI
   
   #BORRAR_NOMBRE	; ID de botones para borrar
   #BORRAR_APELLIDO
   #BORRAR_DNI
EndEnumeration
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Global Quit.b = #False
 
 If OpenWindow(#WIN_MAIN, 0, 0, 600, 400, "StringGadget", #FLAGS)
   
      StringGadget(#EDIT_NOMBRE,30, 50, 180, 25 , "")
      StringGadget(#EDIT_APELLIDO,30, 110, 180, 25, "")
      StringGadget(#EDIT_DNI,30, 170, 180, 25, "")
   
      ButtonGadget(#BORRAR_NOMBRE, 280, 50, 100, 25, "BORRAR")
      ButtonGadget(#BORRAR_APELLIDO,280, 110, 100, 25 , "BORRAR")
      ButtonGadget(#BORRAR_DNI, 280, 175, 100, 25, "BORRAR")
      
      SetActiveGadget(#EDIT_NOMBRE) 

      Repeat
         Event.l = WaitWindowEvent()

         Select Event
            Case #PB_Event_Gadget

               Select EventGadget()
                 Case #BORRAR_NOMBRE
                   SetGadgetText(#EDIT_NOMBRE, "borrado")
                   ;para borrar por completo, enviar un string nulo ("")
 
                 Case #BORRAR_APELLIDO
                   SetGadgetText(#EDIT_APELLIDO, "borrado")
                   ;para borrar por completo, enviar un string nulo ("")

                 Case #BORRAR_DNI
                   SetGadgetText(#EDIT_DNI, "borrado")
                   ;para borrar por completo, enviar un string nulo ("")

                   SetActiveGadget(#EDIT_NOMBRE) ; aplicar el foco de windows
                                                 ; sobre el control #EDIT_NOMBRE
               EndSelect ;Fin del EventGadget
         EndSelect ;Fin del Event de Windows
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
  EndIf ;Fin del OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 53
; FirstLine = 45
; EnableXP