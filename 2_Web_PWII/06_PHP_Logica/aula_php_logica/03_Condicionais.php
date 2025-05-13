<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Condicionais</title>
</head>
<body>
    <?php

        //exemplo 1
        $idade = 18;
        if ($idade >= 18){
            echo "Maior de idade <br>";
        }else{
            echo "Menor de idade <br>";
        }
        echo "<br><hr>";

        //exemplo 2
        $possuiAcesso = false;
        if (!$possuiAcesso){
            echo "acesso negado <br>";
        }else{ 
            echo "acesso autorizado <br>";
        }


        echo "<br><hr>";
        
        //exemplo 3
        $mediaAluno = 9;

        if($mediaAluno >= 9){
            echo "Nota: MB";

        }else if($mediaAluno >= 7 && $mediaAluno <= 8){
            echo "Nota: B";

        }else if ($mediaAluno >= 5 && $mediaAluno < 7){
            echo "Nota: R";
            
        }else if ($mediaAluno >= 0 && $mediaAluno < 5){
            echo "Nota: I";
        } else{
            echo "Média Inválida";
        }
        

    ?>    
</body>
</html>