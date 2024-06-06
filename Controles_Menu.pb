;---------------------------------------
; Programa Menu
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Programa  ejmeplo para incluir un Menu
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run

Enumeration
   #WINDOW_MAIN
   #MENU_MAIN
   #MENU_ARCHIVO_ITEM1
   #MENU_ARCHIVO_ITEM2
   #MENU_AYUDA_ITEM1
   #MENU_AYUDA_ITEM2
 EndEnumeration
 
 Global Quit.b = #False
 
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
    If OpenWindow(#WINDOW_MAIN, 0, 0, 300, 200, "Menu Ejemplo", #FLAGS)
   
      If CreateMenu(#MENU_MAIN, WindowID(#WINDOW_MAIN))
         
         MenuTitle("Archivo")
         MenuItem(#MENU_ARCHIVO_ITEM1, "Item1")
         MenuItem(#MENU_ARCHIVO_ITEM2, "Item2")
         
         MenuTitle("Ayuda")
         MenuItem(#MENU_AYUDA_ITEM1, "Item1")
         MenuItem(#MENU_AYUDA_ITEM2, "Item2")
         
   
         Repeat
            Event.l = WaitWindowEvent()
   
            Select Event
               Case #PB_Event_Menu
                  Select EventMenu()
                     Case #MENU_ARCHIVO_ITEM1
                       MessageRequester("#MENU_ARCHIVO_ITEM1", "Item 1 del menu ARCHIVO.")
                     Case #MENU_ARCHIVO_ITEM2
                        MessageRequester("#MENU_ARCHIVO_ITEM2", "Item 2 del menú ARCHIVO.")  
                     Case #MENU_AYUDA_ITEM1
                        MessageRequester("#MENU_AYUDA_ITEM1", "Item 1 del menu AYUDA.")
                     Case #MENU_AYUDA_ITEM2
                        MessageRequester("#MENU_AYUDA_ITEM2", "Item 2 del menú AYUDA.")     
                    EndSelect
            EndSelect
          Until Event = #PB_Event_CloseWindow Or Quit = #True
          
      EndIf
        
   EndIf
 
End
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 6
; EnableXP
; Executable = ..\Clase.2023.09.19.(Purebasic)\PrgPrueba.exe