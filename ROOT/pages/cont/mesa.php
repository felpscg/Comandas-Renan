<?php

/**
 * Description of index
 * Conteúdo da página principal
 *
 * @author Felipe Correa Gomes
 * @since 04/07/2019
 * 
 */
class mesa {

    function conteudo($registros = 0) {
//        if ($registros != null)
//            header("location:./login.php");
//      
        $conteudoTemp = '';
        $precoFinal = 0;
        foreach ($registros as $key => $value) {
            /* foreach ($value as $key2 => $value2) {
              /* foreach ($value as $key2 => $value2) {
              $conteudo2 .= $key2 . '->' . $value2 . '<br>';
              }
              $conteudo2 .= '<br>'; */
            $numero = $value["numeromesa"];


            $conteudoTemp .= "<label for='mesa$numero'>\n"
                    . "<div class='mesa'>\n"
                    . "<p>Mesa $numero</p>\n"
                    . "<p>Comandas em Aberto</p>\n"
                    . "<input id='mesa$numero' type='submit' name='act' value='$numero'/>\n"
                    . "<p>Acessar</p></div></label>\n";
        }

        $conteudo = "<div class = 'item-campo'>\n"
                . "<div id='conteudo'>\n"
                . "<p class='titulo'><span>Mesas</span></p>\n"
                . "<form action='' method='POST'>\n"
                . "<div id='mesas'>\n"
                . $conteudoTemp
                . "</div>\n"
                . "</form>\n"
                . "</div>\n"
                . "<br>\n";
        return $conteudo;
    }

}

//fim da classe index
