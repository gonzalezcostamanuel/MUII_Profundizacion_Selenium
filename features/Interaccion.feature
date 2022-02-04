Feature: Pruebas sobre interaccion con la interfaz


  Scenario Outline: Entrando al boton About del menu lateral

     Given se ha inicializado el contexto
      When se lanza el login con "<usuario>" y "<contrasena>"
      And se pulsa el boton que tiene por nombre de id "<botonMenu>"
      # Se necesita esperar a que aparezca en pantalla el elemento a clicar
      And wait 1 sec
      And se pulsa el boton que tiene por nombre de id "<botonAbout>"
      Then se reenvia a la url "<url>"
      Examples:
        | usuario         | contrasena    | botonMenu              | botonAbout         | url                     |
        | standard_user   | secret_sauce  | react-burger-menu-btn  | about_sidebar_link | https://saucelabs.com/  |


  Scenario Outline: Añadiendo la mochila al carrito

     Given se ha inicializado el contexto
      When se lanza el login con "<usuario>" y "<contrasena>"
      And se pulsa el boton que tiene por nombre de id "<articulo>"

      # Se necesita esperar a que aparezca en pantalla el elemento a clicar
      And wait 1 sec
      And se pulsa el boton que tiene por nombre de id "<anadirCarrito>"
      And se pulsa el boton que tiene por nombre de clase "<btnCarrito>"
      And wait 1 sec
      Then aparece la clase "<claseArticulo>" en pantalla
      And se comprueba que el elemento con la clase "<claseArticulo>" tiene el texto asociado de "<texto>"
      Examples:
        | usuario         | contrasena    | articulo              |anadirCarrito                   | btnCarrito          | claseArticulo        | texto                 |
        | standard_user   | secret_sauce  | item_4_title_link   |add-to-cart-sauce-labs-backpack | shopping_cart_link  | inventory_item_name  | Sauce Labs Backpack   |


