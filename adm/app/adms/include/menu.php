<nav class="sidebar">
    <ul class="list-unstyled">
        <?php
        $result_menu = "SELECT nivpg.dropdown,
                men.id id_menu, men.nome, men.icone iconmen,
                pg.id id_pg_menu, pg.nome_pagina, pg.endereco, pg.icone iconpg
                FROM adms_nivacs_pgs nivpg
                INNER JOIN adms_menus men ON men.id=nivpg.adms_menu_id
                INNER JOIN adms_paginas pg ON pg.id=nivpg.adms_pagina_id
                WHERE nivpg.adms_niveis_acesso_id='" . $_SESSION['adms_niveis_acesso_id'] . "' 
                    AND nivpg.permissao=1 
                    AND nivpg.lib_menu=1
                    ORDER BY men.ordem, nivpg.ordem ASC";
        $resultado_menu = mysqli_query($conn, $result_menu);

        $cont_drop_fech = 0;
        $cont_drop = 0;
        while ($row_menu = mysqli_fetch_assoc($resultado_menu)) {
            if($row_pg['id_pg'] == $row_menu['id_pg_menu']){
                $menu_ativado = "active";
            }else{
                $menu_ativado = "";
            }
            if ($row_menu['dropdown'] == 1) {
                if ($cont_drop != $row_menu['id_menu']) {
                    if (($cont_drop_fech == 1) AND ($cont_drop != 0)) {
                        echo "</ul>";
                        echo "</li>";
                        $cont_drop_fech = 0;
                    }
                    echo "<li>";
                    echo "<a href='#submenu" . $row_menu['id_menu'] . "' data-toggle='collapse'>";
                    echo "<i class='" . $row_menu['iconmen'] . "'></i> " . $row_menu['nome'] . "";
                    echo "</a>";
                    echo "<ul id='submenu" . $row_menu['id_menu'] . "' class='list-unstyled collapse'>";
                    $cont_drop = $row_menu['id_menu'];
                }
                echo "<li class='$menu_ativado'><a href='" . pg . "/" . $row_menu['endereco'] . "'><i class='" . $row_menu['iconpg'] . "'></i> " . $row_menu['nome_pagina'] . "</a></li>";
                $cont_drop_fech = 1;
            } else {
                if ($cont_drop_fech == 1) {
                    echo "</ul>";
                    echo "</li>";
                    $cont_drop_fech = 0;
                }
                echo "<li class='$menu_ativado'><a href='" . pg . "/" . $row_menu['endereco'] . "'><i class='" . $row_menu['iconmen'] . "'></i> " . $row_menu['nome'] . "</a></li>";
            }
        }
        if ($cont_drop_fech == 1) {
            echo "</ul>";
            echo "</li>";
            $cont_drop_fech = 0;
        }
        ?>
    </ul>
</nav>
