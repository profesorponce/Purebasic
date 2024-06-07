;---------------------------------------
; Programa Fichero Completo Random
; 
; Con estructura de datos
; Y fichero de lectura Random
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
 
 ; estructura del los campos del registro
 Structure Campos
   Nombre.s
   Apellido.s
   DNI.s
 EndStructure  
 
 ;tamaño predefinido para campos y registro
 #Largo_Nombre = 50
 #Largo_Apellido = 30
 #Largo_DNI = 8
 #Largo_Registro = #Largo_Nombre + #Largo_Apellido + #Largo_DNI
 
 Global Registro.Campos
 
 ; variabls globales 
 Global Quit.b = #False
 Global var_fichero$ = "c:\temp\binario.txt"
 Global var_CantidadRegistrosGrabados.i
 Global var_PosicionActualLectura.i
 Global Ficha_a_Leer.s
 
 
 ;codigos de error
 Global CODIGO_ERROR.b = 0
 ;CODIGO_ERROR.b = 0 (sin error)
 ;CODIGO_ERROR.b = 1 (falta nombre)
 ;CODIGO_ERROR.b = 2 (falta apellido)
 ;CODIGO_ERROR.b = 3 (falta DNI)
 
 ;Propiedades de la ventana inicial y principal
 #FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
 
 Procedure.s Leer_Registro (registro_a_leer.i)
   
   ; la lectura de un registro se calcula en base
   ; al tamaño del registro y el posicionamiento 
   ; de los datos dentro de un archivo binario
   
   Posicion_de_Lectura.i = 0
   Ficha_leida.s =""  
   Auxiliar.i = 0
   
   ;se calcula la posición actual del puntero 
   ;de lectura en base al numero de registro
   ;que se debe leer
   Posicion_de_Lectura = (#Largo_Registro * registro_a_leer) - #Largo_Registro
         
   If ReadFile(1, var_fichero$) ;apertura del fichero
     FileSeek(1, Posicion_de_Lectura) ;posicionamiento del puntero de lecto-escritura
     Ficha_leida = ReadString(1 , #PB_Ascii , #Largo_Registro) ;extracción de datos
     CloseFile(1)  ;cierre del archivo
   Else
     Ficha_leida = "" ;no se pudo abrir
   EndIf
   
   ProcedureReturn Ficha_leida  ;retorno de datos
   
 EndProcedure  
 
 Procedure.i Registros_Grabados()
   
   numero_registros.i = 0
   
   If ReadFile(1, var_fichero$) 
     numero_registros = Lof(1) / #Largo_Registro
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
                      SetGadgetText(#NRO_FICHA,"Ficha Nº "+Str(Registros_Grabados()+1))
                      SetGadgetText(#TEXTBOX_1,"")
                      SetGadgetText(#TEXTBOX_2,"")
                      SetGadgetText(#TEXTBOX_3,"")
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
                        
                        var_PosicionActualLectura = 1
                                               
                        Ficha_a_Leer = Leer_Registro(var_PosicionActualLectura)
                        
                        ;MessageRequester("Registro", Ficha_a_Leer)
                        
                        Registro\Nombre = Mid(Ficha_a_Leer, 1, #Largo_Nombre)
                        Registro\Apellido = Mid(Ficha_a_Leer, #Largo_Nombre + 1, #Largo_Apellido)
                        Registro\DNI =  Mid(Ficha_a_Leer, #Largo_Nombre + #Largo_Apellido + 1, #Largo_DNI)
                      
                        SetGadgetText( #TEXTBOX_1,Registro\Nombre )
                        SetGadgetText( #TEXTBOX_2,Registro\Apellido )
                        SetGadgetText( #TEXTBOX_3,Registro\DNI )
                      
                        SetGadgetText(#NRO_FICHA,Str(var_PosicionActualLectura)+" de "+Str(var_CantidadRegistrosGrabados))
                        
                      EndIf  
                      
                     Case #MENU_AYUDA_ITEM1
                      
                     Case #MENU_AYUDA_ITEM2
                       RunProgram ("https://about.me/ricardo.ponce")
                       
                   EndSelect
                   ; fin eventos de emnu---------------------------------------------
                   
                   
               ;---------------------------------------------------------------------  
               Case #PB_Event_Gadget  ; llego un evento de control (botón, combobox, etc)
                   ; eventos de controles -------------------------------------------    
                 
                  Select EventGadget()
                    ;#BOTON_1 = "< Anterior"
                    Case #BOTON_1  
                      var_PosicionActualLectura = var_PosicionActualLectura - 1
                      If var_PosicionActualLectura < 1
                        var_PosicionActualLectura = var_CantidadRegistrosGrabados 
                      EndIf
                      
                      Ficha_a_Leer = Leer_Registro(var_PosicionActualLectura)
                      
                      Registro\Nombre = Mid(Ficha_a_Leer, 1, #Largo_Nombre)
                      Registro\Apellido = Mid(Ficha_a_Leer, #Largo_Nombre + 1, #Largo_Apellido)
                      Registro\DNI =  Mid(Ficha_a_Leer, #Largo_Nombre + #Largo_Apellido + 1, #Largo_DNI)
                      
                      SetGadgetText( #TEXTBOX_1,Registro\Nombre )
                      SetGadgetText( #TEXTBOX_2,Registro\Apellido )
                      SetGadgetText( #TEXTBOX_3,Registro\DNI )
                      
                      SetGadgetText(#NRO_FICHA,Str(var_PosicionActualLectura)+" de "+Str(var_CantidadRegistrosGrabados))
                      
                    ;#BOTON_3 = "Siguiente >"
                    Case#BOTON_3
                      
                      var_PosicionActualLectura = var_PosicionActualLectura + 1
                      If var_PosicionActualLectura > var_CantidadRegistrosGrabados
                        var_PosicionActualLectura = 1 
                      EndIf
                                                               
                      Ficha_a_Leer = Leer_Registro(var_PosicionActualLectura)
                      
                      Registro\Nombre = Mid(Ficha_a_Leer, 1, #Largo_Nombre)
                      Registro\Apellido = Mid(Ficha_a_Leer, #Largo_Nombre + 1, #Largo_Apellido)
                      Registro\DNI =  Mid(Ficha_a_Leer, #Largo_Nombre + #Largo_Apellido + 1, #Largo_DNI)
                      
                      SetGadgetText( #TEXTBOX_1,Registro\Nombre )
                      SetGadgetText( #TEXTBOX_2,Registro\Apellido )
                      SetGadgetText( #TEXTBOX_3,Registro\DNI )

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
                        
                        ; Extraccion de datos desde el form
                        Registro\Nombre = Left(GetGadgetText(#TEXTBOX_1),#Largo_Nombre) ;limita los caracteres ingresados
                        If Len(Registro\Nombre) < #Largo_Nombre ;completa el tamaño del campo
                           Registro\Nombre = Registro\Nombre + Space(#Largo_Nombre - Len(Registro\Nombre))
                        EndIf  
   
                        Registro\Apellido = Left(GetGadgetText(#TEXTBOX_2),#Largo_Apellido) ;limita los caracteres ingresados
                        If Len(Registro\Apellido) < #Largo_Apellido ;completa el tamaño del campo
                           Registro\Apellido = Registro\Apellido + Space(#Largo_Apellido - Len(Registro\Apellido))
                        EndIf  
                        
                        Registro\DNI = Left(GetGadgetText(#TEXTBOX_3),#Largo_DNI) ;limita los caracteres ingresados
                        If Len(Registro\DNI) < #Largo_DNI ;completa el tamaño del campo
                           Registro\DNI = Registro\DNI + Space(#Largo_Apellido - Len(Registro\DNI))
                        EndIf 
                        
                        Ficha_a_Grabar.s = Registro\Nombre+Registro\Apellido + Registro\DNI
                        
                        ; hay datos ingresados y se puede grabar                        
                        If OpenFile(1, var_fichero$)   ; crea o abre el fichero de datos
                          FileSeek(1, Lof(1))          ; posiciona al puntero de grabacion de datos al final
                          WriteString(1,Ficha_a_Grabar)
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
; CursorPosition = 94
; FirstLine = 63
; Folding = -
; EnableXP
; Executable = ..\Clase.2023.09.19.(Purebasic)\PrgPrueba.exe