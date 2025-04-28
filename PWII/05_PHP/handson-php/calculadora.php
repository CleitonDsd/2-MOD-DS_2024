<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora Simples</title>
</head>
<body>
    <h2 align="center">Calculadora</h2>

    <!-- Formulário para pegar os números e operação -->
    <form method="POST" align="center">
        <input type="number" name="numero1" placeholder="Digite o primeiro número" required>
        <input type="number" name="numero2" placeholder="Digite o segundo número" required>
        <br><br>
        <select name="operacao" required>
            <option value="">Escolha a operação</option>
            <option value="soma">Soma</option>
            <option value="subtracao">Subtração</option>
            <option value="multiplicacao">Multiplicação</option>
            <option value="divisao">Divisão</option>
        </select>
        <br><br>
        <input type="submit" value="Calcular">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Receber os valores do formulário
        $numero1 = $_POST['numero1'];
        $numero2 = $_POST['numero2'];
        $operacao = $_POST['operacao'];

        // Variável para armazenar o resultado
        $resultado = 0;
        $erro = "";

        // Realizar a operação dependendo da escolha
        if ($operacao == "soma") {
            $resultado = $numero1 + $numero2;
        } elseif ($operacao == "subtracao") {
            $resultado = $numero1 - $numero2;
        } elseif ($operacao == "multiplicacao") {
            $resultado = $numero1 * $numero2;
        } elseif ($operacao == "divisao") {
            // Verificar se o divisor não é zero
            if ($numero2 == 0) {
                $erro = "Não é possível dividir por zero!";
            } else {
                $resultado = $numero1 / $numero2;
            }
        } else {
            $erro = "Operação inválida!";
        }

        // Exibir o resultado ou erro
        if ($erro) {
            echo "<p align='center' style='color:red;'>$erro</p>";
        } else {
            echo "<p align='center'><strong>Resultado: </strong>$resultado</p>";
        }
    }
    ?>

</body>
</html>
