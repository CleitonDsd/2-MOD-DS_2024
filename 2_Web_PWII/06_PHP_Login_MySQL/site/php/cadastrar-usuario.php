<?php

include("conexao.php");

//pegamos os dados do formulário e verificamos se eles possuem algum valor

$usuario = $_POST['usuario'] ?? null;
$senha = $_POST['senha'] ?? null;
$nome = $_POST['nome'] ?? null;
$email = $_POST['email'] ?? null;

//validamos que todos os campos sejam preenchidos
if (!$usuario || !$senha || !$nome || !$email) {
    echo "Preencha todos os campos.";
    exit;
}

//Código que fizemos na aula do dia 28/04
try {
    // Verificar se o nome de usuário já existe
    $varVerifica = $pdo->prepare("SELECT COUNT(*) FROM login WHERE usuario = :usuario");
    $varVerifica->bindParam(':usuario', $usuario);
    $varVerifica->execute();

    if ($varVerifica->fetchColumn() > 0) {
        echo "Usuário já está em uso.";
        exit;
    }

    // Criar hash da senha
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT);

    // Iniciar transação
    $pdo->beginTransaction();

    // Cadastrar/Inserir na tabela login
    $varLogin = $pdo->prepare("INSERT INTO login (usuario, senha) VALUES (:usuario, :senha)");
    $varLogin->bindParam(':usuario', $usuario);
    $varLogin->bindParam(':senha', $senha_hash);
    $varLogin->execute();

    // Pegar o ID do login que acabamos de inserir acima
    //Usario (vamos cadastrar abaixo) tem uma relação com a tabela de login, por isso precisamos pegar o id do login
    $id_login = $pdo->lastInsertId();

    // Cadastrar/Inserir na tabela de usuario
    $varUsuario = $pdo->prepare("INSERT INTO usuario (nome, email, id_login) VALUES (:nome, :email, :id_login)");
    $varUsuario->bindParam(':nome', $nome);
    $varUsuario->bindParam(':email', $email);
    $varUsuario->bindParam(':id_login', $id_login);
    $varUsuario->execute();

    // Finalizar transação
    $pdo->commit();

    echo "Cadastro realizado com sucesso!";

    //caso o cadastro de erro, irá entrar no catch e exibir o erro.
} catch (Exception $e) {
    $pdo->rollBack();
    echo "Erro ao cadastrar: " . $e->getMessage();
}

?>