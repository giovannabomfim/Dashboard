<?php
if(!isset($seg)){
    exit;
}
function carregar_btn($endereco, $conn){
    $result_btn = "SELECT pg.id id_pg, pg.tp_pagina, pg.endereco 
        FROM adms_paginas pg
        LEFT JOIN adms_nivacs_pgs nivpg ON nivpg.adms_pagina_id=pg.id        
        WHERE pg.endereco='" . $endereco . "' 
        AND (pg.adms_sits_pg_id=1
        AND nivpg.adms_niveis_acesso_id='" . $_SESSION['adms_niveis_acesso_id'] . "'
        AND nivpg.permissao=1)
        LIMIT 1";
    $resultado_btn = mysqli_query($conn, $result_btn);
    if(($resultado_btn) AND ($resultado_btn->num_rows != 0)){
        return true;
    }else{
        return false;
    }
}
