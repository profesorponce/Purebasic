;---------------------------------------
; Programa Detección_de_Eventos
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Programa base para detección de multiples
; eventos. Sirve como plantilla basica de
; trabajo para soportar las interfaces 
; graficas

Quit = #False

Repeat
   Event.l = WaitWindowEvent()
  
   If KeyboardReleased(#PB_Key_Escape)
      Quit = #True
   EndIf
    
   Select Event
      
      Case #PB_Event_Gadget ;eventos de controles de usuario
       
         Select EventGadget() 
            ;Case #BUTTON_CLOSE ;boton de cierre
            ;Default ;  
          EndSelect ;EventGadget
          
      Case #PB_Event_LeftClick 
         MessageRequester("Detección", "LeftClick")    
      Case #PB_Event_LeftDoubleClick
         MessageRequester("Detección", "LeftDoubleClick")   
      Case #PB_Event_RightClick     
         MessageRequester("Detección", "RightClick")   
      Case #PB_Key_Up
         MessageRequester("Detección", "Key_Up")
      Case #PB_Key_Down  
         MessageRequester("Detección", "Key_Down")  
      Case #PB_Key_Right
         MessageRequester("Detección", "Key_Right")
      Case #PB_Key_Left 
         MessageRequester("Detección", "Key_Left")
      Default ; eventos de controles-------------------------- 
         
   EndSelect ;Event    
    
Until Event = #PB_Event_CloseWindow Or Quit = #True
   
           
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 9
; EnableXP