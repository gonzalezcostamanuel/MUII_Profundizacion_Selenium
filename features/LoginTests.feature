Feature: Pruebas sobre el login

  """
  Se introducen usuarios y contraseñas incorrectas y se chequea que aparece el cuadro de error. Estaría bien chequear
  también que el texto del cuadro de error es el que esperamos, pero para esta prueba nos sirve así
  """
  Scenario Outline: Login con credenciales incorrectas

     Given se ha inicializado el contexto
      When se lanza el login con "<usuario>" y "<contrasena>"
      Then aparece la clase "<elemento>" en pantalla
      Examples:
        | usuario         | contrasena    | elemento  |
        | badUser         | secret_sauce  | error     |
        | standard_user   | badPass       | error     |


    """
    Se introduce un usuario y contraseña correctos y se comprueba que aparece un elemento caracerístico de la ventana
    principal como es el botón de menú. Se hacen pruebas con varios usuarios y contraseñas
    """
  Scenario Outline: Login con credenciales correctas

     Given se ha inicializado el contexto
      When se lanza el login con "<usuario>" y "<contrasena>"
      Then aparece el id "<elemento>" en pantalla
      Examples:
        | usuario           | contrasena        | elemento             |
        | standard_user     | secret_sauce      | react-burger-menu-btn     |
        | locked_out_user   | secret_sauce      | react-burger-menu-btn     |
        | problem_user      | secret_sauce      | react-burger-menu-btn     |
        | performance_glitch_user   | secret_sauce      | react-burger-menu-btn     |