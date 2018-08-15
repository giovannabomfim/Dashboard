<?php
if(!isset($seg)){
    exit;
}
function limparUrl($conteudo){
    $formato_a = '"!@#$%*()+{[}];:,\\\'<>°ºª';
    $formato_b = '____________________________';
    $conteudo_ct = strtr($conteudo, $formato_a, $formato_b);
    $conteudo_br = str_ireplace(" ", "", $conteudo_ct);
    $conteudo_st = strip_tags($conteudo_br);
    $conteudo_lp = trim($conteudo_st);
    
    return $conteudo_lp;
}
