<?php
// Incluir o arquivo de conexão
include("conexao.php");

// Obter dados do formulário
$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

//validamos que todos os campos sejam preenchidos
if (!$usuario || !$senha) {
    echo "Preencha todos os campos.";
    exit;
}

// Consultar o login
$query = "SELECT * FROM login WHERE usuario = :usuario";
$varVerifica = $pdo->prepare($query);
$varVerifica->bindParam(':usuario', $usuario);
$varVerifica->execute();

// Verificar se o usuário existe
$usuario_bd = $varVerifica->fetch(PDO::FETCH_ASSOC);

if ($usuario_bd) {
    // Verificar se a senha fornecida é válida
    if (password_verify($senha, $usuario_bd['senha'])) {
        // Iniciar sessão e salvar o usuário logado
        session_start();
        $_SESSION['usuario'] = $usuario_bd['usuario'];

        echo "<script>
                    alert('Login bem-sucedido!');
                    window.location.href = 'home.php'; // Redireciona para home.php
                  </script>";
        exit();
    } else {
        // Senha incorreta
        echo "<script>
                    alert('Senha incorreta.');
                    window.location.href = 'login.php'; // Redireciona de volta para login
                  </script>";
        exit();
    }
} else {
    // Usuário não encontrado
    echo "<script>
                alert('Usuário não encontrado.');
                window.location.href = 'login.php'; // Redireciona de volta para login
              </script>";
    exit();
}

?>