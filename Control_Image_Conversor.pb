;---------------------------------------
; Programa Image Conversor
; (c) Ricardo Ponce
; https://profesorponce.blogspot.com/
;---------------------------------------
;
; Programa  ejmeplo para incluir un Menu
; Programa de ejemplo para entender conceptos básicos
; para compilar use F5 o vaya al menu Compiler/Compile-Run
;
; DECODIFICADOR = es un componente de software que le permite LEER una imagen al compilador
; CODIFICADOR = es un componente de software que le permite al compilador GRABAR una imagen en un formato definido
;
; Este programa requiere de los archivos graficos:
;
;     Open.png      Img_03.jpg
;     Save.png      Img_04.jpg
;     Img_01.jpg    Img_05.jpg
;     Img_02.jpg    Img_06.jpg
;
; Descarguelos de la misma carpeta GitHub que contiene  
; este codigo fuente
;
; Activar los decodificadores de imagen soportados por PureBasic
UseJPEGImageDecoder()
UseTGAImageDecoder()
UsePNGImageDecoder()
UseTIFFImageDecoder()

; Activar los codificadores soportados por PureBasic
UseJPEGImageEncoder()
UsePNGImageEncoder()


If OpenWindow(0, 0, 0, 250, 130, "Convertidor de Imágenes", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

  CreateToolBar(0, WindowID(0))
    ToolBarImageButton(0, LoadImage(0, "Open.png")) ;carga una imagen en la ToolBar
    ToolBarImageButton(1, LoadImage(0, "Save.png")) ;carga una imagen en la ToolBar
    DisableToolBarButton(0, 1, 1)    ; desabilita el botón GRABAR
    
  ImageGadget(0, 0, 28, WindowWidth(0), WindowHeight(0), 0, #PB_Image_Border)
  
  Repeat
    Event = WaitWindowEvent()
    
    If Event = #PB_Event_Menu  ; La ToolBar de windows se detecta como un menu
    
      Select EventMenu()
      
        Case 0  ; Open
          
          ; la funcion GetCurrentDirectory() obtiene el path actual en formato string
          Filename$ = OpenFileRequester("Elija una imagen", GetCurrentDirectory(), "Formatos de imagen soportados|*.bmp;*.jpg;*.png;*.tif;*.tga", 0)
          If Filename$
          
            If LoadImage(0, Filename$)
              SetGadgetState(0, ImageID(0))    ; cambia la imagen en el gadget
              DisableToolBarButton(0, 1, 0)    ; activa el botón grabar
              ResizeWindow(0, #PB_Ignore, #PB_Ignore, ImageWidth(0)+4, ImageHeight(0)+34)
            EndIf
          
          EndIf
        
        Case 1  ; Save
          
          Filename$ = SaveFileRequester("Grabar una imagen como", Left(Filename$, Len(Filename$)-Len(GetExtensionPart(Filename$))-1), "BMP Format|*.bmp|JPEG Format|*.jpg|PNG Format|*.png", 0)
          If Filename$
          
            Select SelectedFilePattern()
            
              Case 0  ; caso de formato BMP
                ImageFormat = #PB_ImagePlugin_BMP
                Extension$  = "bmp"

              Case 1  ; caso de formato JPEG
                ImageFormat = #PB_ImagePlugin_JPEG
                Extension$  = "jpg"
                
              Case 2  ; caso de formato PNG
                ImageFormat = #PB_ImagePlugin_PNG
                Extension$  = "png"

            EndSelect
            
            If LCase(GetExtensionPart(Filename$)) <> Extension$
              Filename$ + "." + Extension$
            EndIf
            
            If SaveImage(0, Filename$, ImageFormat)
              MessageRequester("Información", "Imagen grabada con éxito", 0)
            EndIf
          
          EndIf
      
      EndSelect
    
    EndIf
    
  Until Event = #PB_Event_CloseWindow  ; espera a que el usuario presione el botón de cierre de ventana
  
EndIf

End   ; Final del programa (se llega aqui cuando el usuario elige salir)
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 18
; EnableXP