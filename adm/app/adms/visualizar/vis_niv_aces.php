<?php
if (!isset($seg)) {
    exit;
}
include_once 'app/adms/include/head.php';
?>
<body>    
    <?php
    include_once 'app/adms/include/header.php';
    ?>
    <div class="d-flex">
        <?php
        include_once 'app/adms/include/menu.php';

        $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
        $result_niv_aces = "SELECT * FROM adms_niveis_acessos WHERE ordem >= '" . $_SESSION['ordem'] . "' AND id=$id ORDER BY ordem ASC LIMIT 1";
        $resultado_niv_aces = mysqli_query($conn, $result_niv_aces);
        $row_niv_aces = mysqli_fetch_assoc($resultado_niv_aces);
        ?>
        <div class="content p-1">
            <div class="list-group-item">
                <div class="d-flex">
                    <div class="mr-auto p-2">
                        <h2 class="display-4 titulo">Detalhes Nível de Acesso</h2>
                    </div>
                    <div class="p-2">
                        <span class = "d-none d-md-block">
                        <?php
                        $btn_list = carregar_btn('listar/list_niv_aces', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_niv_aces' class='btn btn-outline-info btn-sm'>Listar</a> ";
                        }
                        $btn_edit = carregar_btn('editar/edit_niv_aces', $conn);
                        if ($btn_edit) {
                            echo "<a href='" . pg . "/editar/edit_niv_aces?id=" . $row_niv_aces['id'] . "' class='btn btn-outline-warning btn-sm'>Editar </a> ";
                        }
                        $btn_apagar = carregar_btn('processa/apagar_niv_aces', $conn);
                        if ($btn_apagar) {
                            echo "<a href='" . pg . "/processa/apagar_niv_aces' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#apagarRegistro'>Apagar</a> ";
                        }
                        ?>
                        </span>
                        <div class="dropdown d-block d-md-none">
                            <button class="btn btn-primary dropdown-toggle btn-sm" type="button" id="acoesListar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ações
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="acoesListar">
                                <?php
                                if ($btn_list) {
                                    echo "<a class='dropdown-item' href='" . pg . "/listar/list_niv_aces'>Listar</a>";
                                }
                                if ($btn_edit) {
                                    echo "<a class='dropdown-item' href='" . pg . "/editar/edit_niv_aces?id=" . $row_niv_aces['id'] . "'>Editar</a>";
                                }
                                if ($btn_apagar) {
                                    echo "<a class='dropdown-item' href=''" . pg . "/processa/apagar_niv_aces' data-toggle='modal' data-target='#apagarRegistro'>Apagar</a>";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div><hr>
                <?php
                if (($resultado_niv_aces) AND ( $resultado_niv_aces->num_rows != 0)) {
                    
                    ?>
                    <dl class="row">
                        <dt class="col-sm-3">ID</dt>
                        <dd class="col-sm-9"><?php echo $row_niv_aces['id']; ?></dd>

                        <dt class="col-sm-3">Nome</dt>
                        <dd class="col-sm-9"><?php echo $row_niv_aces['nome']; ?></dd>

                        <dt class="col-sm-3">Ordem</dt>
                        <dd class="col-sm-9"><?php echo $row_niv_aces['ordem']; ?></dd>

                        <dt class="col-sm-3 text-truncate">Data do Cadastro</dt>
                        <dd class="col-sm-9"><?php echo date('d/m/Y H:i:s', strtotime($row_niv_aces['created'])); ?></dd>

                        <dt class="col-sm-3 text-truncate">Data de Modificação</dt>
                        <dd class="col-sm-9"><?php
                            if (!empty($row_niv_aces['modified'])) {
                                echo date('d/m/Y H:i:s', strtotime($row_niv_aces['modified']));
                            }
                            ?></dd>

                    </dl>
                    <?php
                } else {
                    ?>
                    <div class="alert alert-danger" role="alert">
                        Nenhum registro encontrado!
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
        <?php
        include_once 'app/adms/include/rodape_lib.php';
        ?>

    </div>
</body>


