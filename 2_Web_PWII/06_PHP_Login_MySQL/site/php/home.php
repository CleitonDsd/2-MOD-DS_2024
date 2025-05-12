<?php
session_start(); // Inicia a sessão

if (isset($_SESSION['usuario'])) {
    echo "Bem-vindo, " . $_SESSION['usuario'] . "!";
} else {
    echo "Usuário não autenticado.";
}
?>

<html>
    <head>
        <meta charset="UTF-8"/> 
        <title>Tela de HOME</title>
    </head>
    <body>
        <h1>Olá, seja bem vindo!</h1>
        <br/>
        <hr/>
        <h2>Página inicial do nosso site.</h2>
    </body>
</html>