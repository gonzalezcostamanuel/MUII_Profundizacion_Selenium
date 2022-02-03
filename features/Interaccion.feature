Feature: Pruebas sobre interaccion con la interfaz

  """
  Se introducen usuarios y contraseñas incorrectas y se chequea que aparece el cuadro de error. Estaría bien chequear
  también que el texto del cuadro de error es el que esperamos, pero para esta prueba nos sirve así
  """
  Scenario Outline: Entrando al boton About del menu lateral

     Given se ha inicializado el contexto
      When se lanza el login con "<usuario>" y "<contrasena>"
      And se pulsa el boton que tiene por nombre de id "<botonMenu>"
      # Se necesita esperar a que aparezca en pantalla el elemento a clicar
      And wait 1 sec
      And se pulsa el boton que tiene por nombre de id "<botonAbout>"
      Then se reenvia a la url "<url>"
      Examples:
        | usuario         | contrasena    | botonMenu              | botonAbout         | url                    |
        | standard_user   | secret_sauce  | react-burger-menu-btn  | about_sidebar_link | https://saucelabs.com/  |
