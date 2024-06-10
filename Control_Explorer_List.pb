;---------------------------------------
; Programa Explorer_List
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de Explorer List
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #EXPLORER_LIST
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 280, 300, "Explorer List", #FLAGS)
     
       ; Ejemplo de tipos de explorer list
       ExplorerListGadget(#EXPLORER_LIST, 20, 10, 240, 230, "")
       ;#PB_Explorer_BorderLess          : Create Gadget without borders.
       ;#PB_Explorer_AlwaysShowSelection : The selection is visible, even when the gadget is Not activated.
       ;#PB_Explorer_MultiSelect         : Enable multiple selection of items in the gadget.
       ;#PB_Explorer_GridLines           : Display separator lines between rows And columns.
       ;#PB_Explorer_HeaderDragDrop      : In report view, the headers can be changed by Drag'n'Drop.
       ;#PB_Explorer_FullRowSelect       : The selection covers the full row instead of the first column.
       ;#PB_Explorer_NoFiles             : No files will be displayed.
       ;#PB_Explorer_NoFolders           : No folders will be displayed.
       ;#PB_Explorer_NoParentFolder      : There will be no [..] link To the parent folder.
       ;#PB_Explorer_NoDirectoryChange   : The directory cannot be changed by the user.
       ;#PB_Explorer_NoDriveRequester    : There will be no 'please insert drive X:' displayed.
       ;#PB_Explorer_NoSort              : The user cannot sort the content by clicking on a column header.
       ;#PB_Explorer_NoMyDocuments       : The 'My Documents' Folder will Not be displayed As a separate item.
       ;#PB_Explorer_AutoSort            : The content will be sorted automatically by name.
       ;#PB_Explorer_HiddenFiles         : Will display hidden files As well (supported on Linux And OS X only).

      
       ButtonGadget(#BUTTON, 80, 260, 100, 25, "Get Path")
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #EXPLORER_LIST
                   SetWindowTitle(#WIN_MAIN, GetGadgetText(#EXPLORER_LIST))

                 Case #BUTTON 
                    ;Quit = #True
                    MessageRequester("Unidad elegida", GetGadgetText(#EXPLORER_LIST))
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 41
; EnableXP