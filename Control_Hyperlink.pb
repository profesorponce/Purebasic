;---------------------------------------
; Programa Hyperlink
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de Hyperlink
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #HYPERLINK
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 280, 300, "Hyperlinks", #FLAGS)
     
       ; Ejemplo de control hyperlink
       HyperLinkGadget(#HYPERLINK, 90, 50, 100, 25, "ProfesorPonce", #PB_Web_HtmlCode)
       ;#PB_HyperLink_Underline: Draw a line under the text without the need To use an underlined font.
       
       ;SetGadgetItemText(#HYPERLINK, #PB_Web_HtmlCode, "https://profesorponce.blogspot.com/")


       ButtonGadget(#BUTTON, 80, 260, 100, 25, "Ir al link")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #HYPERLINK
                    RunProgram("https://profesorponce.blogspot.com/")

                 Case #BUTTON 
                    ;Quit = #True
                    ;MessageRequester("Unidad elegida", GetGadgetText(#EXPLORER_TREE))
                    RunProgram("https://profesorponce.blogspot.com/")
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 22
; FirstLine = 15
; EnableXP