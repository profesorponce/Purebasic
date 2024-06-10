;---------------------------------------
; Programa IPv4
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control de ingreso IP version 4
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #IPV4
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 280, 300, "IP versión 4", #FLAGS)
     
       ; Ejemplo de control hyperlink
       IPAddressGadget(#IPV4, 90, 50, 100, 25)
              
       ButtonGadget(#BUTTON, 80, 260, 100, 25, "Ver IP")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #IPV4
                    
                 Case #BUTTON 
                    ;Quit = #True
                    MessageRequester("Dirección IP", GetGadgetText(#IPV4))
                    
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 22
; EnableXP