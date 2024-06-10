;---------------------------------------
; Programa Option
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control Option
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #OPTION_1
   #OPTION_2
   #OPTION_3
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 

 
 If OpenWindow(#WIN_MAIN, 0, 0, 140, 210, "Option", #FLAGS)
     
      ; Ejemplo de control option
       
      OptionGadget(#OPTION_1, 30, 20, 60, 20, "Option 1")
      OptionGadget(#OPTION_2, 30, 45, 60, 20, "Option 2")
      OptionGadget(#OPTION_3, 30, 70, 60, 20, "Option 3")
       
      SetGadgetState(1, 1)   ; set second option as active one
    
      ButtonGadget(#BUTTON, 20, 150, 100, 25, "Ver elegido" )
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
              Select EventGadget()
                 Case #OPTION_1 
                 Case #OPTION_2 
                 Case #OPTION_3 
                   
                 Case #BUTTON 
                   
                   ;La funcion GetGadgetState(#OPTION_1) devuelve
                   ; 0 = si no esta chequeado
                   ; 1 = cuando esta chequeado
                   
                   respuesta.s =""
                   contador.i = 1 
                   For aux.i = #OPTION_1 To #OPTION_3
                      respuesta = "Option_" + Str(contador) + ", "
                      If GetGadgetState(aux) = 0 
                        respuesta = respuesta + "sin marcar"
                      Else
                        respuesta = respuesta + "marcado"
                      EndIf
                      MessageRequester("Option:", respuesta)
                      contador = contador + 1
                   Next
                                       
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 63
; FirstLine = 22
; EnableXP