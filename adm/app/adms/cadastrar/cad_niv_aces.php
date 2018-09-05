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
        ?>
        <div class="content p-1">
            <div class="list-group-item">
                <div class="d-flex">
                    <div class="mr-auto p-2">
                        <h2 class="display-4 titulo">Cadastrar Nível de Acesso</h2>
                    </div>
                    <div class="p-2">
                        <?php
                        $btn_list = carregar_btn('listar/list_niv_aces', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_niv_aces' class='btn btn-outline-info btn-sm'>Listar</a> ";
                        }
                		?>
                    </div>
                </div><hr>
                 <form method="POST" action="<?php echo pg; ?>/processa/proc_cad_niv_aces">
	                  <div class="form-group">
	                    <label><span class="text-danger">*</span>Nome</label>
	                    <input name="nome" type="text" class="form-control" placeholder="Nome do nível de acesso">
	                </div>
	                <p>
	                  <span class="text-danger">*</span>Campo obrigatório
	                </p>
	                <input name="SendCadNivAc" type="submit" class="btn btn-success" value="Cadastrar">
              	</form>
            </div>
        </div>
        <?php
        include_once 'app/adms/include/rodape_lib.php';
        ?>
    </div>
</body>


