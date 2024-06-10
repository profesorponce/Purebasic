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
   #TEXT_1
   #TEXT_2
   #TEXT_3
   #PROGBAR_1
   #PROGBAR_2
   #PROGBAR_3
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 

 
 If OpenWindow(#WIN_MAIN, 0, 0, 320, 200, "ProgressBar", #FLAGS)
     
      ; Ejemplo de control progressbar
   
      Minimo.i = 0
      Maximo.i = 100
      TextGadget       (#TEXT_1,  10, 10, 250,  20, "ProgressBar estandar  (50/100)", #PB_Text_Center)
      ProgressBarGadget(#PROGBAR_1,  10, 30, 250,  30, Minimo, Maximo)
      SetGadgetState   (#PROGBAR_1, 50)   ;  seteo a 50 de 100 (50%)
      
      Minimo = 0
      Maximo = 200
      TextGadget       (#TEXT_2,  10, 70, 250,  20, "ProgressBar Smooth  (50/200)", #PB_Text_Center)
      ProgressBarGadget(#PROGBAR_2,  10, 90, 250,  30, Minimo, Maximo, #PB_ProgressBar_Smooth)
      SetGadgetState   (#PROGBAR_2, 50)   ;  seteo a 50 de 200 (25%)
      
      Minimo = 0
      Maximo = 200
      TextGadget       (#TEXT_3, 100,135, 200,  20, "ProgressBar Vertical  (100/300)", #PB_Text_Right)
      ProgressBarGadget(#PROGBAR_3, 270, 10,  30, 120, Minimo, Maximo, #PB_ProgressBar_Vertical)
      SetGadgetState   (#PROGBAR_3, 100)   ;  seteo a 100 de 300 (33%)
      
      ButtonGadget(#BUTTON, 20, 160, 100, 25, "Acción" )
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
              Select EventGadget()
                   
                 Case #BUTTON 
                   aux.i = 0
                   
                   For aux = 0 To 100
                     SetGadgetState   (#PROGBAR_1, aux)
                     Delay(10)
                   Next
                   SetGadgetState   (#PROGBAR_1, 10)
                   
                   For aux = 0 To 100
                     SetGadgetState   (#PROGBAR_2, aux)
                     Delay(10)
                   Next
                   SetGadgetState   (#PROGBAR_2, 10)
                   
                                      
                   For aux = 0 To 300
                     SetGadgetState   (#PROGBAR_3, aux)
                     Delay(10)
                   Next
                   SetGadgetState   (#PROGBAR_3, 10)

                   
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 81
; FirstLine = 59
; EnableXP