<?php

    //declarar duas váriaveis e atribuir a elas
    //o valor que foi digitado no POST do formulário.

    //na var nome, vamos receber o que foi digitado no campo nome do form
    $nome = $_POST["nome"];

    $idade = $_POST["idade"];

    //verificando se a idade é adulto ou não
    if($idade >= 18){
        echo "Olá $nome, você é adulto e possui $idade anos <br>";
    }else{
        echo "Olá $nome, você é menor de idade e possui $idade anos <br>";
    }

//$mediaAluno = 8.256;

//$mediaFormatada = number_format($mediaAluno, 2, ',', '.'); // ex: 8,26
?>