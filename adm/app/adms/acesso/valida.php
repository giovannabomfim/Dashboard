<?php
if (!isset($seg)) {
    exit;
}
$SendLogin = filter_input(INPUT_POST, 'SendLogin', FILTER_SANITIZE_STRING);
if ($SendLogin) {
    $usuario_rc = filter_input(INPUT_POST, 'usuario', FILTER_SANITIZE_STRING);
    $usuario = str_ireplace(" ", "", $usuario_rc);
    $senha_rc = filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING);
    $senha = str_ireplace(" ", "", $senha_rc);

    if ((!empty($usuario)) AND ( !empty($senha))) {
        //echo password_hash($senha, PASSWORD_DEFAULT);
        $result_user = "SELECT id, nome, email, senha, adms_niveis_acesso_id FROM adms_usuarios WHERE usuario='$usuario' LIMIT 1";
        $resultado_user = mysqli_query($conn, $result_user);
        if (($resultado_user) AND ( $resultado_user->num_rows != 0)) {
            $row_user = mysqli_fetch_assoc($resultado_user);
            if (password_verify($senha, $row_user['senha'])) {
                //Pesquisar a ordem do nível de acesso
                $result_niv_ac = "SELECT ordem FROM adms_niveis_acessos WHERE id='".$row_user['adms_niveis_acesso_id']."' LIMIT 1";
                $resultado_niv_ac = mysqli_query($conn, $result_niv_ac);
                $row_niv_ac = mysqli_fetch_assoc($resultado_niv_ac);
                
                $_SESSION['id'] = $row_user['id'];
                $_SESSION['nome'] = $row_user['nome'];
                $_SESSION['email'] = $row_user['email'];
                $_SESSION['adms_niveis_acesso_id'] = $row_user['adms_niveis_acesso_id'];                                
                $_SESSION['ordem'] = $row_niv_ac['ordem'];
                
                $url_destino = pg . '/visualizar/home';
                header("Location: $url_destino");
            } else {
                $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
                $url_destino = pg . '/acesso/login';
                header("Location: $url_destino");
            }
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
            $url_destino = pg . '/acesso/login';
            header("Location: $url_destino");
        }
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
        $url_destino = pg . '/acesso/login';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
