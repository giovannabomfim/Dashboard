<?php
if(!isset($seg)){
    exit;
}
$result_user_hd = "SELECT id, nome, imagem FROM adms_usuarios WHERE id='".$_SESSION['id']."' LIMIT 1";
$resultado_user_hd = mysqli_query($conn, $result_user_hd);
$row_user_hd = mysqli_fetch_assoc($resultado_user_hd);
$nome = explode(" ", $row_user_hd['nome']);
$prim_nome = $nome[0];
?>

<nav class="navbar navbar-expand navbar-dark" style="background-color: #114f77">
      <a class="sidebar-toggle mr-3"><img src="<?php echo pg; ?>/assets/imagens/menu.png"></a>
       <a class="navbar-brand">HOTEL SEARCH</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle menu-header" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown">
              <?php
              if(!empty($row_user_hd['imagem']))
              {
                 echo "<img src='".pg."/assets/imagens/usuario/".$row_user_hd['id']."/".$row_user_hd['imagem']."' width='20' height='20'>";
              } else {
                  echo "<img src='".pg."/assets/imagens/usuario/icone_usuario.png' width='20' height='20'>";
              }
              ?>
                
              &nbsp; <span class="d-none d-sm-inline" id="text"><?php echo $prim_nome; ?></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="#"><i class="fas fa-user"></i> Perfil</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<?php echo pg; ?>/acesso/sair"><i class="fas fa-sign-out-alt"></i> Sair</a>
            </div>
          </li>       
        </ul>      
      </div>
      
      
</nav>