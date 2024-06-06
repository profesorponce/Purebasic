;---------------------------------------
; Programa Fichero Completo
; Usando Archivos Secuenciales
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Implementación paso a paso de un programa
; completo que trabaja con ficheros grabados en disco
; se desarrolla clase a clase

 ; constantes de controles
 Enumeration
   #WINDOW_MAIN
   
   #MENU_MAIN
   #MENU_ARCHIVO_ITEM1
   #MENU_ARCHIVO_ITEM2
   #MENU_AYUDA_ITEM1
   #MENU_AYUDA_ITEM2
   
   #BOTON_1
   #BOTON_2
   #BOTON_3
   
   #NRO_FICHA
   
   #ETIQUETA_1
   #ETIQUETA_2
   #ETIQUETA_3
   
   #TEXTBOX_1
   #TEXTBOX_2
   #TEXTBOX_3
 EndEnumeration
 
 ; variabls globales 
 Global Quit.b = #False
 Global var_fichero$ = "c:\temp\test.txt"
 Global var_CantidadRegistrosGrabados.i
 Global var_PosicionActualLectura.i
 
 
 ;codigos de error
 Global CODIGO_ERROR.b = 0
 ;CODIGO_ERROR.b = 0 (sin error)
 ;CODIGO_ERROR.b = 1 (falta nombre)
 ;CODIGO_ERROR.b = 2 (falta apellido)
 ;CODIGO_ERROR.b = 3 (falta DNI)
 
 ;Propiedades de la ventana inicial y principal
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Procedure.s Leer_Registro (registro_a_leer.i)
   
   Ficha_leida.s =""
   k.i = 0
   
   If ReadFile(1, var_fichero$) 
     For k = 1 To registro_a_leer 
        Ficha_leida = ReadString(1)
     Next
     CloseFile(1)            
   Else
     Ficha_leida=""
   EndIf
   
   ProcedureReturn Ficha_leida
   
 EndProcedure  
 
 Procedure.i Registros_Grabados()
   
   numero_registros.i = 0
   
   If ReadFile(1, var_fichero$) 
     While Eof(1) = 0
       ReadString(1)
       numero_registros = numero_registros +1 
     Wend
     CloseFile(1)             
   Else
     numero_registros = 0
   EndIf
   
   ProcedureReturn numero_registros
  
 EndProcedure 
  
 
    If OpenWindow(#WINDOW_MAIN, 0, 0, 600, 400, "Modo Grabacion", #FLAGS)
   
      If CreateMenu(#MENU_MAIN, WindowID(#WINDOW_MAIN))
         
         MenuTitle("Principal")
         MenuItem(#MENU_ARCHIVO_ITEM1, "Grabar nueva ficha")
         MenuItem(#MENU_ARCHIVO_ITEM2, "Visualizar fichas ingresadas")
         
         MenuTitle("Ayuda")
         MenuItem(#MENU_AYUDA_ITEM1, "Sistemita de ayuda")
         MenuItem(#MENU_AYUDA_ITEM2, "Link a su pagina web de programador")
         
         ButtonGadget(#BOTON_1, 40, 320, 100, 25, "< Anterior")
         ButtonGadget(#BOTON_2, 240, 320, 100, 25, "Grabar")
         ButtonGadget(#BOTON_3, 420, 320, 100, 25, "Siguiente >")
         
         DisableGadget(#BOTON_1,#True)
         DisableGadget(#BOTON_3,#True)
         
         TextGadget(#NRO_FICHA, 500, 20, 70, 25, "Ficha Nº "+Str(Registros_Grabados()+1),#PB_Text_Center)
         
         TextGadget(#ETIQUETA_1, 30, 70, 100, 25, "Nombre")
         TextGadget(#ETIQUETA_2, 30, 130, 100, 25, "Apellido")
         TextGadget(#ETIQUETA_3, 30, 190, 100, 25, "DNI")
  
         StringGadget(#TEXTBOX_1, 160, 70, 290, 25, "")   ;NOMBRE
         StringGadget(#TEXTBOX_2, 160, 130, 290, 25, "")  ;APELLIDO
         StringGadget(#TEXTBOX_3, 160, 190, 220, 25, "")  ;DNI
  
         Repeat
            Event.l = WaitWindowEvent()   ;traeel codigo de evento del sistema operativo
   
            Select Event  ;según el tipo de evento que llega se decide que hacer
                
              ;----------------------------------------------------------------------  
              Case #PB_Event_Menu ; llegó un evento de menu
                  ; eventos de menu -------------------------------------------------
                
                  Select EventMenu()
                    Case #MENU_ARCHIVO_ITEM1
                      DisableGadget(#BOTON_1,#True)
                      DisableGadget(#BOTON_2,#False)
                      DisableGadget(#BOTON_3,#True)
                      SetWindowTitle(#WINDOW_MAIN, "Modo Grabacion")
                      ;MessageRequester("#MENU_ARCHIVO_ITEM1", "Item 1 del menu ARCHIVO.")
                      
                     ;menu de consulta ------------------------------------- 
                     Case #MENU_ARCHIVO_ITEM2
                      DisableGadget(#BOTON_1,#False)
                      DisableGadget(#BOTON_2,#True)
                      DisableGadget(#BOTON_3,#False)
                      SetWindowTitle(#WINDOW_MAIN, "Modo Consulta")
                      var_CantidadRegistrosGrabados = Registros_Grabados()
                      
                      If var_CantidadRegistrosGrabados < 1
                        MessageRequester("No hay registros", "No hay registros grabados en la bdd")
                      Else  
                        SetGadgetText(#NRO_FICHA,"1 de "+Str(var_CantidadRegistrosGrabados))
                        ;MessageRequester("Ficha leida", Leer_Registro(1))
                        SetGadgetText(#TEXTBOX_1,StringField(Leer_Registro(1), 1, ","))
                        SetGadgetText(#TEXTBOX_2,StringField(Leer_Registro(1), 2, ","))
                        SetGadgetText(#TEXTBOX_3,StringField(Leer_Registro(1), 3, ","))
                        var_PosicionActualLectura =1
                        
                      EndIf  
                      
                     Case #MENU_AYUDA_ITEM1
                     Case #MENU_AYUDA_ITEM2
                   EndSelect
                   ; fin eventos de emnu---------------------------------------------
                   
                   
               ;---------------------------------------------------------------------  
               Case #PB_Event_Gadget  ; llego un evento de control (botón, combobox, etc)
                   ; eventos de controles -------------------------------------------    
                 
                  Select EventGadget()
                    ;#BOTON_1 = "< Anterior"
                      
                    ;#BOTON_3 = "Siguiente >"
                    Case#BOTON_3
                      var_PosicionActualLectura = var_PosicionActualLectura + 1
                      If var_PosicionActualLectura > var_CantidadRegistrosGrabados
                        var_PosicionActualLectura = 1 
                      EndIf
                      ;MessageRequester("Ficha leida", Str(var_PosicionActualLectura))
                      SetGadgetText(#TEXTBOX_1,StringField(Leer_Registro(var_PosicionActualLectura), 1, ","))
                      SetGadgetText(#TEXTBOX_2,StringField(Leer_Registro(var_PosicionActualLectura), 2, ","))
                      SetGadgetText(#TEXTBOX_3,StringField(Leer_Registro(var_PosicionActualLectura), 3, ","))
                      SetGadgetText(#NRO_FICHA,Str(var_PosicionActualLectura)+" de "+Str(var_CantidadRegistrosGrabados))
                    ;#BOTON_2 = "Grabar"
                    Case #BOTON_2
                      
                      ;verifica si estan listos los campos del registro  
                      If GetGadgetText(#TEXTBOX_1)="" 
                        CODIGO_ERROR = 1 ;(falta nombre)
                      EndIf  
                      If GetGadgetText(#TEXTBOX_2)="" 
                        CODIGO_ERROR = 2 ;(falta apellido)  
                      EndIf  
                      If GetGadgetText(#TEXTBOX_3)="" 
                        CODIGO_ERROR = 3 ;(falta DNI)
                      EndIf  
                      
                      
                      If CODIGO_ERROR <> 0
                        
                        ; en caso de error no se puede grabar  
                        Select CODIGO_ERROR
                          Case 1: MessageRequester("Error!","Debe ingresar un nombre")
                          Case 2: MessageRequester("Error!","Debe ingresar un apellido")  
                          Case 3: MessageRequester("Error!","Debe ingresar un número de DNI")
                          Default 
                        EndSelect
                        
                        ;reinicializa el codigo de error para que no quede "pegado"
                        CODIGO_ERROR = 0
                        
                      Else
                        
                        ; hay datos ingresados y se puede grabar                        
                        If OpenFile(1, var_fichero$)   ; crea o abre el fichero de datos
                          FileSeek(1, Lof(1))          ; posicional al puntero de grabacion de datos al final
                          WriteStringN(1,GetGadgetText(#TEXTBOX_1)+","+GetGadgetText(#TEXTBOX_2)+","+GetGadgetText(#TEXTBOX_3))
                          CloseFile(1)
                        EndIf
                        
                        ; se avisa al usuario que los datos se enviaron al disco
                        MessageRequester("GRABACION!","Se grabaron los datos en disco")
                        
                        ; se limpian los campos del registro
                        SetGadgetText(#TEXTBOX_1,"")
                        SetGadgetText(#TEXTBOX_2,"")
                        SetGadgetText(#TEXTBOX_3,"")
                        
                        ; actualizacion del numero de registro
                        SetGadgetText(#NRO_FICHA,"Ficha Nº "+Str(Registros_Grabados()+1)) 
                       
                      EndIf  
                           ;Quit = #True
                  EndSelect;EventGadget
                  
                   ; fin eventos de controles ----------------------------------------
            EndSelect
          Until Event = #PB_Event_CloseWindow Or Quit = #True
          
      EndIf
        
    EndIf
    
; fin del programa 
End
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 178
; FirstLine = 169
; Folding = -
; EnableXP
; Executable = ..\Clase.2023.09.19.(Purebasic)\PrgPrueba.exe