;---------------------------------------
; Programa Explorer_Tree
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de Explorer Tree
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #EXPLORER_TREE
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 280, 300, "Explorer Tree", #FLAGS)
     
       ; Ejemplo de tipos de explorer tree
       ExplorerTreeGadget(#EXPLORER_TREE, 20, 10, 240, 230, "")
       ;#PB_Explorer_BorderLess          : Create Gadget without borders.
       ;#PB_Explorer_AlwaysShowSelection : The selection is still visible, even when the gadget is Not activated.
       ;#PB_Explorer_NoLines             : Hide the little lines between each node.
       ;#PB_Explorer_NoButtons           : Hide the '+' node buttons.
       ;#PB_Explorer_NoFiles             : No files will be displayed.
       ;#PB_Explorer_NoDriveRequester    : There will be no 'please insert drive X:' displayed.
       ;#PB_Explorer_NoMyDocuments       : The 'My Documents' Folder will Not be displayed As a separate item.
       ;#PB_Explorer_AutoSort            : The content will be sorted automatically by name.

       ButtonGadget(#BUTTON, 80, 260, 100, 25, "Get Path")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #EXPLORER_TREE
                   SetWindowTitle(#WIN_MAIN, GetGadgetText(#EXPLORER_TREE))

                 Case #BUTTON 
                    ;Quit = #True
                    MessageRequester("Unidad elegida", GetGadgetText(#EXPLORER_TREE))
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 33
; FirstLine = 24
; EnableXP