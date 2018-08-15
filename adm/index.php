<?php
session_start();
ob_start();
$seg = true;
include_once './config/config.php';
include_once './config/conexao.php';
include_once './lib/lib_valida.php';
include_once './lib/lib_permissao.php';

$url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_STRING);
$url_limpa = limparUrl($url);

if(isset($_SESSION['adms_niveis_acesso_id'])){
    $adms_niveis_acesso_id = $_SESSION['adms_niveis_acesso_id'];
}else{
    $adms_niveis_acesso_id = 0;
}
$result_pg = "SELECT pg.id id_pg, pg.tp_pagina, pg.endereco 
        FROM adms_paginas pg
        LEFT JOIN adms_nivacs_pgs nivpg ON nivpg.adms_pagina_id=pg.id        
        WHERE pg.endereco='" . $url_limpa . "' 
        AND (pg.adms_sits_pg_id=1
        AND (nivpg.adms_niveis_acesso_id='" . $adms_niveis_acesso_id . "'
        AND nivpg.permissao=1) OR (pg.lib_publico=1))
        LIMIT 1";
$resultado_pg = mysqli_query($conn, $result_pg);
?>
<!DOCTYPE html>
<html lang="pt-br">
    <?php
    if (($resultado_pg) AND ( $resultado_pg->num_rows != 0)) {
        $row_pg = mysqli_fetch_assoc($resultado_pg);
        $file = "app/" . $row_pg['tp_pagina'] . "/" . $row_pg['endereco'] . ".php";
        if (file_exists($file)) {
            include $file;
        } else {
            include 'app/adms/visualizar/home.php';
        }
    } else {
        //include 'app/adms/visualizar/home.php';
        //echo "sem acesso a pagina";
        $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
        $url_destino = pg . '/acesso/login';
        header("Location: $url_destino");
    }
    ?>
</html>
