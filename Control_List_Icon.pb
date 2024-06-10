;---------------------------------------
; Programa List_Icon
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Inclusión de control List Icon
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run



Enumeration
   #WIN_MAIN
   #LISTICON
   #BUTTON
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 If OpenWindow(#WIN_MAIN, 0, 0, 280, 300, "List Icon", #FLAGS)
     
       ; Ejemplo de control hyperlink
       
       ListIconGadget(#LISTICON, 30, 40, 220, 100, "Nombre", 100, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection | #PB_ListIcon_CheckBoxes)
       ;PB_ListIcon_CheckBoxes         : Display checkboxes in the first column.
       ;#PB_ListIcon_ThreeState         : The checkboxes can have an "in between" state.
       ;#PB_ListIcon_MultiSelect        : Enable multiple selection.
       ;#PB_ListIcon_GridLines          : Display separator lines between rows And columns (Not supported on Mac OSX).
       ;#PB_ListIcon_FullRowSelect      : The selection covers the full row instead of the first column (Windows only). 
       ;#PB_ListIcon_HeaderDragDrop     : The order of columns can be changed using drag'n'drop.
       ;#PB_ListIcon_AlwaysShowSelection: The selection is still visible, even when the gadget is Not activated (Windows only).
       
       AddGadgetColumn(#LISTICON, 1, "Dirección", 250) ;agrega una segunda columna
       UltimoLugar.b=-1
       AddGadgetItem(#LISTICON, UltimoLugar, "José López"+Chr(10)+"Dorrego 1370 - Guaymallén")
       AddGadgetItem(#LISTICON, UltimoLugar, "Muriel Díaz"+Chr(10)+"La Paz 5236 - Las Heras")

       ButtonGadget(#BUTTON, 80, 260, 100, 25, "Ver elegido" )
      
      Repeat
         Event.l = WaitWindowEvent()
         Select Event
            Case #PB_Event_Gadget
               Select EventGadget()
                 Case #LISTICON
                    
                 Case #BUTTON 
                   ;La funcion GetGadgetState() actua sobre el texto seleccionado en azul
                   ;
                   ;La funcion GetGadgetItemState(#LISTICON, item) devuelve
                   ; 0 = no elegido
                   ; 1 = cuando se cliquea en el texto y queda en azul el item
                   ; 2 = cuando se cliquea el checkbox
                   ; 3 = cuando se cliquea en el texto y queda en azul el item y cuando se cliquea el checkbox
                   ;
                   ; La funcion CountGadgetItems(#Gadget) cuenta la cantidad de items
                   
                   respuesta.s ="Hay "
                   For aux.i = 1 To CountGadgetItems(#LISTICON)
                      respuesta = GetGadgetItemText(#LISTICON, aux-1) + ", "
                      Select GetGadgetItemState(#LISTICON, aux-1)
                         Case 0: respuesta = respuesta + "no elegido"
                         Case 1: respuesta = respuesta + "texto marcado en azul"   
                         Case 2: respuesta = respuesta + "checkbox marcado"  
                         Case 3: respuesta = respuesta + "checkbox marcado y texto marcado en azul"    
                       EndSelect     
                       MessageRequester("Item: "+Str(aux), respuesta)
                   Next
                                       
               EndSelect ;EventGadget
         EndSelect ;Event
              
      Until Event = #PB_Event_CloseWindow Or Quit = #True 
 
EndIf ;OpenWindow
 
End 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 71
; FirstLine = 49
; EnableXP