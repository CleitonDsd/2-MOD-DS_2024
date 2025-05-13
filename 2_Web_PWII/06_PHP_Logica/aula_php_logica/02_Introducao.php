<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PWII</title>
</head>
<body>
    
    
    <?php
        //escrever na tela 


        //variáveis 
        $nome = "Cleiton"; 
      
        $idade   = 24; //inteiro
        $altura  = 1.80; //real
        $isAluno = true; //booleano


        //concatenando textos
        echo "Meu nome é $nome";

        //variaveis são CASE SENSITIVE
        $texto = "isso";
        $Texto = "disso";

        echo "$texto é diferente $Texto";

        //quebrando linhas
        echo "<br><br><br><hr>";

        
        //<br> = quebra de linha
        echo "<br> nome: $nome <br> idade: $idade <br> altura: $altura";
    
    ?>
</body>
</html>