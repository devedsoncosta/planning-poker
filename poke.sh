#!/bin/bash

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

versao() {
echo -e "                                   \e[97mVersão do SetupOrion: \e[32mv. 2.6.2\e[0m                                  "
echo -e "\e[32moriondesign.art.br/whatsapp2      \e[97m<----- Grupos no WhatsApp ----->     \e[32moriondesign.art.br/whatsapp3\e[0m"
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Cores do Setup

amarelo="\e[33m"
verde="\e[32m"
branco="\e[97m"
bege="\e[93m"
vermelho="\e[91m"
reset="\e[0m"

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

menu_instalador="1"

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

home_directory="$HOME"
dados_vps="${home_directory}/dados_vps/dados_vps"

dados() {
    nome_servidor=$(grep "Nome do Servidor:" "$dados_vps" | awk -F': ' '{print $2}')
    nome_rede_interna=$(grep "Rede interna:" "$dados_vps" | awk -F': ' '{print $2}')
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Licença do Setup

## copia
direitos_setup() {
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo=  $branco Este auto instalador foi desenvolvido para auxiliar na instalação das principais aplicações $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco  disponíveis no mercado open source. Já deixo todos os créditos aos desenvolvedores de cada $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco aplicação disponíveis aqui. Este Setup é licenciado sob a Licença MIT (MIT). Você pode usar, $amarelo =\e[0m"
    echo -e "$amarelo=  $branco  copiar, modificar, integrar, publicar, distribuir e/ou vender cópias dos produtos finais,  $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco   mas deve sempre declarar que OrionDesign (contato@oriondesign.art.br) é o autor original  $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco           destes códigos e atribuir um link para https://oriondesign.art.br/setup           $amarelo  =\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

direitos_instalador() {
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo=  $branco Este auto instalador foi desenvolvido para auxiliar na instalação das principais aplicações $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco  disponíveis no mercado open source. Já deixo todos os créditos aos desenvolvedores de cada $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco aplicação disponíveis aqui. Este Setup é licenciado sob a Licença MIT (MIT). Você pode usar, $amarelo =\e[0m"
    echo -e "$amarelo=  $branco  copiar, modificar, integrar, publicar, distribuir e/ou vender cópias dos produtos finais,  $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco   mas deve sempre declarar que OrionDesign (contato@oriondesign.art.br) é o autor original  $amarelo  =\e[0m"
    echo -e "$amarelo=  $branco           destes códigos e atribuir um link para https://oriondesign.art.br/setup           $amarelo  =\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
    read -p "Ao digitar Y você aceita e concorda com as orientações passadas acima (Y/N): " choice
    while true; do
        case $choice in
            Y|y)
                return
                ;;
            N|n)
                clear
                nome_finalizado
                echo "Que pena que você não concorda, então estarei encerrando o instalador. Até mais."
                sleep 2
                clear
                exit 1
                ;;
            *)
                clear
                erro_msg
                echo ""
                echo ""
                echo "Por favor, digite apenas Y ou N."
                sleep 2
                clear
                nome_instalador
                direitos_setup
                ;;
        esac
        read -p "Ao digitar Y você aceita e concorda com as orientações passadas acima (Y/N): " choice
    done
}

## Credenciais Portainerv2.5.0+
info_credenciais(){
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo=  $branco A partir da versão 2.5.0 deste Setup foi implementado uma função para realizar deploy dentro $amarelo =\e[0m"
    echo -e "$amarelo=  $branco   do proprio portainer através de uma requisição api. Para que esta nova função funcione em  $amarelo =\e[0m"
    echo -e "$amarelo=  $branco suas proximas instalações, você precisará informar às credenciais de acesso do seu portainer $amarelo =\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""

}

## Credito do Setup

creditos_msg() {
    echo ""
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=           $branco Gostaria de contribuir para continuarmos o desenvolvimento deste projeto?            $amarelo=\e[0m"
    echo -e "$amarelo=                              $branco Você pode fazer uma doação via PIX:                               $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=                                     $amarelo pix@oriondesign.art.br                                     $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=          $branco Ou faça parte da nossa comunidade VIP no Discord e contribua com o projeto            $amarelo=\e[0m"
    echo -e "$amarelo=                       $branco Nossa comunidade:$amarelo https://join.oriondesign.art.br                        $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=                                   $branco Nossos grupos no WhatsApp                                    $amarelo=\e[0m"
    echo -e "$amarelo=      $amarelo https://oriondesign.art.br/whatsapp2 $branco<-- ou -->$amarelo https://oriondesign.art.br/whatsapp3      $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Mensagens gerais

## Mensagem pedindo para preencher as informações

preencha_as_info() {
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=                          $branco Preencha as informações solicitadas abaixo                            $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

## Mensagem pedindo para verificar se as informações estão certas

conferindo_as_info() {
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=                          $branco Verifique se os dados abaixos estão certos                            $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

## Mensagem de Guarde os dados

guarde_os_dados_msg() {
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo=                 $branco Guarde todos os dados abaixo para evitar futuros transtornos                   $amarelo=\e[0m"
    echo -e "$amarelo=                                                                                                 $amarelo=\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

## Mensagem de Instalando

instalando_msg() {
  echo""
  echo -e "$amarelo===================================================================================================\e[0m"
  echo -e "$amarelo=                                                                                                 =\e[0m"
  echo -e "$amarelo=      $branco  ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ███╗   ██╗██████╗  ██████╗   $amarelo      = \e[0m"
  echo -e "$amarelo=      $branco  ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗██╔═══██╗  $amarelo      =\e[0m"
  echo -e "$amarelo=      $branco  ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║██╔██╗ ██║██║  ██║██║   ██║  $amarelo      =\e[0m"
  echo -e "$amarelo=      $branco  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║██║╚██╗██║██║  ██║██║   ██║  $amarelo      =\e[0m"
  echo -e "$amarelo=      $branco  ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝╚██████╔╝  $amarelo      =\e[0m"
  echo -e "$amarelo=      $branco  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝   $amarelo      =\e[0m"
  echo -e "$amarelo=                                                                                                 =\e[0m"
  echo -e "$amarelo===================================================================================================\e[0m"
  echo ""
  echo ""
}

## Mensagem de Erro

erro_msg() {
   echo -e "$amarelo===================================================================================================\e[0m"
   echo -e "$amarelo=                                                                                                 =\e[0m"
   echo -e "$amarelo=                                 $branco███████╗██████╗ ██████╗  ██████╗                                $amarelo=\e[0m"
   echo -e "$amarelo=                                 $branco██╔════╝██╔══██╗██╔══██╗██╔═══██╗                               $amarelo=\e[0m"
   echo -e "$amarelo=                                 $branco█████╗  ██████╔╝██████╔╝██║   ██║                               $amarelo=\e[0m"
   echo -e "$amarelo=                                 $branco██╔══╝  ██╔══██╗██╔══██╗██║   ██║                               $amarelo=\e[0m"
   echo -e "$amarelo=                                 $branco███████╗██║  ██║██║  ██║╚██████╔╝                               $amarelo=\e[0m"
   echo -e "$amarelo=                                 $branco╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝                                $amarelo=\e[0m"
   echo -e "$amarelo=                                                                                                 =\e[0m"
   echo -e "$amarelo===================================================================================================\e[0m"
}

## Mensagem de Instalado

instalado_msg() {
    clear
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo -e "$branco     ██╗      ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ██████╗  ██████╗       ██╗\e[0m"
    echo -e "$branco     ╚██╗     ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗██╔══██╗██╔═══██╗     ██╔╝\e[0m"
    echo -e "$branco      ╚██╗    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║██║  ██║██║   ██║    ██╔╝ \e[0m"
    echo -e "$branco      ██╔╝    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║██║  ██║██║   ██║    ╚██╗ \e[0m"
    echo -e "$branco     ██╔╝     ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║██████╔╝╚██████╔╝     ╚██╗\e[0m"
    echo -e "$branco     ╚═╝      ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝       ╚═╝\e[0m"
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

## Mensagem de Testando

nome_testando() {
    clear
    echo ""
    echo -e "$branco               ████████╗███████╗███████╗████████╗ █████╗ ███╗   ██╗██████╗  ██████╗ \e[0m"
    echo -e "$branco               ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗████╗  ██║██╔══██╗██╔═══██╗\e[0m"
    echo -e "$branco                  ██║   █████╗  ███████╗   ██║   ███████║██╔██╗ ██║██║  ██║██║   ██║\e[0m"
    echo -e "$branco                  ██║   ██╔══╝  ╚════██║   ██║   ██╔══██║██║╚██╗██║██║  ██║██║   ██║\e[0m"
    echo -e "$branco                  ██║   ███████╗███████║   ██║   ██║  ██║██║ ╚████║██████╔╝╚██████╔╝\e[0m"
    echo -e "$branco                  ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ \e[0m"
    echo ""
    echo ""
}
nome_credenciais() {
    clear
    echo ""
    echo -e "$branco          ██████╗██████╗ ███████╗██████╗ ███████╗███╗   ██╗ ██████╗██╗ █████╗ ██╗███████╗      \e[0m"
    echo -e "$branco         ██╔════╝██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔══██╗██║██╔════╝      \e[0m"
    echo -e "$branco         ██║     ██████╔╝█████╗  ██║  ██║█████╗  ██╔██╗ ██║██║     ██║███████║██║███████╗      \e[0m"
    echo -e "$branco         ██║     ██╔══██╗██╔══╝  ██║  ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══██║██║╚════██║      \e[0m"
    echo -e "$branco         ╚██████╗██║  ██║███████╗██████╔╝███████╗██║ ╚████║╚██████╗██║██║  ██║██║███████║      \e[0m"
    echo -e "$branco          ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚═╝  ╚═╝╚═╝╚══════╝      \e[0m"
    echo -e "$branco                                                                                               \e[0m"
    echo -e "$branco   ██████╗  ██████╗     ██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗███╗   ██╗███████╗██████╗ \e[0m"
    echo -e "$branco   ██╔══██╗██╔═══██╗    ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║████╗  ██║██╔════╝██╔══██╗\e[0m"
    echo -e "$branco   ██║  ██║██║   ██║    ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║██╔██╗ ██║█████╗  ██████╔╝\e[0m"
    echo -e "$branco   ██║  ██║██║   ██║    ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗\e[0m"
    echo -e "$branco   ██████╔╝╚██████╔╝    ██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║██║ ╚████║███████╗██║  ██║\e[0m"
    echo -e "$branco   ╚═════╝  ╚═════╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
    info_credenciais
}
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Titulos

## Nome do instalador

nome_instalador() {
    clear
    echo ""
    echo -e "$branco    ███████╗███████╗████████╗██╗   ██╗██████╗      ██████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗\e[0m"
    echo -e "$branco    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔═══██╗██╔══██╗██║██╔═══██╗████╗  ██║\e[0m"
    echo -e "$branco    ███████╗█████╗     ██║   ██║   ██║██████╔╝    ██║   ██║██████╔╝██║██║   ██║██╔██╗ ██║\e[0m"
    echo -e "$branco    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██║   ██║██╔══██╗██║██║   ██║██║╚██╗██║\e[0m"
    echo -e "$branco    ███████║███████╗   ██║   ╚██████╔╝██║         ╚██████╔╝██║  ██║██║╚██████╔╝██║ ╚████║\e[0m"
    echo -e "$branco    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝          ╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝\e[0m"
    echo -e "$branco                                                                                        \e[0m"
    echo -e "$branco                                  ██████╗     ██████╗    ██████╗                         \e[0m"
    echo -e "$branco                                  ╚════██╗   ██╔════╝    ╚════██╗                        \e[0m"
    echo -e "$branco                        █████╗     █████╔╝   ███████╗     █████╔╝    █████╗              \e[0m"
    echo -e "$branco                        ╚════╝    ██╔═══╝    ██╔═══██╗   ██╔═══╝     ╚════╝              \e[0m"
    echo -e "$branco                                  ███████╗██╗╚██████╔╝██╗███████╗                        \e[0m"
    echo -e "$branco                                  ╚══════╝╚═╝ ╚═════╝ ╚═╝╚══════╝                        \e[0m"
    echo ""
}

## Menu de ferramentas

nome_menu() {
    clear
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo -e "$branco                    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ██████╗ ███████╗                \e[0m"
    echo -e "$branco                    ████╗ ████║██╔════╝████╗  ██║██║   ██║    ██╔══██╗██╔════╝                \e[0m"
    echo -e "$branco                    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ██║  ██║█████╗                  \e[0m"
    echo -e "$branco                    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ██║  ██║██╔══╝                  \e[0m"
    echo -e "$branco                    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ██████╔╝███████╗                \e[0m"
    echo -e "$branco                    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚══════╝                \e[0m"
    echo -e "$branco                                                                                                \e[0m"
    echo -e "$branco  ███████╗███████╗██████╗ ██████╗  █████╗ ███╗   ███╗███████╗███╗   ██╗████████╗ █████╗ ███████╗\e[0m"
    echo -e "$branco  ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██╔════╝\e[0m"
    echo -e "$branco  █████╗  █████╗  ██████╔╝██████╔╝███████║██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████║███████╗\e[0m"
    echo -e "$branco  ██╔══╝  ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ██╔══██║╚════██║\e[0m"
    echo -e "$branco  ██║     ███████╗██║  ██║██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ██║  ██║███████║\e[0m"
    echo -e "$branco  ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚══════╝\e[0m"
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    versao
    echo ""
}

## Titulo Teste de Email [0]

nome_testeemail() {
  clear
  echo ""
  echo -e "$branco                     ████████╗███████╗███████╗████████╗███████╗    ██████╗ ███████╗\e[0m"
  echo -e "$branco                     ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝    ██╔══██╗██╔════╝\e[0m"
  echo -e "$branco                        ██║   █████╗  ███████╗   ██║   █████╗      ██║  ██║█████╗  \e[0m"
  echo -e "$branco                        ██║   ██╔══╝  ╚════██║   ██║   ██╔══╝      ██║  ██║██╔══╝  \e[0m"
  echo -e "$branco                        ██║   ███████╗███████║   ██║   ███████╗    ██████╔╝███████╗\e[0m"
  echo -e "$branco                        ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚══════╝    ╚═════╝ ╚══════╝\e[0m"
  echo -e "$branco                                                                                   \e[0m"
  echo -e "$branco                                    ███████╗███╗   ███╗ █████╗ ██╗██╗                 \e[0m"
  echo -e "$branco                                    ██╔════╝████╗ ████║██╔══██╗██║██║                 \e[0m"
  echo -e "$branco                                    █████╗  ██╔████╔██║███████║██║██║                 \e[0m"
  echo -e "$branco                                    ██╔══╝  ██║╚██╔╝██║██╔══██║██║██║                 \e[0m"
  echo -e "$branco                                    ███████╗██║ ╚═╝ ██║██║  ██║██║███████╗            \e[0m"
  echo -e "$branco                                    ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚══════╝            \e[0m"
  echo ""
  echo ""
}

## Titulo Traefik e Portainer [1]

nome_traefik_e_portainer() {
    clear
    echo ""
    echo -e "$branco               ████████╗██████╗  █████╗ ███████╗███████╗██╗██╗  ██╗    ███████╗       \e[0m"
    echo -e "$branco               ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██║██║ ██╔╝    ██╔════╝       \e[0m"
    echo -e "$branco                  ██║   ██████╔╝███████║█████╗  █████╗  ██║█████╔╝     █████╗         \e[0m"
    echo -e "$branco                  ██║   ██╔══██╗██╔══██║██╔══╝  ██╔══╝  ██║██╔═██╗     ██╔══╝         \e[0m"
    echo -e "$branco                  ██║   ██║  ██║██║  ██║███████╗██║     ██║██║  ██╗    ███████╗       \e[0m"
    echo -e "$branco                  ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝    ╚══════╝       \e[0m"
    echo -e "$branco                                                                                      \e[0m"
    echo -e "$branco             ██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗███╗   ██╗███████╗██████╗   \e[0m"
    echo -e "$branco             ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║████╗  ██║██╔════╝██╔══██╗  \e[0m"
    echo -e "$branco             ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║██╔██╗ ██║█████╗  ██████╔╝  \e[0m"
    echo -e "$branco             ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗  \e[0m"
    echo -e "$branco             ██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║██║ ╚████║███████╗██║  ██║  \e[0m"
    echo -e "$branco             ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝  \e[0m"
    echo ""
    echo ""
}

## Titulo Chatwoot [2]

nome_chatwoot(){
    clear
    echo ""
    echo -e "$branco               ██████╗██╗  ██╗ █████╗ ████████╗██╗    ██╗ ██████╗  ██████╗ ████████╗\e[0m"
    echo -e "$branco              ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔═══██╗╚══██╔══╝\e[0m"
    echo -e "$branco              ██║     ███████║███████║   ██║   ██║ █╗ ██║██║   ██║██║   ██║   ██║   \e[0m"
    echo -e "$branco              ██║     ██╔══██║██╔══██║   ██║   ██║███╗██║██║   ██║██║   ██║   ██║   \e[0m"
    echo -e "$branco              ╚██████╗██║  ██║██║  ██║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝   ██║   \e[0m"
    echo -e "$branco               ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝    ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo Evolution [3]

nome_evolution() {
    clear
    echo ""
    echo -e "$branco ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ███████║██████╔╝██║\e[0m"
    echo -e "$branco ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║██║     ██║\e[0m"
    echo -e "$branco ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

nome_evolution_lite() {
    clear
    echo ""
    echo ""
    echo -e "$branco ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ███████║██████╔╝██║\e[0m"
    echo -e "$branco ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║██║     ██║\e[0m"
    echo -e "$branco ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo -e "$branco                                                                                                  \e[0m"
    echo -e "$branco                                   ██╗     ██╗████████╗███████╗                                   \e[0m"
    echo -e "$branco                                   ██║     ██║╚══██╔══╝██╔════╝                                   \e[0m"
    echo -e "$branco                                   ██║     ██║   ██║   █████╗                                     \e[0m"
    echo -e "$branco                                   ██║     ██║   ██║   ██╔══╝                                     \e[0m"
    echo -e "$branco                                   ███████╗██║   ██║   ███████╗                                   \e[0m"
    echo -e "$branco                                   ╚══════╝╚═╝   ╚═╝   ╚══════╝                                   \e[0m"
    echo ""
    echo ""
}

## Titulo Evolution [2.beta]

nome_evolution_v2() {
    clear
    echo ""
    echo -e "$branco  ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco  ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco  █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ███████║██████╔╝██║\e[0m"
    echo -e "$branco  ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco  ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║██║     ██║\e[0m"
    echo -e "$branco  ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo -e "$branco                                                                                                \e[0m"
    echo -e "$branco                                    ██╗   ██╗██████╗     ██████╗                                 \e[0m"
    echo -e "$branco                                    ██║   ██║╚════██╗   ██╔═████╗                                \e[0m"
    echo -e "$branco                                    ██║   ██║ █████╔╝   ██║██╔██║                                \e[0m"
    echo -e "$branco                                    ╚██╗ ██╔╝██╔═══╝    ████╔╝██║                                \e[0m"
    echo -e "$branco                                     ╚████╔╝ ███████╗██╗╚██████╔╝                                \e[0m"
    echo -e "$branco                                      ╚═══╝  ╚══════╝╚═╝ ╚═════╝                                 \e[0m"
    echo ""
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo=                    $branco Esta é uma versão Alfa e não deve ser usada em produção.                    $amarel=\e[0m"
    echo -e "$amarelo=                                                                                                 =\e[0m"
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
}

## Titulo Minio [4]

nome_minio() {
    clear
    echo ""
    echo -e "$branco                              ███╗   ███╗██╗███╗   ██╗██╗ ██████╗ \e[0m"
    echo -e "$branco                              ████╗ ████║██║████╗  ██║██║██╔═══██╗\e[0m"
    echo -e "$branco                              ██╔████╔██║██║██╔██╗ ██║██║██║   ██║\e[0m"
    echo -e "$branco                              ██║╚██╔╝██║██║██║╚██╗██║██║██║   ██║\e[0m"
    echo -e "$branco                              ██║ ╚═╝ ██║██║██║ ╚████║██║╚██████╔╝\e[0m"
    echo -e "$branco                              ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Typebot [5]

nome_typebot() {
    clear
    echo ""
    echo -e "$branco                    ████████╗██╗   ██╗██████╗ ███████╗██████╗  ██████╗ ████████╗\e[0m"
    echo -e "$branco                    ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝\e[0m"
    echo -e "$branco                       ██║    ╚████╔╝ ██████╔╝█████╗  ██████╔╝██║   ██║   ██║   \e[0m"
    echo -e "$branco                       ██║     ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║   ██║   ██║   \e[0m"
    echo -e "$branco                       ██║      ██║   ██║     ███████╗██████╔╝╚██████╔╝   ██║   \e[0m"
    echo -e "$branco                       ╚═╝      ╚═╝   ╚═╝     ╚══════╝╚═════╝  ╚═════╝    ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo N8N [6]

nome_n8n() {
    clear
    echo ""
    echo -e "$branco                            ███╗   ██╗ █████╗ ███╗   ██╗\e[0m"
    echo -e "$branco                            ████╗  ██║██╔══██╗████╗  ██║\e[0m"
    echo -e "$branco                            ██╔██╗ ██║╚█████╔╝██╔██╗ ██║\e[0m"
    echo -e "$branco                            ██║╚██╗██║██╔══██╗██║╚██╗██║\e[0m"
    echo -e "$branco                            ██║ ╚████║╚█████╔╝██║ ╚████║\e[0m"
    echo -e "$branco                            ╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═══╝\e[0m"
    echo ""
    echo ""
}

## Titulo Flowise [7]

nome_flowise() {
    clear
    echo ""
    echo -e "$branco                      ███████╗██╗      ██████╗ ██╗    ██╗██╗███████╗███████╗\e[0m"
    echo -e "$branco                      ██╔════╝██║     ██╔═══██╗██║    ██║██║██╔════╝██╔════╝\e[0m"
    echo -e "$branco                      █████╗  ██║     ██║   ██║██║ █╗ ██║██║███████╗█████╗  \e[0m"
    echo -e "$branco                      ██╔══╝  ██║     ██║   ██║██║███╗██║██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco                      ██║     ███████╗╚██████╔╝╚███╔███╔╝██║███████║███████╗\e[0m"
    echo -e "$branco                      ╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo PgAdmin [8]

nome_pgAdmin_4() {
    clear
    echo ""
    echo -e "$branco               ██████╗  ██████╗  █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗    ██╗  ██╗\e[0m"
    echo -e "$branco               ██╔══██╗██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║    ██║  ██║\e[0m"
    echo -e "$branco               ██████╔╝██║  ███╗███████║██║  ██║██╔████╔██║██║██╔██╗ ██║    ███████║\e[0m"
    echo -e "$branco               ██╔═══╝ ██║   ██║██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║    ╚════██║\e[0m"
    echo -e "$branco               ██║     ╚██████╔╝██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║         ██║\e[0m"
    echo -e "$branco               ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝         ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Nocobase [9]

nome_nocobase() {
    clear
    echo ""
    echo -e "$branco               ███╗   ██╗ ██████╗  ██████╗ ██████╗ ██████╗  █████╗ ███████╗███████╗\e[0m"
    echo -e "$branco               ████╗  ██║██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝\e[0m"
    echo -e "$branco               ██╔██╗ ██║██║   ██║██║     ██║   ██║██████╔╝███████║███████╗█████╗  \e[0m"
    echo -e "$branco               ██║╚██╗██║██║   ██║██║     ██║   ██║██╔══██╗██╔══██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco               ██║ ╚████║╚██████╔╝╚██████╗╚██████╔╝██████╔╝██║  ██║███████║███████╗\e[0m"
    echo -e "$branco               ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Botpress [10]

nome_botpress() {
    clear
    echo ""
    echo -e "$branco              ██████╗  ██████╗ ████████╗██████╗ ██████╗ ███████╗███████╗███████╗\e[0m"
    echo -e "$branco              ██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝\e[0m"
    echo -e "$branco              ██████╔╝██║   ██║   ██║   ██████╔╝██████╔╝█████╗  ███████╗███████╗\e[0m"
    echo -e "$branco              ██╔══██╗██║   ██║   ██║   ██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║\e[0m"
    echo -e "$branco              ██████╔╝╚██████╔╝   ██║   ██║     ██║  ██║███████╗███████║███████║\e[0m"
    echo -e "$branco              ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Wordpress [11]

nome_wordpress() {
    clear
    echo ""
    echo -e "$branco           ██╗    ██╗ ██████╗ ██████╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗███████╗\e[0m"
    echo -e "$branco           ██║    ██║██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝\e[0m"
    echo -e "$branco           ██║ █╗ ██║██║   ██║██████╔╝██║  ██║██████╔╝██████╔╝█████╗  ███████╗███████╗\e[0m"
    echo -e "$branco           ██║███╗██║██║   ██║██╔══██╗██║  ██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║\e[0m"
    echo -e "$branco           ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝██║     ██║  ██║███████╗███████║███████║\e[0m"
    echo -e "$branco            ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Baserow [12]

nome_baserow() {
    clear
    echo ""
    echo -e "$branco                      ██████╗  █████╗ ███████╗███████╗██████╗  ██████╗ ██╗    ██╗\e[0m"
    echo -e "$branco                      ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔═══██╗██║    ██║\e[0m"
    echo -e "$branco                      ██████╔╝███████║███████╗█████╗  ██████╔╝██║   ██║██║ █╗ ██║\e[0m"
    echo -e "$branco                      ██╔══██╗██╔══██║╚════██║██╔══╝  ██╔══██╗██║   ██║██║███╗██║\e[0m"
    echo -e "$branco                      ██████╔╝██║  ██║███████║███████╗██║  ██║╚██████╔╝╚███╔███╔╝\e[0m"
    echo -e "$branco                      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ \e[0m"
    echo ""
    echo ""
}

## Titulo MongoDB [13]

nome_mongodb() {
  clear
  echo ""
  echo -e "$branco               ███╗   ███╗ ██████╗ ███╗   ██╗ ██████╗  ██████╗     ██████╗ ██████╗ \e[0m"
  echo -e "$branco               ████╗ ████║██╔═══██╗████╗  ██║██╔════╝ ██╔═══██╗    ██╔══██╗██╔══██╗\e[0m"
  echo -e "$branco               ██╔████╔██║██║   ██║██╔██╗ ██║██║  ███╗██║   ██║    ██║  ██║██████╔╝\e[0m"
  echo -e "$branco               ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║██║   ██║    ██║  ██║██╔══██╗\e[0m"
  echo -e "$branco               ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║╚██████╔╝╚██████╔╝    ██████╔╝██████╔╝\e[0m"
  echo -e "$branco               ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝     ╚═════╝ ╚═════╝ \e[0m"
  echo ""
  echo ""
}

## Titulo RabbitMQ [14]

nome_rabbitmq() {
  clear
  echo ""
  echo -e "$branco               ██████╗  █████╗ ██████╗ ██████╗ ██╗████████╗    ███╗   ███╗ ██████╗ \e[0m"
  echo -e "$branco               ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║╚══██╔══╝    ████╗ ████║██╔═══██╗\e[0m"
  echo -e "$branco               ██████╔╝███████║██████╔╝██████╔╝██║   ██║       ██╔████╔██║██║   ██║\e[0m"
  echo -e "$branco               ██╔══██╗██╔══██║██╔══██╗██╔══██╗██║   ██║       ██║╚██╔╝██║██║▄▄ ██║\e[0m"
  echo -e "$branco               ██║  ██║██║  ██║██████╔╝██████╔╝██║   ██║       ██║ ╚═╝ ██║╚██████╔╝\e[0m"
  echo -e "$branco               ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚═╝   ╚═╝       ╚═╝     ╚═╝ ╚══▀▀═╝ \e[0m"
  echo ""
  echo ""
}

## Titulo UptimeKuma [15]
nome_poker(){
    clear
    echo "poker"
}

nome_uptimekuma() {
  clear
  echo ""
  echo -e "$branco      ██╗   ██╗██████╗ ████████╗██╗███╗   ███╗███████╗    ██╗  ██╗██╗   ██╗███╗   ███╗ █████╗ \e[0m"
  echo -e "$branco      ██║   ██║██╔══██╗╚══██╔══╝██║████╗ ████║██╔════╝    ██║ ██╔╝██║   ██║████╗ ████║██╔══██╗\e[0m"
  echo -e "$branco      ██║   ██║██████╔╝   ██║   ██║██╔████╔██║█████╗      █████╔╝ ██║   ██║██╔████╔██║███████║\e[0m"
  echo -e "$branco      ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██╔══╝      ██╔═██╗ ██║   ██║██║╚██╔╝██║██╔══██║\e[0m"
  echo -e "$branco      ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║███████╗    ██║  ██╗╚██████╔╝██║ ╚═╝ ██║██║  ██║\e[0m"
  echo -e "$branco       ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝\e[0m"
  echo ""
  echo ""
}

## Titulo Calcom [16]

nome_calcom() {
  clear
  echo ""
  echo -e "$branco                       ██████╗ █████╗ ██╗         ██████╗ ██████╗ ███╗   ███╗\e[0m"
  echo -e "$branco                      ██╔════╝██╔══██╗██║        ██╔════╝██╔═══██╗████╗ ████║\e[0m"
  echo -e "$branco                      ██║     ███████║██║        ██║     ██║   ██║██╔████╔██║\e[0m"
  echo -e "$branco                      ██║     ██╔══██║██║        ██║     ██║   ██║██║╚██╔╝██║\e[0m"
  echo -e "$branco                      ╚██████╗██║  ██║███████╗██╗╚██████╗╚██████╔╝██║ ╚═╝ ██║\e[0m"
  echo -e "$branco                       ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝\e[0m"
  echo ""
  echo ""
}

## Titulo Mautic [17]

nome_mautic(){
    clear
    echo ""
    echo -e "$branco                         ███╗   ███╗ █████╗ ██╗   ██╗████████╗██╗ ██████╗\e[0m"
    echo -e "$branco                         ████╗ ████║██╔══██╗██║   ██║╚══██╔══╝██║██╔════╝\e[0m"
    echo -e "$branco                         ██╔████╔██║███████║██║   ██║   ██║   ██║██║     \e[0m"
    echo -e "$branco                         ██║╚██╔╝██║██╔══██║██║   ██║   ██║   ██║██║     \e[0m"
    echo -e "$branco                         ██║ ╚═╝ ██║██║  ██║╚██████╔╝   ██║   ██║╚██████╗\e[0m"
    echo -e "$branco                         ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Appsmith [18]

nome_appsmith() {
    clear
    echo ""
    echo -e "$branco                   █████╗ ██████╗ ██████╗ ███████╗███╗   ███╗██╗████████╗██╗  ██╗\e[0m"
    echo -e "$branco                  ██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗ ████║██║╚══██╔══╝██║  ██║\e[0m"
    echo -e "$branco                  ███████║██████╔╝██████╔╝███████╗██╔████╔██║██║   ██║   ███████║\e[0m"
    echo -e "$branco                  ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║\e[0m"
    echo -e "$branco                  ██║  ██║██║     ██║     ███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║\e[0m"
    echo -e "$branco                  ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Qdrant [19]

nome_qdrant() {
    clear
    echo ""
    echo -e "$branco                        ██████╗ ██████╗ ██████╗  █████╗ ███╗   ██╗████████╗\e[0m"
    echo -e "$branco                       ██╔═══██╗██╔══██╗██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝\e[0m"
    echo -e "$branco                       ██║   ██║██║  ██║██████╔╝███████║██╔██╗ ██║   ██║   \e[0m"
    echo -e "$branco                       ██║▄▄ ██║██║  ██║██╔══██╗██╔══██║██║╚██╗██║   ██║   \e[0m"
    echo -e "$branco                       ╚██████╔╝██████╔╝██║  ██║██║  ██║██║ ╚████║   ██║   \e[0m"
    echo -e "$branco                        ╚══▀▀═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo WoofedCRM [20]

nome_woofedcrm() {
    clear
    echo ""
    echo -e "$branco        ██╗    ██╗ ██████╗  ██████╗ ███████╗███████╗██████╗      ██████╗██████╗ ███╗   ███╗\e[0m"
    echo -e "$branco        ██║    ██║██╔═══██╗██╔═══██╗██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔══██╗████╗ ████║\e[0m"
    echo -e "$branco        ██║ █╗ ██║██║   ██║██║   ██║█████╗  █████╗  ██║  ██║    ██║     ██████╔╝██╔████╔██║\e[0m"
    echo -e "$branco        ██║███╗██║██║   ██║██║   ██║██╔══╝  ██╔══╝  ██║  ██║    ██║     ██╔══██╗██║╚██╔╝██║\e[0m"
    echo -e "$branco        ╚███╔███╔╝╚██████╔╝╚██████╔╝██║     ███████╗██████╔╝    ╚██████╗██║  ██║██║ ╚═╝ ██║\e[0m"
    echo -e "$branco         ╚══╝╚══╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Formbricks [21]

nome_formbricks() {
    clear
    echo ""
    echo -e "$branco          ███████╗ ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ██╗ ██████╗██╗  ██╗███████╗\e[0m"
    echo -e "$branco          ██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗██╔══██╗██║██╔════╝██║ ██╔╝██╔════╝\e[0m"
    echo -e "$branco          █████╗  ██║   ██║██████╔╝██╔████╔██║██████╔╝██████╔╝██║██║     █████╔╝ ███████╗\e[0m"
    echo -e "$branco          ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██╗██╔══██╗██║██║     ██╔═██╗ ╚════██║\e[0m"
    echo -e "$branco          ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║██║╚██████╗██║  ██╗███████║\e[0m"
    echo -e "$branco          ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo NocoDB [22]

nome_nocodb() {
    clear
    echo ""
    echo -e "$branco                       ███╗   ██╗ ██████╗  ██████╗ ██████╗ ██████╗ ██████╗ \e[0m"
    echo -e "$branco                       ████╗  ██║██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗\e[0m"
    echo -e "$branco                       ██╔██╗ ██║██║   ██║██║     ██║   ██║██║  ██║██████╔╝\e[0m"
    echo -e "$branco                       ██║╚██╗██║██║   ██║██║     ██║   ██║██║  ██║██╔══██╗\e[0m"
    echo -e "$branco                       ██║ ╚████║╚██████╔╝╚██████╗╚██████╔╝██████╔╝██████╔╝\e[0m"
    echo -e "$branco                       ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Langfuse [23]

nome_langfuse() {
    clear
    echo ""
    echo -e "$branco               ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗██╗   ██╗███████╗███████╗\e[0m"
    echo -e "$branco               ██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║   ██║██╔════╝██╔════╝\e[0m"
    echo -e "$branco               ██║     ███████║██╔██╗ ██║██║  ███╗█████╗  ██║   ██║███████╗█████╗  \e[0m"
    echo -e "$branco               ██║     ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║   ██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco               ███████╗██║  ██║██║ ╚████║╚██████╔╝██║     ╚██████╔╝███████║███████╗\e[0m"
    echo -e "$branco               ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝      ╚═════╝ ╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Metabase [24]

nome_metabase() {
    clear
    echo ""
    echo -e "$branco               ███╗   ███╗███████╗████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗\e[0m"
    echo -e "$branco               ████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝\e[0m"
    echo -e "$branco               ██╔████╔██║█████╗     ██║   ███████║██████╔╝███████║███████╗█████╗  \e[0m"
    echo -e "$branco               ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco               ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗\e[0m"
    echo -e "$branco               ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Odoo [25]

nome_odoo() {
    clear
    echo ""
    echo -e "$branco                                 ██████╗ ██████╗  ██████╗  ██████╗ \e[0m"
    echo -e "$branco                                ██╔═══██╗██╔══██╗██╔═══██╗██╔═══██╗\e[0m"
    echo -e "$branco                                ██║   ██║██║  ██║██║   ██║██║   ██║\e[0m"
    echo -e "$branco                                ██║   ██║██║  ██║██║   ██║██║   ██║\e[0m"
    echo -e "$branco                                ╚██████╔╝██████╔╝╚██████╔╝╚██████╔╝\e[0m"
    echo -e "$branco                                 ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Chatwoot Nestor [26]
nome_chatwoot_nestor(){
    clear
    echo ""
    echo -e "$branco               ██████╗██╗  ██╗ █████╗ ████████╗██╗    ██╗ ██████╗  ██████╗ ████████╗\e[0m"
    echo -e "$branco              ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔═══██╗╚══██╔══╝\e[0m"
    echo -e "$branco              ██║     ███████║███████║   ██║   ██║ █╗ ██║██║   ██║██║   ██║   ██║   \e[0m"
    echo -e "$branco              ██║     ██╔══██║██╔══██║   ██║   ██║███╗██║██║   ██║██║   ██║   ██║   \e[0m"
    echo -e "$branco              ╚██████╗██║  ██║██║  ██║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝   ██║   \e[0m"
    echo -e "$branco               ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝    ╚═╝   \e[0m"
    echo -e "$branco                      ███╗   ██╗███████╗███████╗████████╗ ██████╗ ██████╗           \e[0m"
    echo -e "$branco                      ████╗  ██║██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗          \e[0m"
    echo -e "$branco                      ██╔██╗ ██║█████╗  ███████╗   ██║   ██║   ██║██████╔╝          \e[0m"
    echo -e "$branco                      ██║╚██╗██║██╔══╝  ╚════██║   ██║   ██║   ██║██╔══██╗          \e[0m"
    echo -e "$branco                      ██║ ╚████║███████╗███████║   ██║   ╚██████╔╝██║  ██║          \e[0m"
    echo -e "$branco                      ╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝          \e[0m"
    echo ""
    echo ""
}

nome_unoapi() {
    clear
    echo ""
    echo -e "$branco                     ██╗   ██╗███╗   ██╗ ██████╗      █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco                     ██║   ██║████╗  ██║██╔═══██╗    ██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco                     ██║   ██║██╔██╗ ██║██║   ██║    ███████║██████╔╝██║\e[0m"
    echo -e "$branco                     ██║   ██║██║╚██╗██║██║   ██║    ██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco                     ╚██████╔╝██║ ╚████║╚██████╔╝    ██║  ██║██║     ██║\e[0m"
    echo -e "$branco                      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Uno API [27]

nome_n8n_quepasa(){
    clear
    echo ""
    echo -e "$branco         ███╗   ██╗ █████╗ ███╗   ██╗    ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗\e[0m"
    echo -e "$branco         ████╗  ██║██╔══██╗████╗  ██║    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝\e[0m"
    echo -e "$branco         ██╔██╗ ██║╚█████╔╝██╔██╗ ██║    ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗\e[0m"
    echo -e "$branco         ██║╚██╗██║██╔══██╗██║╚██╗██║    ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║\e[0m"
    echo -e "$branco         ██║ ╚████║╚█████╔╝██║ ╚████║    ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║\e[0m"
    echo -e "$branco         ╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝\e[0m"
    echo -e "$branco                                                                                       \e[0m"
    echo -e "$branco        ██████╗  ██████╗      ██████╗ ██╗   ██╗███████╗██████╗  █████╗ ███████╗ █████╗ \e[0m"
    echo -e "$branco        ██╔══██╗██╔═══██╗    ██╔═══██╗██║   ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗\e[0m"
    echo -e "$branco        ██║  ██║██║   ██║    ██║   ██║██║   ██║█████╗  ██████╔╝███████║███████╗███████║\e[0m"
    echo -e "$branco        ██║  ██║██║   ██║    ██║▄▄ ██║██║   ██║██╔══╝  ██╔═══╝ ██╔══██║╚════██║██╔══██║\e[0m"
    echo -e "$branco        ██████╔╝╚██████╔╝    ╚██████╔╝╚██████╔╝███████╗██║     ██║  ██║███████║██║  ██║\e[0m"
    echo -e "$branco        ╚═════╝  ╚═════╝      ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Quepasa API [29]

nome_quepasa() {
    clear
    echo ""
    echo -e "$branco                  ██████╗ ██╗   ██╗███████╗██████╗  █████╗ ███████╗ █████╗ \e[0m"
    echo -e "$branco                 ██╔═══██╗██║   ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗\e[0m"
    echo -e "$branco                 ██║   ██║██║   ██║█████╗  ██████╔╝███████║███████╗███████║\e[0m"
    echo -e "$branco                 ██║▄▄ ██║██║   ██║██╔══╝  ██╔═══╝ ██╔══██║╚════██║██╔══██║\e[0m"
    echo -e "$branco                 ╚██████╔╝╚██████╔╝███████╗██║     ██║  ██║███████║██║  ██║\e[0m"
    echo -e "$branco                  ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Docuseal [30]

nome_docuseal(){
    clear
    echo ""
    echo -e "$branco                ██████╗  ██████╗  ██████╗██╗   ██╗███████╗███████╗ █████╗ ██╗     \e[0m"
    echo -e "$branco                ██╔══██╗██╔═══██╗██╔════╝██║   ██║██╔════╝██╔════╝██╔══██╗██║     \e[0m"
    echo -e "$branco                ██║  ██║██║   ██║██║     ██║   ██║███████╗█████╗  ███████║██║     \e[0m"
    echo -e "$branco                ██║  ██║██║   ██║██║     ██║   ██║╚════██║██╔══╝  ██╔══██║██║     \e[0m"
    echo -e "$branco                ██████╔╝╚██████╔╝╚██████╗╚██████╔╝███████║███████╗██║  ██║███████╗\e[0m"
    echo -e "$branco                ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Grafana + Prometheus + cAdvisor [31]

nome_monitor() {
    clear
    echo ""
    echo -e "$branco                     ██████╗ ██████╗  █████╗ ███████╗ █████╗ ███╗   ██╗ █████╗ \e[0m"
    echo -e "$branco                    ██╔════╝ ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗\e[0m"
    echo -e "$branco                    ██║  ███╗██████╔╝███████║█████╗  ███████║██╔██╗ ██║███████║\e[0m"
    echo -e "$branco                    ██║   ██║██╔══██╗██╔══██║██╔══╝  ██╔══██║██║╚██╗██║██╔══██║\e[0m"
    echo -e "$branco                    ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║██║ ╚████║██║  ██║\e[0m"
    echo -e "$branco                     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Dify AI [32]

nome_dify() {
    clear
    echo ""
    echo -e "$branco                            ██████╗ ██╗███████╗██╗   ██╗ █████╗ ██╗\e[0m"
    echo -e "$branco                            ██╔══██╗██║██╔════╝╚██╗ ██╔╝██╔══██╗██║\e[0m"
    echo -e "$branco                            ██║  ██║██║█████╗   ╚████╔╝ ███████║██║\e[0m"
    echo -e "$branco                            ██║  ██║██║██╔══╝    ╚██╔╝  ██╔══██║██║\e[0m"
    echo -e "$branco                            ██████╔╝██║██║        ██║██╗██║  ██║██║\e[0m"
    echo -e "$branco                            ╚═════╝ ╚═╝╚═╝        ╚═╝╚═╝╚═╝  ╚═╝╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Ollama [33]

nome_ollama() {
    clear
    echo ""
    echo -e "$branco                            ██████╗ ██╗     ██╗      █████╗ ███╗   ███╗ █████╗ \e[0m"
    echo -e "$branco                           ██╔═══██╗██║     ██║     ██╔══██╗████╗ ████║██╔══██╗\e[0m"
    echo -e "$branco                           ██║   ██║██║     ██║     ███████║██╔████╔██║███████║\e[0m"
    echo -e "$branco                           ██║   ██║██║     ██║     ██╔══██║██║╚██╔╝██║██╔══██║\e[0m"
    echo -e "$branco                           ╚██████╔╝███████╗███████╗██║  ██║██║ ╚═╝ ██║██║  ██║\e[0m"
    echo -e "$branco                            ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Affine [34]

nome_affine(){
    clear
    echo ""
    echo -e "$branco                         █████╗ ███████╗███████╗██╗███╗   ██╗███████╗\e[0m"
    echo -e "$branco                        ██╔══██╗██╔════╝██╔════╝██║████╗  ██║██╔════╝\e[0m"
    echo -e "$branco                        ███████║█████╗  █████╗  ██║██╔██╗ ██║█████╗  \e[0m"
    echo -e "$branco                        ██╔══██║██╔══╝  ██╔══╝  ██║██║╚██╗██║██╔══╝  \e[0m"
    echo -e "$branco                        ██║  ██║██║     ██║     ██║██║ ╚████║███████╗\e[0m"
    echo -e "$branco                        ╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Directus [35]

nome_directus(){
clear
echo ""
echo -e "$branco                   ██████╗ ██╗██████╗ ███████╗ ██████╗████████╗██╗   ██╗███████╗\e[0m"
echo -e "$branco                   ██╔══██╗██║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔════╝\e[0m"
echo -e "$branco                   ██║  ██║██║██████╔╝█████╗  ██║        ██║   ██║   ██║███████╗\e[0m"
echo -e "$branco                   ██║  ██║██║██╔══██╗██╔══╝  ██║        ██║   ██║   ██║╚════██║\e[0m"
echo -e "$branco                   ██████╔╝██║██║  ██║███████╗╚██████╗   ██║   ╚██████╔╝███████║\e[0m"
echo -e "$branco                   ╚═════╝ ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚══════╝\e[0m"
echo ""
echo ""
}

## Titulo VaultWarden [36]

nome_vaultwarden() {
    clear
    echo ""
    echo -e "$branco   ██╗   ██╗ █████╗ ██╗   ██╗██╗  ████████╗██╗    ██╗ █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗\e[0m"
    echo -e "$branco   ██║   ██║██╔══██╗██║   ██║██║  ╚══██╔══╝██║    ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║\e[0m"
    echo -e "$branco   ██║   ██║███████║██║   ██║██║     ██║   ██║ █╗ ██║███████║██████╔╝██║  ██║█████╗  ██╔██╗ ██║\e[0m"
    echo -e "$branco   ╚██╗ ██╔╝██╔══██║██║   ██║██║     ██║   ██║███╗██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██║╚██╗██║\e[0m"
    echo -e "$branco    ╚████╔╝ ██║  ██║╚██████╔╝███████╗██║   ╚███╔███╔╝██║  ██║██║  ██║██████╔╝███████╗██║ ╚████║\e[0m"
    echo -e "$branco     ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝\e[0m"
    echo ""
    echo ""
}

## Titulo NextCloud [37]

nome_nextcloud() {
    clear
    echo ""
    echo -e "$branco           ███╗   ██╗███████╗██╗  ██╗████████╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗ \e[0m"
    echo -e "$branco           ████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗\e[0m"
    echo -e "$branco           ██╔██╗ ██║█████╗   ╚███╔╝    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║\e[0m"
    echo -e "$branco           ██║╚██╗██║██╔══╝   ██╔██╗    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║\e[0m"
    echo -e "$branco           ██║ ╚████║███████╗██╔╝ ██╗   ██║   ╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝\e[0m"
    echo -e "$branco           ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Strapi [38]

nome_strapi() {
    clear
    echo ""
    echo -e "$branco                         ███████╗████████╗██████╗  █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco                         ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco                         ███████╗   ██║   ██████╔╝███████║██████╔╝██║\e[0m"
    echo -e "$branco                         ╚════██║   ██║   ██╔══██╗██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco                         ███████║   ██║   ██║  ██║██║  ██║██║     ██║\e[0m"
    echo -e "$branco                         ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo PhpMyAdmin [39]

nome_phpmyadmin(){
    clear
    echo ""
    echo -e "$branco    ██████╗ ██╗  ██╗██████╗     ███╗   ███╗██╗   ██╗     █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗\e[0m"
    echo -e "$branco    ██╔══██╗██║  ██║██╔══██╗    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║\e[0m"
    echo -e "$branco    ██████╔╝███████║██████╔╝    ██╔████╔██║ ╚████╔╝     ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║\e[0m"
    echo -e "$branco    ██╔═══╝ ██╔══██║██╔═══╝     ██║╚██╔╝██║  ╚██╔╝      ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║\e[0m"
    echo -e "$branco    ██║     ██║  ██║██║         ██║ ╚═╝ ██║   ██║       ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║\e[0m"
    echo -e "$branco    ╚═╝     ╚═╝  ╚═╝╚═╝         ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝\e[0m"
    echo ""
    echo ""
}

## Titulo Supabase [40]

nome_supabase(){
    clear
    echo ""
    echo -e "$branco              ███████╗██╗   ██╗██████╗  █████╗ ██████╗  █████╗ ███████╗███████╗\e[0m"
    echo -e "$branco              ██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝\e[0m"
    echo -e "$branco              ███████╗██║   ██║██████╔╝███████║██████╔╝███████║███████╗█████╗  \e[0m"
    echo -e "$branco              ╚════██║██║   ██║██╔═══╝ ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco              ███████║╚██████╔╝██║     ██║  ██║██████╔╝██║  ██║███████║███████╗\e[0m"
    echo -e "$branco              ╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Ntfy [41]

nome_ntfy(){
    clear
    echo ""
    echo -e "$branco                                ███╗   ██╗████████╗███████╗██╗   ██╗\e[0m"
    echo -e "$branco                                ████╗  ██║╚══██╔══╝██╔════╝╚██╗ ██╔╝\e[0m"
    echo -e "$branco                                ██╔██╗ ██║   ██║   █████╗   ╚████╔╝ \e[0m"
    echo -e "$branco                                ██║╚██╗██║   ██║   ██╔══╝    ╚██╔╝  \e[0m"
    echo -e "$branco                                ██║ ╚████║   ██║   ██║        ██║   \e[0m"
    echo -e "$branco                                ╚═╝  ╚═══╝   ╚═╝   ╚═╝        ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo Lowcoder [42]

nome_lowcoder(){
    clear
    echo ""
    echo -e "$branco               ██╗      ██████╗ ██╗    ██╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗ \e[0m"
    echo -e "$branco               ██║     ██╔═══██╗██║    ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗\e[0m"
    echo -e "$branco               ██║     ██║   ██║██║ █╗ ██║██║     ██║   ██║██║  ██║█████╗  ██████╔╝\e[0m"
    echo -e "$branco               ██║     ██║   ██║██║███╗██║██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗\e[0m"
    echo -e "$branco               ███████╗╚██████╔╝╚███╔███╔╝╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║\e[0m"
    echo -e "$branco               ╚══════╝ ╚═════╝  ╚══╝╚══╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Langflow [43]

nome_langflow() {
    clear
    echo ""
    echo -e "$branco               ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗██╗      ██████╗ ██╗    ██╗\e[0m"
    echo -e "$branco               ██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ██╔═══██╗██║    ██║\e[0m"
    echo -e "$branco               ██║     ███████║██╔██╗ ██║██║  ███╗█████╗  ██║     ██║   ██║██║ █╗ ██║\e[0m"
    echo -e "$branco               ██║     ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     ██║   ██║██║███╗██║\e[0m"
    echo -e "$branco               ███████╗██║  ██║██║ ╚████║╚██████╔╝██║     ███████╗╚██████╔╝╚███╔███╔╝\e[0m"
    echo -e "$branco               ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝ \e[0m"
    echo ""
    echo ""
}

## Titulo OpenProject [44]

nome_openproject() {
    clear
    echo ""
    echo -e "$branco   ██████╗ ██████╗ ███████╗███╗   ██╗    ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗\e[0m"
    echo -e "$branco  ██╔═══██╗██╔══██╗██╔════╝████╗  ██║    ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝\e[0m"
    echo -e "$branco  ██║   ██║██████╔╝█████╗  ██╔██╗ ██║    ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║   \e[0m"
    echo -e "$branco  ██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║    ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║   \e[0m"
    echo -e "$branco  ╚██████╔╝██║     ███████╗██║ ╚████║    ██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║   \e[0m"
    echo -e "$branco   ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo Zep [45]

nome_zep() {
    clear
    echo ""
    echo -e "$branco                                      ███████╗███████╗██████╗ \e[0m"
    echo -e "$branco                                      ╚══███╔╝██╔════╝██╔══██╗\e[0m"
    echo -e "$branco                                        ███╔╝ █████╗  ██████╔╝\e[0m"
    echo -e "$branco                                       ███╔╝  ██╔══╝  ██╔═══╝ \e[0m"
    echo -e "$branco                                      ███████╗███████╗██║     \e[0m"
    echo -e "$branco                                      ╚══════╝╚══════╝╚═╝     \e[0m"
    echo ""
    echo ""
}

## Titulo HumHub [46]

nome_humhub() {
    clear
    echo ""
    echo -e "$branco                       ██╗  ██╗██╗   ██╗███╗   ███╗██╗  ██╗██╗   ██╗██████╗ \e[0m"
    echo -e "$branco                       ██║  ██║██║   ██║████╗ ████║██║  ██║██║   ██║██╔══██╗\e[0m"
    echo -e "$branco                       ███████║██║   ██║██╔████╔██║███████║██║   ██║██████╔╝\e[0m"
    echo -e "$branco                       ██╔══██║██║   ██║██║╚██╔╝██║██╔══██║██║   ██║██╔══██╗\e[0m"
    echo -e "$branco                       ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║╚██████╔╝██████╔╝\e[0m"
    echo -e "$branco                       ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Yourls [47]

nome_yourls() {
clear
echo ""
echo -e "$branco                        ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ ██╗     ███████╗\e[0m"
echo -e "$branco                        ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗██║     ██╔════╝\e[0m"
echo -e "$branco                         ╚████╔╝ ██║   ██║██║   ██║██████╔╝██║     ███████╗\e[0m"
echo -e "$branco                          ╚██╔╝  ██║   ██║██║   ██║██╔══██╗██║     ╚════██║\e[0m"
echo -e "$branco                           ██║   ╚██████╔╝╚██████╔╝██║  ██║███████╗███████║\e[0m"
echo -e "$branco                           ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝\e[0m"
echo ""
echo ""
}

## Titulo TwentyCRM [48]

nome_twentycrm() {
clear
echo ""
echo -e "$branco         ████████╗██╗    ██╗███████╗███╗   ██╗████████╗██╗   ██╗ ██████╗██████╗ ███╗   ███╗\e[0m"
echo -e "$branco         ╚══██╔══╝██║    ██║██╔════╝████╗  ██║╚══██╔══╝╚██╗ ██╔╝██╔════╝██╔══██╗████╗ ████║\e[0m"
echo -e "$branco            ██║   ██║ █╗ ██║█████╗  ██╔██╗ ██║   ██║    ╚████╔╝ ██║     ██████╔╝██╔████╔██║\e[0m"
echo -e "$branco            ██║   ██║███╗██║██╔══╝  ██║╚██╗██║   ██║     ╚██╔╝  ██║     ██╔══██╗██║╚██╔╝██║\e[0m"
echo -e "$branco            ██║   ╚███╔███╔╝███████╗██║ ╚████║   ██║      ██║   ╚██████╗██║  ██║██║ ╚═╝ ██║\e[0m"
echo -e "$branco            ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝      ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
echo ""
echo ""
}

## Titulo Mattermost [49]

nome_mattermost() {
clear
echo ""
echo -e "$branco    ███╗   ███╗ █████╗ ████████╗████████╗███████╗██████╗ ███╗   ███╗ ██████╗ ███████╗████████╗\e[0m"
echo -e "$branco    ████╗ ████║██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██╔═══██╗██╔════╝╚══██╔══╝\e[0m"
echo -e "$branco    ██╔████╔██║███████║   ██║      ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║███████╗   ██║   \e[0m"
echo -e "$branco    ██║╚██╔╝██║██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║╚════██║   ██║   \e[0m"
echo -e "$branco    ██║ ╚═╝ ██║██║  ██║   ██║      ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝███████║   ██║   \e[0m"
echo -e "$branco    ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   \e[0m"
echo ""
echo ""
}

## Titulo Outline [50]

nome_outline() {
clear
echo ""
echo -e "$branco                       ██████╗ ██╗   ██╗████████╗██╗     ██╗███╗   ██╗███████╗\e[0m"
echo -e "$branco                      ██╔═══██╗██║   ██║╚══██╔══╝██║     ██║████╗  ██║██╔════╝\e[0m"
echo -e "$branco                      ██║   ██║██║   ██║   ██║   ██║     ██║██╔██╗ ██║█████╗  \e[0m"
echo -e "$branco                      ██║   ██║██║   ██║   ██║   ██║     ██║██║╚██╗██║██╔══╝  \e[0m"
echo -e "$branco                      ╚██████╔╝╚██████╔╝   ██║   ███████╗██║██║ ╚████║███████╗\e[0m"
echo -e "$branco                       ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝\e[0m"
echo ""
echo ""
}

## Titulo FocalBoard [51]

nome_focalboard() {
    clear
    echo ""
    echo -e "$branco         ███████╗ ██████╗  ██████╗ █████╗ ██╗     ██████╗  ██████╗  █████╗ ██████╗ ██████╗ \e[0m"
    echo -e "$branco         ██╔════╝██╔═══██╗██╔════╝██╔══██╗██║     ██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗\e[0m"
    echo -e "$branco         █████╗  ██║   ██║██║     ███████║██║     ██████╔╝██║   ██║███████║██████╔╝██║  ██║\e[0m"
    echo -e "$branco         ██╔══╝  ██║   ██║██║     ██╔══██║██║     ██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║\e[0m"
    echo -e "$branco         ██║     ╚██████╔╝╚██████╗██║  ██║███████╗██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝\e[0m"
    echo -e "$branco         ╚═╝      ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo GLPI [52]

nome_glpi() {
    clear
    echo ""
    echo -e "$branco                                     ██████╗ ██╗     ██████╗ ██╗\e[0m"
    echo -e "$branco                                    ██╔════╝ ██║     ██╔══██╗██║\e[0m"
    echo -e "$branco                                    ██║  ███╗██║     ██████╔╝██║\e[0m"
    echo -e "$branco                                    ██║   ██║██║     ██╔═══╝ ██║\e[0m"
    echo -e "$branco                                    ╚██████╔╝███████╗██║     ██║\e[0m"
    echo -e "$branco                                     ╚═════╝ ╚══════╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Anything LLM [53]

nome_anythingllm() {
    clear
    echo ""
    echo ""
    echo -e "$branco  █████╗ ███╗   ██╗██╗   ██╗████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ██╗     ██╗     ███╗   ███╗\e[0m"
    echo -e "$branco ██╔══██╗████╗  ██║╚██╗ ██╔╝╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██║     ██║     ████╗ ████║\e[0m"
    echo -e "$branco ███████║██╔██╗ ██║ ╚████╔╝    ██║   ███████║██║██╔██╗ ██║██║  ███╗    ██║     ██║     ██╔████╔██║\e[0m"
    echo -e "$branco ██╔══██║██║╚██╗██║  ╚██╔╝     ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ██║     ██║     ██║╚██╔╝██║\e[0m"
    echo -e "$branco ██║  ██║██║ ╚████║   ██║      ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████╗███████╗██║ ╚═╝ ██║\e[0m"
    echo -e "$branco ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚══════╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Excalidraw [54]

nome_excalidraw() {
    clear
    echo ""
    echo ""
    echo -e "$branco           ███████╗██╗  ██╗ ██████╗ █████╗ ██╗     ██╗██████╗ ██████╗  █████╗ ██╗    ██╗\e[0m"
    echo -e "$branco           ██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔══██╗██║    ██║\e[0m"
    echo -e "$branco           █████╗   ╚███╔╝ ██║     ███████║██║     ██║██║  ██║██████╔╝███████║██║ █╗ ██║\e[0m"
    echo -e "$branco           ██╔══╝   ██╔██╗ ██║     ██╔══██║██║     ██║██║  ██║██╔══██╗██╔══██║██║███╗██║\e[0m"
    echo -e "$branco           ███████╗██╔╝ ██╗╚██████╗██║  ██║███████╗██║██████╔╝██║  ██║██║  ██║╚███╔███╔╝\e[0m"
    echo -e "$branco           ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Excalidraw [55]

nome_easyappointments() {
    clear
    echo ""
    echo ""
    echo -e "$branco                                ███████╗ █████╗ ███████╗██╗   ██╗██╗                                 \e[0m"
    echo -e "$branco                                ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝██║                                 \e[0m"
    echo -e "$branco                                █████╗  ███████║███████╗ ╚████╔╝ ██║                                 \e[0m"
    echo -e "$branco                                ██╔══╝  ██╔══██║╚════██║  ╚██╔╝  ╚═╝                                 \e[0m"
    echo -e "$branco                                ███████╗██║  ██║███████║   ██║   ██╗                                 \e[0m"
    echo -e "$branco                                ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝                                 \e[0m"
    echo -e "$branco                                                                                                     \e[0m"
    echo -e "$branco █████╗ ██████╗ ██████╗  ██████╗ ██╗███╗   ██╗████████╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗\e[0m"
    echo -e "$branco██╔══██╗██╔══██╗██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝\e[0m"
    echo -e "$branco███████║██████╔╝██████╔╝██║   ██║██║██╔██╗ ██║   ██║   ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗\e[0m"
    echo -e "$branco██╔══██║██╔═══╝ ██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║   ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║\e[0m"
    echo -e "$branco██║  ██║██║     ██║     ╚██████╔╝██║██║ ╚████║   ██║   ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║\e[0m"
    echo -e "$branco╚═╝  ╚═╝╚═╝     ╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Documenso [56]

nome_documenso() {
    clear
    echo ""
    echo ""
    echo -e "$branco          ██████╗  ██████╗  ██████╗██╗   ██╗███╗   ███╗███████╗███╗   ██╗███████╗ ██████╗ \e[0m"
    echo -e "$branco          ██╔══██╗██╔═══██╗██╔════╝██║   ██║████╗ ████║██╔════╝████╗  ██║██╔════╝██╔═══██╗\e[0m"
    echo -e "$branco          ██║  ██║██║   ██║██║     ██║   ██║██╔████╔██║█████╗  ██╔██╗ ██║███████╗██║   ██║\e[0m"
    echo -e "$branco          ██║  ██║██║   ██║██║     ██║   ██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║╚════██║██║   ██║\e[0m"
    echo -e "$branco          ██████╔╝╚██████╔╝╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██║ ╚████║███████║╚██████╔╝\e[0m"
    echo -e "$branco          ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## Titulo Moodle [57]

nome_moodle() {
    clear
    echo ""
    echo ""
    echo -e "$branco                       ███╗   ███╗ ██████╗  ██████╗ ██████╗ ██╗     ███████╗\e[0m"
    echo -e "$branco                       ████╗ ████║██╔═══██╗██╔═══██╗██╔══██╗██║     ██╔════╝\e[0m"
    echo -e "$branco                       ██╔████╔██║██║   ██║██║   ██║██║  ██║██║     █████╗  \e[0m"
    echo -e "$branco                       ██║╚██╔╝██║██║   ██║██║   ██║██║  ██║██║     ██╔══╝  \e[0m"
    echo -e "$branco                       ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██████╔╝███████╗███████╗\e[0m"
    echo -e "$branco                       ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo ToolJet [58]

nome_tooljet() {
    clear
    echo ""
    echo ""
    echo -e "$branco                    ████████╗ ██████╗  ██████╗ ██╗          ██╗███████╗████████╗\e[0m"
    echo -e "$branco                    ╚══██╔══╝██╔═══██╗██╔═══██╗██║          ██║██╔════╝╚══██╔══╝\e[0m"
    echo -e "$branco                       ██║   ██║   ██║██║   ██║██║          ██║█████╗     ██║   \e[0m"
    echo -e "$branco                       ██║   ██║   ██║██║   ██║██║     ██   ██║██╔══╝     ██║   \e[0m"
    echo -e "$branco                       ██║   ╚██████╔╝╚██████╔╝███████╗╚█████╔╝███████╗   ██║   \e[0m"
    echo -e "$branco                       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝ ╚════╝ ╚══════╝   ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo Stirling PDF [59]

nome_stirlingpdf() {
    clear
    echo ""
    echo ""
    echo -e "$branco      ███████╗████████╗██╗██████╗ ██╗     ██╗███╗   ██╗ ██████╗     ██████╗ ██████╗ ███████╗\e[0m"
    echo -e "$branco      ██╔════╝╚══██╔══╝██║██╔══██╗██║     ██║████╗  ██║██╔════╝     ██╔══██╗██╔══██╗██╔════╝\e[0m"
    echo -e "$branco      ███████╗   ██║   ██║██████╔╝██║     ██║██╔██╗ ██║██║  ███╗    ██████╔╝██║  ██║█████╗  \e[0m"
    echo -e "$branco      ╚════██║   ██║   ██║██╔══██╗██║     ██║██║╚██╗██║██║   ██║    ██╔═══╝ ██║  ██║██╔══╝  \e[0m"
    echo -e "$branco      ███████║   ██║   ██║██║  ██║███████╗██║██║ ╚████║╚██████╔╝    ██║     ██████╔╝██║     \e[0m"
    echo -e "$branco      ╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═════╝ ╚═╝     \e[0m"
    echo ""
    echo ""
}

## Titulo ClickHouse [60]

nome_clickhouse() {
    clear
    echo ""
    echo ""
    echo -e "$branco            ██████╗██╗     ██╗ ██████╗██╗  ██╗██╗  ██╗ ██████╗ ██╗   ██╗███████╗███████╗\e[0m"
    echo -e "$branco           ██╔════╝██║     ██║██╔════╝██║ ██╔╝██║  ██║██╔═══██╗██║   ██║██╔════╝██╔════╝\e[0m"
    echo -e "$branco           ██║     ██║     ██║██║     █████╔╝ ███████║██║   ██║██║   ██║███████╗█████╗  \e[0m"
    echo -e "$branco           ██║     ██║     ██║██║     ██╔═██╗ ██╔══██║██║   ██║██║   ██║╚════██║██╔══╝  \e[0m"
    echo -e "$branco           ╚██████╗███████╗██║╚██████╗██║  ██╗██║  ██║╚██████╔╝╚██████╔╝███████║███████╗\e[0m"
    echo -e "$branco            ╚═════╝╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo RedisInsight [61]

nome_redisinsight() {
    clear
    echo ""
    echo ""
    echo -e "$branco       ██████╗ ███████╗██████╗ ██╗███████╗██╗███╗   ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗\e[0m"
    echo -e "$branco       ██╔══██╗██╔════╝██╔══██╗██║██╔════╝██║████╗  ██║██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝\e[0m"
    echo -e "$branco       ██████╔╝█████╗  ██║  ██║██║███████╗██║██╔██╗ ██║███████╗██║██║  ███╗███████║   ██║   \e[0m"
    echo -e "$branco       ██╔══██╗██╔══╝  ██║  ██║██║╚════██║██║██║╚██╗██║╚════██║██║██║   ██║██╔══██║   ██║   \e[0m"
    echo -e "$branco       ██║  ██║███████╗██████╔╝██║███████║██║██║ ╚████║███████║██║╚██████╔╝██║  ██║   ██║   \e[0m"
    echo -e "$branco       ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   \e[0m"
    echo ""
    echo ""
}

## Titulo Traccar [62]

nome_traccar() {
    clear
    echo ""
    echo ""
    echo -e "$branco                     ████████╗██████╗  █████╗  ██████╗ ██████╗ █████╗ ██████╗ \e[0m"
    echo -e "$branco                     ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗\e[0m"
    echo -e "$branco                        ██║   ██████╔╝███████║██║     ██║     ███████║██████╔╝\e[0m"
    echo -e "$branco                        ██║   ██╔══██╗██╔══██║██║     ██║     ██╔══██║██╔══██╗\e[0m"
    echo -e "$branco                        ██║   ██║  ██║██║  ██║╚██████╗╚██████╗██║  ██║██║  ██║\e[0m"
    echo -e "$branco                        ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Firecrawl [63]

nome_firecrawl() {
    clear
    echo ""
    echo ""
    echo -e "$branco               ███████╗██╗██████╗ ███████╗ ██████╗██████╗  █████╗ ██╗    ██╗██╗     \e[0m"
    echo -e "$branco               ██╔════╝██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║    ██║██║     \e[0m"
    echo -e "$branco               █████╗  ██║██████╔╝█████╗  ██║     ██████╔╝███████║██║ █╗ ██║██║     \e[0m"
    echo -e "$branco               ██╔══╝  ██║██╔══██╗██╔══╝  ██║     ██╔══██╗██╔══██║██║███╗██║██║     \e[0m"
    echo -e "$branco               ██║     ██║██║  ██║███████╗╚██████╗██║  ██║██║  ██║╚███╔███╔╝███████╗\e[0m"
    echo -e "$branco               ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝\e[0m"
    echo ""
    echo ""
}

## Titulo Wuzapi [63]

nome_wuzapi() {
    clear
    echo ""
    echo ""
    echo -e "$branco                          ██╗    ██╗██╗   ██╗███████╗ █████╗ ██████╗ ██╗\e[0m"
    echo -e "$branco                          ██║    ██║██║   ██║╚══███╔╝██╔══██╗██╔══██╗██║\e[0m"
    echo -e "$branco                          ██║ █╗ ██║██║   ██║  ███╔╝ ███████║██████╔╝██║\e[0m"
    echo -e "$branco                          ██║███╗██║██║   ██║ ███╔╝  ██╔══██║██╔═══╝ ██║\e[0m"
    echo -e "$branco                          ╚███╔███╔╝╚██████╔╝███████╗██║  ██║██║     ██║\e[0m"
    echo -e "$branco                           ╚══╝╚══╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

## Titulo Krayin CRM [64]

nome_krayincrm() {
    clear
    echo ""
    echo ""
    echo -e "$branco           ██╗  ██╗██████╗  █████╗ ██╗   ██╗██╗███╗   ██╗     ██████╗██████╗ ███╗   ███╗\e[0m"
    echo -e "$branco           ██║ ██╔╝██╔══██╗██╔══██╗╚██╗ ██╔╝██║████╗  ██║    ██╔════╝██╔══██╗████╗ ████║\e[0m"
    echo -e "$branco           █████╔╝ ██████╔╝███████║ ╚████╔╝ ██║██╔██╗ ██║    ██║     ██████╔╝██╔████╔██║\e[0m"
    echo -e "$branco           ██╔═██╗ ██╔══██╗██╔══██║  ╚██╔╝  ██║██║╚██╗██║    ██║     ██╔══██╗██║╚██╔╝██║\e[0m"
    echo -e "$branco           ██║  ██╗██║  ██║██║  ██║   ██║   ██║██║ ╚████║    ╚██████╗██║  ██║██║ ╚═╝ ██║\e[0m"
    echo -e "$branco           ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝\e[0m"
    echo ""
    echo ""
}

nome_transcrevezap(){
    clear
    echo ""
    echo ""
    echo -e "$branco        ████████╗██████╗  █████╗ ███╗   ██╗███████╗ ██████╗██████╗ ███████╗██╗   ██╗███████╗\e[0m"
    echo -e "$branco        ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔════╝██║   ██║██╔════╝\e[0m"
    echo -e "$branco           ██║   ██████╔╝███████║██╔██╗ ██║███████╗██║     ██████╔╝█████╗  ██║   ██║█████╗  \e[0m"
    echo -e "$branco           ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██║     ██╔══██╗██╔══╝  ╚██╗ ██╔╝██╔══╝  \e[0m"
    echo -e "$branco           ██║   ██║  ██║██║  ██║██║ ╚████║███████║╚██████╗██║  ██║███████╗ ╚████╔╝ ███████╗\e[0m"
    echo -e "$branco           ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚══════╝\e[0m"
    echo -e "$branco                                                                                            \e[0m"
    echo -e "$branco                                        ███████╗ █████╗ ██████╗                             \e[0m"
    echo -e "$branco                                        ╚══███╔╝██╔══██╗██╔══██╗                            \e[0m"
    echo -e "$branco                                          ███╔╝ ███████║██████╔╝                            \e[0m"
    echo -e "$branco                                         ███╔╝  ██╔══██║██╔═══╝                             \e[0m"
    echo -e "$branco                                        ███████╗██║  ██║██║                                 \e[0m"
    echo -e "$branco                                        ╚══════╝╚═╝  ╚═╝╚═╝                                 \e[0m"
    echo ""
    echo ""
}

# ===================================================================================================


## Titulo Saindo do setup

nome_saindo() {
    clear
    echo ""
    echo -e "$branco                ███████╗ █████╗ ██╗███╗   ██╗██████╗  ██████╗     ██████╗  ██████╗ \e[0m"
    echo -e "$branco                ██╔════╝██╔══██╗██║████╗  ██║██╔══██╗██╔═══██╗    ██╔══██╗██╔═══██╗\e[0m"
    echo -e "$branco                ███████╗███████║██║██╔██╗ ██║██║  ██║██║   ██║    ██║  ██║██║   ██║\e[0m"
    echo -e "$branco                ╚════██║██╔══██║██║██║╚██╗██║██║  ██║██║   ██║    ██║  ██║██║   ██║\e[0m"
    echo -e "$branco                ███████║██║  ██║██║██║ ╚████║██████╔╝╚██████╔╝    ██████╔╝╚██████╔╝\e[0m"
    echo -e "$branco                ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝     ╚═════╝  ╚═════╝ \e[0m"
    echo -e "$branco                                                                   \e[0m"
    echo -e "$branco                           ███████╗███████╗████████╗██╗   ██╗██████╗                   \e[0m"
    echo -e "$branco                           ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗                  \e[0m"
    echo -e "$branco                           ███████╗█████╗     ██║   ██║   ██║██████╔╝                  \e[0m"
    echo -e "$branco                           ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝                   \e[0m"
    echo -e "$branco                           ███████║███████╗   ██║   ╚██████╔╝██║                       \e[0m"
    echo -e "$branco                           ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝                       \e[0m"
    echo ""
    echo ""
}

## Titulo Remover Stack

nome_remover_stack() {
    clear
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
    echo -e "$branco                  ██████╗ ███████╗███╗   ███╗ ██████╗ ██╗   ██╗███████╗██████╗ \e[0m"
    echo -e "$branco                  ██╔══██╗██╔════╝████╗ ████║██╔═══██╗██║   ██║██╔════╝██╔══██╗\e[0m"
    echo -e "$branco                  ██████╔╝█████╗  ██╔████╔██║██║   ██║██║   ██║█████╗  ██████╔╝\e[0m"
    echo -e "$branco                  ██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗\e[0m"
    echo -e "$branco                  ██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ███████╗██║  ██║\e[0m"
    echo -e "$branco                  ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝\e[0m"
    echo -e "$branco                                                                               \e[0m"
    echo -e "$branco                           ███████╗████████╗ █████╗  ██████╗██╗  ██╗            \e[0m"
    echo -e "$branco                           ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝            \e[0m"
    echo -e "$branco                           ███████╗   ██║   ███████║██║     █████╔╝             \e[0m"
    echo -e "$branco                           ╚════██║   ██║   ██╔══██║██║     ██╔═██╗             \e[0m"
    echo -e "$branco                           ███████║   ██║   ██║  ██║╚██████╗██║  ██╗            \e[0m"
    echo -e "$branco                           ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝            \e[0m"
    echo ""
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
    echo""
}
nome_portainer.reset() {
    clear
    echo -e "$amarelo===================================================================================================\e[0m"
    echo ""
    echo ""
    echo -e "$branco           ██████╗ ███████╗███████╗███████╗████████╗ █████╗ ███╗   ██╗██████╗  ██████╗ \e[0m"
    echo -e "$branco           ██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗████╗  ██║██╔══██╗██╔═══██╗\e[0m"
    echo -e "$branco           ██████╔╝█████╗  ███████╗█████╗     ██║   ███████║██╔██╗ ██║██║  ██║██║   ██║\e[0m"
    echo -e "$branco           ██╔══██╗██╔══╝  ╚════██║██╔══╝     ██║   ██╔══██║██║╚██╗██║██║  ██║██║   ██║\e[0m"
    echo -e "$branco           ██║  ██║███████╗███████║███████╗   ██║   ██║  ██║██║ ╚████║██████╔╝╚██████╔╝\e[0m"
    echo -e "$branco           ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ \e[0m"
    echo -e "$branco                                                                                       \e[0m"
    echo -e "$branco                           ███████╗███████╗███╗   ██╗██╗  ██╗ █████╗                   \e[0m"
    echo -e "$branco                           ██╔════╝██╔════╝████╗  ██║██║  ██║██╔══██╗                  \e[0m"
    echo -e "$branco                           ███████╗█████╗  ██╔██╗ ██║███████║███████║                  \e[0m"
    echo -e "$branco                           ╚════██║██╔══╝  ██║╚██╗██║██╔══██║██╔══██║                  \e[0m"
    echo -e "$branco                           ███████║███████╗██║ ╚████║██║  ██║██║  ██║                  \e[0m"
    echo -e "$branco                           ╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝                  \e[0m"
    echo ""
    echo ""
    echo -e "$amarelo===================================================================================================\e[0m"
}

nome_verificar_stack() {
    clear
    echo ""
    echo ""
    echo -e "$branco                 ███████╗████████╗ █████╗  ██████╗██╗  ██╗         ██╗ █████╗      \e[0m"
    echo -e "$branco                 ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝         ██║██╔══██╗     \e[0m"
    echo -e "$branco                 ███████╗   ██║   ███████║██║     █████╔╝          ██║███████║     \e[0m"
    echo -e "$branco                 ╚════██║   ██║   ██╔══██║██║     ██╔═██╗     ██   ██║██╔══██║     \e[0m"
    echo -e "$branco                 ███████║   ██║   ██║  ██║╚██████╗██║  ██╗    ╚█████╔╝██║  ██║     \e[0m"
    echo -e "$branco                 ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝     ╚════╝ ╚═╝  ╚═╝     \e[0m"
    echo -e "$branco                                                                                   \e[0m"
    echo -e "$branco             ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ██████╗  █████╗ \e[0m"
    echo -e "$branco             ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗██╔══██╗██╔══██╗\e[0m"
    echo -e "$branco             ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║██║  ██║███████║\e[0m"
    echo -e "$branco             ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║██║  ██║██╔══██║\e[0m"
    echo -e "$branco             ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║██████╔╝██║  ██║\e[0m"
    echo -e "$branco             ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝\e[0m"
    echo ""
    echo ""
}

nome_expurgando() {
clear
echo ""
echo ""
echo -e "$branco       ███████╗██╗  ██╗██████╗ ██╗   ██╗██████╗  ██████╗  █████╗ ███╗   ██╗██████╗  ██████╗ \e[0m"
echo -e "$branco       ██╔════╝╚██╗██╔╝██╔══██╗██║   ██║██╔══██╗██╔════╝ ██╔══██╗████╗  ██║██╔══██╗██╔═══██╗\e[0m"
echo -e "$branco       █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝██║  ███╗███████║██╔██╗ ██║██║  ██║██║   ██║\e[0m"
echo -e "$branco       ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗██║   ██║██╔══██║██║╚██╗██║██║  ██║██║   ██║\e[0m"
echo -e "$branco       ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║╚██████╔╝██║  ██║██║ ╚████║██████╔╝╚██████╔╝\e[0m"
echo -e "$branco       ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ \e[0m"
echo -e "$branco                                                                                            \e[0m"
echo -e "$branco                  ███████╗███████╗██████╗ ██╗   ██╗██╗██████╗  ██████╗ ██████╗              \e[0m"
echo -e "$branco                  ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔══██╗██╔═══██╗██╔══██╗             \e[0m"
echo -e "$branco                  ███████╗█████╗  ██████╔╝██║   ██║██║██║  ██║██║   ██║██████╔╝             \e[0m"
echo -e "$branco                  ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║  ██║██║   ██║██╔══██╗             \e[0m"
echo -e "$branco                  ███████║███████╗██║  ██║ ╚████╔╝ ██║██████╔╝╚██████╔╝██║  ██║             \e[0m"
echo -e "$branco                  ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝             \e[0m"
echo ""
echo ""
}


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Defasados

nome_trocar_logos() {
    clear
    echo ""
    echo -e "$branco████████╗██████╗  ██████╗  ██████╗ █████╗ ██████╗     ██╗      ██████╗  ██████╗  ██████╗ ███████╗\e[0m"
    echo -e "$branco╚══██╔══╝██╔══██╗██╔═══██╗██╔════╝██╔══██╗██╔══██╗    ██║     ██╔═══██╗██╔════╝ ██╔═══██╗██╔════╝\e[0m"
    echo -e "$branco   ██║   ██████╔╝██║   ██║██║     ███████║██████╔╝    ██║     ██║   ██║██║  ███╗██║   ██║███████╗\e[0m"
    echo -e "$branco   ██║   ██╔══██╗██║   ██║██║     ██╔══██║██╔══██╗    ██║     ██║   ██║██║   ██║██║   ██║╚════██║\e[0m"
    echo -e "$branco   ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██║██║  ██║    ███████╗╚██████╔╝╚██████╔╝╚██████╔╝███████║\e[0m"
    echo -e "$branco   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝\e[0m"
    echo -e "$branco                                                                                                 \e[0m"
    echo -e "$branco   ██████╗  ██████╗      ██████╗██╗  ██╗ █████╗ ████████╗██╗    ██╗ ██████╗  ██████╗ ████████╗      \e[0m"
    echo -e "$branco   ██╔══██╗██╔═══██╗    ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔═══██╗╚══██╔══╝      \e[0m"
    echo -e "$branco   ██║  ██║██║   ██║    ██║     ███████║███████║   ██║   ██║ █╗ ██║██║   ██║██║   ██║   ██║         \e[0m"
    echo -e "$branco   ██║  ██║██║   ██║    ██║     ██╔══██║██╔══██║   ██║   ██║███╗██║██║   ██║██║   ██║   ██║         \e[0m"
    echo -e "$branco   ██████╔╝╚██████╔╝    ╚██████╗██║  ██║██║  ██║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝   ██║         \e[0m"
    echo -e "$branco   ╚═════╝  ╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝    ╚═╝         \e[0m"
    echo ""
    echo ""
}

nome_finalizado() {
    clear
    echo ""
    echo -e "$branco             ███████╗██╗███╗   ██╗ █████╗ ██╗     ██╗███████╗ █████╗ ██████╗  ██████╗ \e[0m"
    echo -e "$branco             ██╔════╝██║████╗  ██║██╔══██╗██║     ██║╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗\e[0m"
    echo -e "$branco             █████╗  ██║██╔██╗ ██║███████║██║     ██║  ███╔╝ ███████║██║  ██║██║   ██║\e[0m"
    echo -e "$branco             ██╔══╝  ██║██║╚██╗██║██╔══██║██║     ██║ ███╔╝  ██╔══██║██║  ██║██║   ██║\e[0m"
    echo -e "$branco             ██║     ██║██║ ╚████║██║  ██║███████╗██║███████╗██║  ██║██████╔╝╚██████╔╝\e[0m"
    echo -e "$branco             ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ \e[0m"
    echo ""
    echo ""
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Menu de opções

#menu_instalador(){
#    echo -e "${amarelo}[ 00 ]${reset} - ${branco}Testar SMTP                             ${verde}| ${reset}  ${amarelo}[ 21 ]${reset} - ${branco}Formbricks${reset}"
#    echo -e "${amarelo}[ 01 ]${reset} - ${branco}Traefik & Portainer                     ${verde}| ${reset}  ${amarelo}[ 22 ]${reset} - ${branco}NocoDB${reset}"
#    echo -e "${amarelo}[ 02 ]${reset} - ${branco}Chatwoot                                ${verde}| ${reset}  ${amarelo}[ 23 ]${reset} - ${branco}Langfuse${reset}"
#    echo -e "${branco}  '-->${amarelo}[ 2.1 ]${reset} - ${branco}Chatwoot (ARM)                   ${verde}| ${reset}  ${amarelo}[ 24 ]${reset} - ${branco}Metabase${reset}"
#    echo -e "${amarelo}[ 03 ]${reset} -  ${branco}Evolution API                          ${verde}| ${reset}  ${amarelo}[ 25 ]${reset} - ${branco}Odoo${reset}"
#    echo -e "${branco}  '-->${amarelo}[ 3.1 ]${reset} - ${branco}Evolution API (ARM)              ${verde}| ${reset}  ${amarelo}[ 26 ]${reset} - ${branco}Chatwoot Nestor${reset}"
#    echo -e "${amarelo}[ 04 ]${reset} - ${branco}MinIO                                   ${verde}| ${reset}  ${amarelo}[ 27 ]${reset} - ${branco}Uno API${reset}"
#    echo -e "${amarelo}[ 05 ]${reset} - ${branco}Typebot                                 ${verde}| ${reset}  ${amarelo}[ 28 ]${reset} - ${branco}N8N + Nodes Quepasa $vermelho[OFF]${reset}"
#    echo -e "${amarelo}[ 06 ]${reset} - ${branco}N8N                                     ${verde}| ${reset}  ${amarelo}[ 29 ]${reset} - ${branco}Quepasa API $vermelho[OFF]${reset}"
#    echo -e "${amarelo}[ 07 ]${reset} - ${branco}Flowise                                 ${verde}| ${reset}  ${amarelo}[ 30 ]${reset} - ${branco}Docuseal${reset}"
#    echo -e "${amarelo}[ 08 ]${reset} - ${branco}PgAdmin 4                               ${verde}| ${reset}  ${amarelo}[ 31 ]${reset} - ${branco}Grafana + Prometheus + cAdvisor${reset}"
#    echo -e "${amarelo}[ 09 ]${reset} - ${branco}Nocobase                                ${verde}| ${reset}  ${amarelo}[ 32 ]${reset} - ${branco}Dify AI${reset}"
#    echo -e "${amarelo}[ 10 ]${reset} - ${branco}Botpress                                ${verde}| ${reset}  ${amarelo}[ 33 ]${reset} - ${branco}Ollama${reset}"
#    echo -e "${amarelo}[ 11 ]${reset} - ${branco}Wordpress                               ${verde}| ${reset}  ${amarelo}[ 34 ]${reset} - ${branco}Affine${reset}"
#    echo -e "${amarelo}[ 12 ]${reset} - ${branco}Baserow                                 ${verde}| ${reset}  ${amarelo}[ 35 ]${reset} - ${branco}Directus${reset}"
#    echo -e "${amarelo}[ 13 ]${reset} - ${branco}MongoDB                                 ${verde}| ${reset}  ${amarelo}[ 36 ]${reset} - ${branco}VaultWarden${reset}"
#    echo -e "${amarelo}[ 14 ]${reset} - ${branco}RabbitMQ                                ${verde}| ${reset}  ${amarelo}[ 37 ]${reset} - ${branco}NextCloud${reset}"
#    echo -e "${amarelo}[ 15 ]${reset} - ${branco}Uptime Kuma                             ${verde}| ${reset}  ${amarelo}[ 38 ]${reset} - ${branco}Strapi${reset}"
#    echo -e "${amarelo}[ 16 ]${reset} - ${branco}Cal.com                                 ${verde}| ${reset}  ${amarelo}[ 39 ]${reset} - ${branco}PhpMyAdmin${reset}"
#    echo -e "${amarelo}[ 17 ]${reset} - ${branco}Mautic                                  ${verde}| ${reset}  ${amarelo}[ 40 ]${reset} - ${branco}Supabase${reset}"
#    echo -e "${amarelo}[ 18 ]${reset} - ${branco}Appsmith                                ${verde}| ${reset}  ${amarelo}[ 41 ]${reset} - ${branco}Ntfy ${verde}[NOVO]${reset}"
#    echo -e "${amarelo}[ 19 ]${reset} - ${branco}Qdrant                                  ${verde}| ${reset}  ${amarelo}[ 42 ]${reset} - ${branco}REMOVER STACK${reset}"
#    echo -e "${amarelo}[ 20 ]${reset} - ${branco}Woofed CRM                              ${verde}| ${reset}  ${amarelo}[ 43 ]${reset} - ${branco}Sair do instalador${reset}"
#    echo""
#}

menu_instalador() {
  case $menu_instalador in
    1) menu_instalador_pg_1 ;;
    2) menu_instalador_pg_2 ;;
    *) echo "Erro ao listar menu..." ;;
  esac
}

menu_instalador_pg_1(){
    echo -e "${amarelo}[ 00 ]${reset} - ${branco}Testar SMTP                            ${verde}| ${reset}  ${amarelo}[ 23 ]${reset} - ${branco}Langfuse${reset}"
    echo -e "${amarelo}[ 01 ]${reset} - ${branco}Traefik & Portainer                    ${verde}| ${reset}  ${amarelo}[ 24 ]${reset} - ${branco}Metabase${reset}"
    echo -e "${amarelo}[ 02 ]${reset} - ${branco}Chatwoot                               ${verde}| ${reset}  ${amarelo}[ 25 ]${reset} - ${branco}Odoo${reset}"
    echo -e "${amarelo}[ 03 ]${reset} - ${branco}Evolution API                          ${verde}| ${reset}  ${amarelo}[ 26 ]${reset} - ${branco}Chatwoot Nestor${reset}"
    echo -e "${amarelo}[ 04 ]${reset} - ${branco}MinIO                                  ${verde}| ${reset}  ${amarelo}[ 27 ]${reset} - ${branco}Uno API${reset}"
    echo -e "${amarelo}[ 05 ]${reset} - ${branco}Typebot                                ${verde}| ${reset}  ${amarelo}[ 28 ]${reset} - ${branco}N8N + Nodes Quepasa${reset}"
    echo -e "${amarelo}[ 06 ]${reset} - ${branco}N8N                                    ${verde}| ${reset}  ${amarelo}[ 29 ]${reset} - ${branco}Quepasa API${reset}"
    echo -e "${amarelo}[ 07 ]${reset} - ${branco}Flowise                                ${verde}| ${reset}  ${amarelo}[ 30 ]${reset} - ${branco}Docuseal${reset}"
    echo -e "${amarelo}[ 08 ]${reset} - ${branco}PgAdmin 4                              ${verde}| ${reset}  ${amarelo}[ 31 ]${reset} - ${branco}Grafana + Prometheus + cAdvisor${reset}"
    echo -e "${amarelo}[ 09 ]${reset} - ${branco}Nocobase                               ${verde}| ${reset}  ${amarelo}[ 32 ]${reset} - ${branco}Dify AI${reset}"
    echo -e "${amarelo}[ 10 ]${reset} - ${branco}Botpress                               ${verde}| ${reset}  ${amarelo}[ 33 ]${reset} - ${branco}Ollama${reset}"
    echo -e "${amarelo}[ 11 ]${reset} - ${branco}Wordpress                              ${verde}| ${reset}  ${amarelo}[ 34 ]${reset} - ${branco}Affine${reset}"
    echo -e "${amarelo}[ 12 ]${reset} - ${branco}Baserow                                ${verde}| ${reset}  ${amarelo}[ 35 ]${reset} - ${branco}Directus${reset}"
    echo -e "${amarelo}[ 13 ]${reset} - ${branco}MongoDB                                ${verde}| ${reset}  ${amarelo}[ 36 ]${reset} - ${branco}VaultWarden${reset}"
    echo -e "${amarelo}[ 14 ]${reset} - ${branco}RabbitMQ                               ${verde}| ${reset}  ${amarelo}[ 37 ]${reset} - ${branco}NextCloud${reset}"
    echo -e "${amarelo}[ 15 ]${reset} - ${branco}Uptime Kuma                            ${verde}| ${reset}  ${amarelo}[ 38 ]${reset} - ${branco}Strapi${reset}"
    echo -e "${amarelo}[ 16 ]${reset} - ${branco}Cal.com                                ${verde}| ${reset}  ${amarelo}[ 39 ]${reset} - ${branco}PhpMyAdmin${reset}"
    echo -e "${amarelo}[ 17 ]${reset} - ${branco}Mautic                                 ${verde}| ${reset}  ${amarelo}[ 40 ]${reset} - ${branco}Supabase${reset}"
    echo -e "${amarelo}[ 18 ]${reset} - ${branco}Appsmith                               ${verde}| ${reset}  ${amarelo}[ 41 ]${reset} - ${branco}Ntfy${reset}"
    echo -e "${amarelo}[ 19 ]${reset} - ${branco}Qdrant                                 ${verde}| ${reset}  ${amarelo}[ 42 ]${reset} - ${branco}LowCoder${reset}"
    echo -e "${amarelo}[ 20 ]${reset} - ${branco}Woofed CRM                             ${verde}| ${reset}  ${amarelo}[ 43 ]${reset} - ${branco}LangFlow${reset}"
    echo -e "${amarelo}[ 21 ]${reset} - ${branco}Formbricks                             ${verde}| ${reset}  ${amarelo}[ 44 ]${reset} - ${branco}OpenProject${reset}"
    echo -e "${amarelo}[ 22 ]${reset} - ${branco}NocoDB                                 ${verde}| ${reset}  ${amarelo}[ 45 ]${reset} - ${branco}ZEP${reset}"
    echo -e ""
    echo -e "${branco}<-- Digite ${amarelo}P1 ${branco}para ir para pagina 1             ${amarelo}|${branco}              Digite ${amarelo}P2${branco} para ir para pagina 2 -->${reset}"
    echo -e ""
}

menu_instalador_pg_2(){
    echo -e "${amarelo}[ 46 ]${reset} - ${branco}HumHub                                 ${verde}| ${reset}  ${amarelo}[ 69 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 47 ]${reset} - ${branco}Yourls                                 ${verde}| ${reset}  ${amarelo}[ 70 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 48 ]${reset} - ${branco}TwentyCRM ${vermelho}[OFF]                        ${verde}| ${reset}  ${amarelo}[ 71 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 49 ]${reset} - ${branco}Mattermost                             ${verde}| ${reset}  ${amarelo}[ 72 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 50 ]${reset} - ${branco}Outline                                ${verde}| ${reset}  ${amarelo}[ 73 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 51 ]${reset} - ${branco}Focalboard                             ${verde}| ${reset}  ${amarelo}[ 74 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 52 ]${reset} - ${branco}GLPI                                   ${verde}| ${reset}  ${amarelo}[ 75 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 53 ]${reset} - ${branco}Anything LLM                           ${verde}| ${reset}  ${amarelo}[ 76 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 54 ]${reset} - ${branco}Excalidraw                             ${verde}| ${reset}  ${amarelo}[ 77 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 55 ]${reset} - ${branco}Easy!Apointments                       ${verde}| ${reset}  ${amarelo}[ 78 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 56 ]${reset} - ${branco}Documenso                              ${verde}| ${reset}  ${amarelo}[ 79 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 57 ]${reset} - ${branco}Moodle                                 ${verde}| ${reset}  ${amarelo}[ 80 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 58 ]${reset} - ${branco}ToolJet                                ${verde}| ${reset}  ${amarelo}[ 81 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 59 ]${reset} - ${branco}Stirling PDF ${verde}[NOVO]                    ${verde}| ${reset}  ${amarelo}[ 82 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 60 ]${reset} - ${branco}ClickHouse ${verde}[NOVO]                      ${verde}| ${reset}  ${amarelo}[ 83 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 61 ]${reset} - ${branco}RedisInsight ${verde}[NOVO]                    ${verde}| ${reset}  ${amarelo}[ 84 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 62 ]${reset} - ${branco}Traccar ${verde}[NOVO]                         ${verde}| ${reset}  ${amarelo}[ 85 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 63 ]${reset} - ${branco}Firecrawl ${verde}[NOVO]                       ${verde}| ${reset}  ${amarelo}[ 86 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 64 ]${reset} - ${branco}Wuzapi ${verde}[NOVO]                          ${verde}| ${reset}  ${amarelo}[ 87 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 65 ]${reset} - ${branco}krayin CRM ${verde}[NOVO]                      ${verde}| ${reset}  ${amarelo}[ 88 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 66 ]${reset} - ${branco}EM BREVE...                            ${verde}| ${reset}  ${amarelo}[ 89 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 67 ]${reset} - ${branco}EM BREVE...                            ${verde}| ${reset}  ${amarelo}[ 90 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e "${amarelo}[ 68 ]${reset} - ${branco}EM BREVE...                            ${verde}| ${reset}  ${amarelo}[ 91 ]${reset} - ${branco}EM BREVE...${reset}"
    echo -e ""
    echo -e ""
    echo -e "${branco}<-- Digite ${amarelo}P1 ${branco}para ir para pagina 1             ${amarelo}|${branco}              Digite ${amarelo}P2${branco} para ir para pagina 2 -->${reset}"
    echo -e ""
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Verificar se stack já existe
verificar_stack() {
    clear
    local nome_stack="$1"

    if docker stack ls --format "{{.Name}}" | grep -q "^${nome_stack}$"; then
        nome_verificar_stack
        echo -e "A stack '$amarelo${nome_stack}\e[0m' existe."
        echo -e "Caso deseje refazer a instalação, por favor, remova a stack $amarelo${nome_stack}\e[0m do"
        echo -e "seu Portainer e tente novamente..."
        echo -e ""
        echo -e "Voltando ao menu principal em 10 segundos"
        sleep 10

        clear

        return 0
    else
        return 1
    fi
}


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

stack_editavel(){

    ## Instalar jq
    sudo apt install jq -y > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/10 - [ OK ] - Instalando JQ Método 1/2"
    else
        echo "2/10 - [ OFF ] - Erro ao instalar JQ Método 1/2"
    fi

    sudo apt-get install -y jq > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "3/10 - [ OK ] - Instalando JQ Método 2/2"
    else
        echo "3/10 - [ OFF ] - Erro ao instalar JQ Método 2/2"
    fi

    ## Definindo o diretório do arquivo dados_portainer
    arquivo="/root/dados_vps/dados_portainer"

    ## Verifica se o arquivo existe
    if [ ! -f "$arquivo" ]; then
        echo "Arquivo não encontrado: $arquivo"
        sleep 2

        ## Cria o arquivo caso não exista
        criar_arquivo
    fi

    ## Remove o https:// caso existir
    sed -i 's/Dominio do portainer: https:\/\/\(.*\)/Dominio do portainer: \1/' "$arquivo"

    ## Pega o usuario do portainer
    USUARIO=$(grep "Usuario: " /root/dados_vps/dados_portainer | awk -F "Usuario: " '{print $2}')
    if [ $? -eq 0 ]; then
        echo -e "4/10 - [ OK ] - Pegando usuario do portainer: $bege$USUARIO$reset"
    else
        echo "4/10 - [ OFF ] - Erro ao pegar usuario do portainer"
    fi

    ## Pega a senha do portainer
    SENHA=$(grep "Senha: " /root/dados_vps/dados_portainer | awk -F "Senha: " '{print $2}')
    if [ $? -eq 0 ]; then
        echo -e "5/10 - [ OK ] - Pegando a senha do portainer: $bege$SENHA$reset"
    else
        echo "5/10 - [ OFF ] - Erro ao pegar senha do portainer"
    fi

    ## Pega a URL do portainer
    PORTAINER_URL=$(grep "Dominio do portainer: " /root/dados_vps/dados_portainer | awk -F "Dominio do portainer: " '{print $2}')
    if [ $? -eq 0 ]; then
        echo -e "6/10 - [ OK ] - Pegando dominio do Portainer: $bege$PORTAINER_URL$reset"
    else
        echo "6/10 - [ OFF ] - Erro ao pegar dominio do Portainer"
    fi

    ## Usa o token do portainer
    #TOKEN=$(grep "Token: " /root/dados_vps/dados_portainer | awk -F "Token: " '{print $2}')

    ## Pega um token do portainer
    #TOKEN=$(curl -k -X POST -H "Content-Type: application/json" -d "{\"username\":\"$USUARIO\",\"password\":\"$SENHA\"}" https://$PORTAINER_URL/api/auth | jq -r .jwt)

    TOKEN=""
    Tentativa_atual=0
    Maximo_de_tentativas=6

    while [ -z "$TOKEN" ] || [ "$TOKEN" == "null" ]; do
        TOKEN=$(curl -k -s -X POST -H "Content-Type: application/json" -d "{\"username\":\"$USUARIO\",\"password\":\"$SENHA\"}" https://$PORTAINER_URL/api/auth | jq -r .jwt)

        Tentativa_atual=$((Tentativa_atual + 1))

        ## Verifica se atingiu o número máximo de tentativas
        if [ "$Tentativa_atual" -ge "$Maximo_de_tentativas" ]; then
            clear
            erro_msg
            echo "7/10 - [ OFF ] - Erro: Falha ao obter token após $Maximo_de_tentativas tentativas."
            echo "Verifique suas credenciais do Portainer para conseguirmos realizar o deploy."
            sleep 5
            criar_arquivo
            return
            #exit 1
        fi

        ## Se o token foi obtido com sucesso, sair do loop
        if [ -n "$TOKEN" ] && [ "$TOKEN" != "null" ]; then
            break
        fi

        ## Aguarda alguns segundos antes de tentar novamente
        echo -e "Tentando gerar token do portainer. Tentativa atual $bege$Tentativa_atual/5$reset"
        sleep 5
    done

    if [ $? -eq 0 ]; then
        echo -e "7/10 - [ OK ] - Pegando token do Portainer: $bege$TOKEN$reset"
    fi


    ### Verifica se o token veio vazio
    #if [ -z "$TOKEN" ] || [ "$TOKEN" == "null" ]; then
    #    echo "Erro: Falha ao obter token. Preencha com suas credenciais do portainer a seguir."
    #    sleep 5
    #    criar_arquivo
    #    #exit 1
    #fi

    ## Salva dados no arquivo do portainer
    echo -e "[ PORTAINER ]\nDominio do portainer: $PORTAINER_URL\n\nUsuario: $USUARIO\n\nSenha: $SENHA\n\nToken: $TOKEN" > "/root/dados_vps/dados_portainer"

    ## Pegando o id do portainer
    ENDPOINT_ID=$(curl -k -s -X GET -H "Authorization: Bearer $TOKEN" https://$PORTAINER_URL/api/endpoints | jq -r '.[] | select(.Name == "primary") | .Id')
    if [ $? -eq 0 ]; then
        echo -e "8/10 - [ OK ] - Pegando ID do Portainer: $bege$ENDPOINT_ID$reset"
    else
        echo "8/10 - [ OFF ] - Erro ao pegar ID do Portainer"
    fi

    ## Definindo id 1 do Portainer
    #ENDPOINT_ID=1

    ## Pegando o ID do Swarm
    SWARM_ID=$(curl -k -s -X GET -H "Authorization: Bearer $TOKEN" "https://$PORTAINER_URL/api/endpoints/$ENDPOINT_ID/docker/swarm" | jq -r .ID)
    if [ $? -eq 0 ]; then
        echo -e "9/10 - [ OK ] - Pegando ID do Swarm: $bege$SWARM_ID$reset"
    else
        echo "9/10 - [ OFF ] - Erro ao pegar ID do Swarm"
    fi

    ## Testa o Swarm
    SWARM_STATUS=$(docker info --format '{{.Swarm.LocalNodeState}}')
    if [ "$SWARM_STATUS" != "active" ]; then
        echo "Erro: Docker Swarm não está ativo."
        exit 1
    fi

    # Arquivo temporário para capturar a saída de erro e a resposta
    erro_output=$(mktemp)
    response_output=$(mktemp)

    ## Fazendo deploy da stack pelo portainer
    http_code=$(curl -s -o "$response_output" -w "%{http_code}" -k -X POST \
    -H "Authorization: Bearer $TOKEN" \
    -F "Name=$STACK_NAME" \
    -F "file=@$(pwd)/$STACK_NAME.yaml" \
    -F "SwarmID=$SWARM_ID" \
    -F "endpointId=$ENDPOINT_ID" \
    "https://$PORTAINER_URL/api/stacks/create/swarm/file" 2> "$erro_output")

    response_body=$(cat "$response_output")

    if [ "$http_code" -eq 200 ]; then
        # Verifica o conteúdo da resposta para garantir que o deploy foi bem-sucedido
        if echo "$response_body" | grep -q "\"Id\""; then
            echo -e "10/10 - [ OK ] - Deploy da stack $bege$STACK_NAME$reset feito com sucesso!"
        else
            echo -e "10/10 - [ OFF ] - Erro, resposta inesperada do servidor ao tentar efetuar deploy da stack $bege$STACK_NAME$reset."
            echo "Resposta do servidor: $(echo "$response_body" | jq .)"
        fi
    else
        echo "10/10 - [ OFF ] - Erro ao efetuar deploy. Resposta HTTP: $http_code"
        echo "Mensagem de erro: $(cat "$erro_output")"
        echo "Detalhes: $(echo "$response_body" | jq .)"
    fi

    echo ""

    # Remove os arquivos temporários
    rm "$erro_output"
    rm "$response_output"
}

## Função para verificar se o arquivo de dados do Portainer existe
verificar_arquivo() {
    sudo apt install jq -y > /dev/null 2>&1
    if [ ! -f "/root/dados_vps/dados_portainer" ]; then
        nome_credenciais
        criar_arquivo
    else
        verificar_campos
    fi
}


## Função para criar o arquivo de dados do Portainer
criar_arquivo() {
    if [ -f "/root/dados_vps/dados_portainer" ]; then
        rm "/root/dados_vps/dados_portainer"
        echo "Arquivo existente removido."
    fi

    ## Caso não exista o arquivo ele vai pedir os dados para criar.
    nome_credenciais
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    #echo -e "\e[97mObs: Coloque o https:// antes do link do portainer\e[0m"
    read -p "Digite a Url do Portainer (ex: portainer.oriondesign.art.br): " PORTAINER_URL
    echo ""

    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    read -p "Digite seu Usuario (ex: admin): " USUARIO
    echo ""

    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "\e[97mObs: A Senha não aparecera ao digitar\e[0m"
    read -s -p "Digite a Senha (ex: @Senha123_): " SENHA
    echo ""

    verificar_token "$PORTAINER_URL" "$USUARIO" "$SENHA" true
}


## Função para verificar os campos do arquivo de dados do Portainer
verificar_campos() {
    PORTAINER_URL=$(grep -oP '(?<=Dominio do portainer: ).*' /root/dados_vps/dados_portainer)
    USUARIO=$(grep -oP '(?<=Usuario: ).*' /root/dados_vps/dados_portainer)
    SENHA=$(grep -oP '(?<=Senha: ).*' /root/dados_vps/dados_portainer)

    ## se por acaso não tiver login nem senha lá vem para ca
    if [ -z "$USUARIO" ] || [ -z "$SENHA" ]; then

        nome_credenciais
        echo -e "\e[97mPasso$amarelo 1/3\e[0m"
        #echo -e "\e[97mObs: Coloque o https:// antes do link do portainer\e[0m"
        read -p "Digite a Url do Portainer (ex: portainer.oriondesign.art.br): " PORTAINER_URL
        echo ""

        echo -e "\e[97mPasso$amarelo 2/3\e[0m"
        read -p "Digite seu Usuario (ex: admin): " USUARIO
        echo ""

        echo -e "\e[97mPasso$amarelo 3/3\e[0m"
        echo -e "\e[97mObs: A Senha não aparecera ao digitar\e[0m"
        read -s -p "Digite a Senha (ex: @Senha123_): " SENHA
        echo ""

        ATUALIZAR="true" ## Verificar se já existe TOKEN no arquivo
        verificar_token "$PORTAINER_URL" "$USUARIO" "$SENHA" true
    ## Caso o usuario e senha estiver como "Precisa criar dentro do portainer" como o arquivo oficial vem para ca
    elif [ "$USUARIO" == "Precisa criar dentro do portainer" ] || [ "$SENHA" == "Precisa criar dentro do portainer" ]; then

        nome_credenciais
        echo -e "\e[97mPasso$amarelo 1/3\e[0m"
        #echo -e "\e[97mObs: Coloque o https:// antes do link do portainer\e[0m"
        read -p "Digite a Url do Portainer (ex: portainer.oriondesign.art.br): " PORTAINER_URL
        echo ""

        echo -e "\e[97mPasso$amarelo 2/3\e[0m"
        read -p "Digite seu Usuario (ex: admin): " USUARIO
        echo ""

        echo -e "\e[97mPasso$amarelo 3/3\e[0m"
        echo -e "\e[97mObs: A Senha não aparecera ao digitar\e[0m"
        read -s -p "Digite a Senha (ex: @Senha123_): " NOVA_SENHA
        echo ""

        verificar_token "$PORTAINER_URL" "$NOVO_USUARIO" "$NOVA_SENHA" true
    else
        verificar_token "$PORTAINER_URL" "$USUARIO" "$SENHA" false
    fi
}

## Função para verificar se o token é válido
verificar_token() {
    PORTAINER_URL="$1"
    USUARIO="$2"
    SENHA="$3"
    ATUALIZAR="$4"
    TENTATIVAS=0
    MAX_TENTATIVAS=5

    while [ $TENTATIVAS -lt $MAX_TENTATIVAS ]; do
        TENTATIVAS=$((TENTATIVAS+1))

        #echo -e "Dados a serem testados:"
        #echo "Link do Portainer: $PORTAINER_URL"
        #echo "Usuário: $USUARIO"
        #echo "Senha: $SENHA"

        RESPONSE=$(curl -s -w "\n%{http_code}" -k -X POST -H "Content-Type: application/json" -d "{\"username\":\"$USUARIO\",\"password\":\"$SENHA\"}" "https://$PORTAINER_URL/api/auth")
        TOKEN=$(echo "$RESPONSE" | sed '$d' | jq -r '.jwt')
        HTTP_STATUS=$(echo "$RESPONSE" | tail -n1)

        if [ "$HTTP_STATUS" -eq 200 ] && [ ! -z "$TOKEN" ]; then

            if [ "$ATUALIZAR" == true ]; then
                atualizar_arquivo
            fi

            $APP_ORION

            break
        else
            if [ $TENTATIVAS -gt 1 ]; then
                clear
                erro_msg
                echo ""
                echo ""
                echo "              Não foi possivel autenticar suas credenciais. Por favor tente novamente"
                echo "                                           Tentativa: $TENTATIVAS/$MAX_TENTATIVAS"

                sleep 3

            else
                clear
                nome_credenciais
            fi

            if [ $TENTATIVAS -lt $MAX_TENTATIVAS ]; then

                nome_credenciais
                echo -e "\e[97mPasso$amarelo 1/3\e[0m"
                #echo -e "\e[97mObs: Coloque o https:// antes do link do portainer\e[0m"
                read -p "Digite a Url do Portainer (ex: portainer.oriondesign.art.br): " PORTAINER_URL
                echo ""

                echo -e "\e[97mPasso$amarelo 2/3\e[0m"
                read -p "Digite seu Usuario (ex: admin): " USUARIO
                echo ""

                echo -e "\e[97mPasso$amarelo 3/3\e[0m"
                echo -e "\e[97mObs: A Senha não aparecera ao digitar\e[0m"
                read -s -p "Digite a Senha (ex: @Senha123_): " SENHA
                echo ""
                ATUALIZAR="true"
            else
                clear
                erro_msg

                echo ""
                echo ""
                echo "                         Você atingiu o limite maximo de tentativas ($TENTATIVAS/$MAX_TENTATIVAS)."
                echo "                         Tente novamente quando lembrar da sua credencial!"
                echo 5
                clear
                break
            fi
        fi
    done
}

## Função para atualizar o arquivo de dados do Portainer com o novo usuário e senha
atualizar_arquivo() {
    echo -e "[ PORTAINER ]\nDominio do portainer: $PORTAINER_URL\n\nUsuario: $USUARIO\n\nSenha: $SENHA\n\nToken: $TOKEN" > "/root/dados_vps/dados_portainer"
    echo -e "\nArquivo de dados do Portainer atualizado com sucesso!"
}

telemetria() {
    ## Pega o IP da máquina
    read -r ip _ <<< "$(hostname -I)"

    ip="$ip"
    ferramenta="$1"
    status="$2"

    curl -X POST 'https://telemetria.oriondesign.art.br/api/telemetria' \
    -H "Content-Type: application/json" \
    -d '{
      "ip": "'"$ip"'",
      "ferramenta": "'"$ferramenta"'",
      "status": "'"$status"'"
    }' > /dev/null 2>&1
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Verificadores


## Verifica se existe Docker, Portainer e Traefik na VPS
verificar_docker_e_portainer_traefik() {
    ## Verifica se o Docker está instalado
    if ! command -v docker &> /dev/null; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[1] Traefik e Portainer${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    ## Verifica se o Portainer está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "portainer"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[1] Traefik e Portainer${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    ## Verificar se o Traefik está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "traefik"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[1] Traefik e Portainer${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe Minio
verificar_antes_se_tem_minio() {

    ## Verifica se o Portainer está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "minio"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 4 ] - MinIO${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe rabbitMQ
verificar_antes_se_tem_rabbitmq() {

    ## Verifica se o Portainer está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "rabbitmq"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 14 ] - RabbitMQ${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe Minio RabbitMQ e Chatwoot
verificar_antes_se_tem_minio_e_rabbitmq_e_chatwoot() {
    ## Verifica se o minio está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "minio"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 4 ] - MinIO${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    ## Verifica se o rabbitmq está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "rabbitmq"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 14 ] - RabbitMQ${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    ## Verificar se o chatwoot está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "chatwoot"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 2 ] - Chatwoot${reset} ou  \e[32m[ 26 ] - Chatwoot Nestor (ft. Francis) ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe Minio e Qdrant
verificar_antes_se_tem_minio_e_qdrant() {
    ## Verifica se o minio está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "minio"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 4 ] - MinIO${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    ## Verifica se o rabbitmq está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "qdrant"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 19 ] - Qdrant${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe Minio
verificar_antes_se_tem_mongo() {

    ## Verifica se o Portainer está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "mongodb"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 13 ] - MongoDB${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verifica se existe Qdrant
verificar_antes_se_tem_qdrant() {

    ## Verifica se o Portainer está instalado
    if ! docker ps -a --format "{{.Names}}" | grep -q "qdrant"; then
        clear
        erro_msg
        echo -e "Ops, parece que você não instalou a opção \e[32m[ 19 ] - Qdrant${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."

        echo ""
        echo "Voltando ao menu em 5 segundos."
        sleep 5

        nome_menu
        menu_instalador

        return 1
    fi

    return 0
}

## Verificar Container Postgres

verificar_container_postgres() {
    if docker ps -q --filter "name=postgres_postgres" | grep -q .; then
        return 0
    else
        return 1
    fi
}

## Verificar Container PgVector

verificar_container_pgvector() {
    if docker ps -q --filter "name=pgvector" | grep -q .; then
        return 0
    else
        return 1
    fi
}

## Verificar Container Mysql

verificar_container_mysql() {
    if docker ps -q --filter "name=mysql" | grep -q .; then
        return 0
    else
        return 1
    fi
}

## Verificar Container Redis

verificar_container_redis() {
    if docker ps -q --filter "name=redis" | grep -q .; then
        return 0
    else
        return 1
    fi
}

## Verificar Container Minio

verificar_container_minio() {
    if docker ps -q --filter "name=minio" | grep -q .; then
        return 0
    else
        return 1
    fi
}

## Esperar Postgres estar pronto

wait_for_postgres() {
    dados
    local container_name="postgres_postgres"

    while true; do
        CONTAINER_ID=$(docker ps -q --filter "name=.*$container_name.*")

        if [ -n "$CONTAINER_ID" ]; then

            break
        fi

        sleep 5
    done
}

## Verificar se o Traefik esta online

wait_30_sec() {
    sleep 30
}

wait_stack() {
    echo "Este processo pode demorar um pouco. Se levar mais de 5 minutos, cancele, pois algo deu errado."
    while true; do
        # Verifica se o serviço trarik está ativo
        if docker service ls --filter "name=$1" | grep "1/1"; then
            sleep 10
            echo ""
            break
        fi

        sleep 5
    done
}

requisitar_outra_instalacao(){
    read -p "Deseja instalar outra aplicação? (Y/N): " choice
    if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        return
    else
        cd
        cd
        clear
        exit 1
    fi
}


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Pegar informações


## Pegar senha Postgres

pegar_senha_postgres() {
    while :; do
        if [ -f /root/postgres.yaml ]; then
            senha_postgres=$(grep "POSTGRES_PASSWORD" /root/postgres.yaml | awk -F '=' '{print $2}')
            break
        else
            sleep 5
        fi
    done
}

pegar_senha_pgvector() {
    while :; do
        if [ -f /root/pgvector.yaml ]; then
            senha_pgvector=$(grep "POSTGRES_PASSWORD" /root/pgvector.yaml | awk -F '=' '{print $2}')
            break
        else
            sleep 5
        fi
    done
}

pegar_user_senha_rabbitmq() {
    while :; do
        if [ -f /root/rabbitmq.yaml ]; then
            user_rabbit_mqs=$(grep "RABBITMQ_DEFAULT_USER" /root/rabbitmq.yaml | awk -F ': ' '{print $2}')
            senha_rabbit_mqs=$(grep "RABBITMQ_DEFAULT_PASS" /root/rabbitmq.yaml | awk -F ': ' '{print $2}')
            break
        else
            sleep 5
            echo "erro"
        fi
    done
}

## Pegar senha Mysql

pegar_senha_mysql() {
    while :; do
        if [ -f /root/mysql.yaml ]; then
            senha_mysql=$(grep "MYSQL_ROOT_PASSWORD" /root/mysql.yaml | awk -F '=' '{print $2}')
            break
        else
            sleep 5
        fi
    done
}

## Pegar senha Minio

pegar_senha_minio() {
    user_minio=$(grep "MINIO_ROOT_USER" /root/minio.yaml | awk -F '=' '{print $2}')
    senha_minio=$(grep "MINIO_ROOT_PASSWORD" /root/minio.yaml | awk -F '=' '{print $2}')
    url_minio=$(grep "MINIO_BROWSER_REDIRECT_URL" /root/minio.yaml | awk -F '=' '{print $2}' | sed 's/https:\/\///')
    url_s3=$(grep "MINIO_SERVER_URL" /root/minio.yaml | awk -F '=' '{print $2}' | sed 's/https:\/\///')
}

## Pegar link S3

pegar_link_s3() {
    url_s3=$(grep "MINIO_SERVER_URL" /root/minio.yaml | awk -F '=' '{print $2}' | sed 's/https:\/\///')
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Criadores de banco de dados Postgres
criar_banco_postgres_da_stack() {
    while :; do
        if docker ps -q --filter "name=^postgres_postgres" | grep -q .; then
            CONTAINER_ID=$(docker ps -q --filter "name=^postgres_postgres")

            # Verificar se o banco de dados já existe
            docker exec "$CONTAINER_ID" psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "$1"

            if [ $? -eq 0 ]; then
                ## echo ""
                read -p "O banco de dados $1 já existe. Deseja apagar e criar um novo banco de dados? (Y/N): " resposta
                if [ "$resposta" == "Y" ] || [ "$resposta" == "y" ]; then
                    # Apagar o banco de dados
                    docker exec "$CONTAINER_ID" psql -U postgres -c "DROP DATABASE IF EXISTS $1(force);" > /dev/null 2>&1
                    if [ $? -eq 0 ]; then
                    echo "" ## Sucesso
                    else
                        echo "" ## Erro
                    fi
                    # Criar o banco de dados novamente
                    docker exec "$CONTAINER_ID" psql -U postgres -c "CREATE DATABASE $1;" > /dev/null 2>&1
                else
                    echo ""
                fi
                break
            else
                # Criar o banco de dados
                docker exec "$CONTAINER_ID" psql -U postgres -c "CREATE DATABASE $1;" > /dev/null 2>&1

                # Verificar novamente se o banco de dados foi criado com sucesso
                docker exec "$CONTAINER_ID" psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "$1"

                if [ $? -eq 0 ]; then
                    nada="nada"
                    break
                else
                    echo "Erro ao criar o banco de dados. Tentando novamente..."
                    echo ""
                fi
            fi
        else
            sleep 5
        fi
    done
}

## Criar banco PgVector
criar_banco_pgvector_da_stack() {
    while :; do
        if docker ps -q --filter "name=^pgvector_pgvector" | grep -q .; then
            CONTAINER_PGVECTOR_ID=$(docker ps -q --filter "name=^pgvector_pgvector")

            # Verificar se o banco de dados já existe
            docker exec "$CONTAINER_PGVECTOR_ID" psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "$1"

            if [ $? -eq 0 ]; then
                echo ""
                read -p "O banco de dados $1 já existe. Deseja apagar e criar um novo banco de dados? (Y/N): " resposta
                if [ "$resposta" == "Y" ] || [ "$resposta" == "y" ]; then
                    # Apagar o banco de dados
                    docker exec "$CONTAINER_PGVECTOR_ID" psql -U postgres -c "DROP DATABASE IF EXISTS $1(force);" > /dev/null 2>&1
                    if [ $? -eq 0 ]; then
                    echo "" ## Sucesso
                    else
                        echo "" ## Erro
                    fi
                    # Criar o banco de dados novamente
                    docker exec "$CONTAINER_PGVECTOR_ID" psql -U postgres -c "CREATE DATABASE $1;" > /dev/null 2>&1
                else
                    echo ""
                fi
                break
            else
                # Criar o banco de dados
                docker exec "$CONTAINER_PGVECTOR_ID" psql -U postgres -c "CREATE DATABASE $1;" > /dev/null 2>&1

                # Verificar novamente se o banco de dados foi criado com sucesso
                docker exec "$CONTAINER_PGVECTOR_ID" psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "$1"

                if [ $? -eq 0 ]; then
                    nada="nada"
                    break
                else
                    echo "Erro ao criar o banco de dados. Tentando novamente..."
                    echo ""
                fi
            fi
        else
            sleep 5
        fi
    done
}

## Criar banco MySQL
criar_banco_mysql_da_stack() {
    while :; do
        if docker ps -q --filter "name=^mysql_mysql" | grep -q .; then
            CONTAINER_ID=$(docker ps -q --filter "name=^mysql_mysql")

            # Verificar se o banco de dados já existe
            docker exec -e MYSQL_PWD="$senha_mysql" "$CONTAINER_ID" mysql -u root \
                -e "SHOW DATABASES LIKE '$1';" | grep -qw "$1"

            if [ $? -eq 0 ]; then
                echo ""
                read -p "O banco de dados $1 já existe. Deseja apagar e criar \
um novo banco de dados? (Y/N): " resposta
                if [ "$resposta" == "Y" ] || [ "$resposta" == "y" ]; then
                    # Apagar o banco de dados
                    docker exec -e MYSQL_PWD="$senha_mysql" "$CONTAINER_ID" mysql -u root \
                        -e "DROP DATABASE IF EXISTS $1;" > /dev/null 2>&1
                    if [ $? -eq 0 ]; then
                        echo "" ## Sucesso
                    else
                        echo "" ## Erro
                    fi
                    # Criar o banco de dados novamente
                    docker exec -e MYSQL_PWD="$senha_mysql" "$CONTAINER_ID" mysql -u root \
                        -e "CREATE DATABASE $1;" > /dev/null 2>&1
                else
                    echo ""
                fi
                break
            else
                # Criar o banco de dados
                docker exec -e MYSQL_PWD="$senha_mysql" "$CONTAINER_ID" mysql -u root \
                    -e "CREATE DATABASE $1;" > /dev/null 2>&1

                # Verificar se o banco foi criado com sucesso
                docker exec -e MYSQL_PWD="$senha_mysql" "$CONTAINER_ID" mysql -u root \
                    -e "SHOW DATABASES LIKE '$1';" | grep -qw "$1"

                if [ $? -eq 0 ]; then
                    nada="nada"
                    break
                else
                    echo "Erro ao criar o banco de dados. Tentando novamente..."
                    echo ""
                fi
            fi
        else
            echo "Container MySQL não encontrado. Tentando novamente..."
            echo ""
            sleep 5
        fi
    done
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

validar_senha() {
    senha=$1
    tamanho_minimo=$2
    tem_erro=0
    mensagem_erro=""

    # Verifica comprimento mínimo
    if [ ${#senha} -lt $tamanho_minimo ]; then
        mensagem_erro+="\n- Senha precisa ter no mínimo $tamanho_minimo caracteres"
        tem_erro=1
    fi

    # Verifica letra maiúscula
    if ! [[ $senha =~ [A-Z] ]]; then
        mensagem_erro+="\n- Falta pelo menos uma letra maiúscula"
        tem_erro=1
    fi

    # Verifica letra minúscula
    if ! [[ $senha =~ [a-z] ]]; then
        mensagem_erro+="\n- Falta pelo menos uma letra minúscula"
        tem_erro=1
    fi

    # Verifica número
    if ! [[ $senha =~ [0-9] ]]; then
        mensagem_erro+="\n- Falta pelo menos um número"
        tem_erro=1
    fi

    # Verifica caracteres especiais permitidos
    if ! [[ $senha =~ [@_] ]]; then
        mensagem_erro+="\n- Falta pelo menos um caractere especial (@ ou _)"
        tem_erro=1
    fi

    # Verifica caracteres não permitidos
    if [[ $senha =~ [^A-Za-z0-9@_] ]]; then
        mensagem_erro+="\n- Contém caracteres especiais não permitidos (use apenas @ ou _)"
        tem_erro=1
    fi

    # Se houver erro, mostra as mensagens
    if [ $tem_erro -eq 1 ]; then
        echo -e "Senha inválida! Corrija os seguintes problemas:$mensagem_erro"
        return 1
    fi

    return 0
}

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Instalação das Ferramentas

## ████████╗███████╗███████╗████████╗███████╗    ███████╗███╗   ███╗████████╗██████╗
## ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝    ██╔════╝████╗ ████║╚══██╔══╝██╔══██╗
##    ██║   █████╗  ███████╗   ██║   █████╗      ███████╗██╔████╔██║   ██║   ██████╔╝
##    ██║   ██╔══╝  ╚════██║   ██║   ██╔══╝      ╚════██║██║╚██╔╝██║   ██║   ██╔═══╝
##    ██║   ███████╗███████║   ██║   ███████╗    ███████║██║ ╚═╝ ██║   ██║   ██║
##    ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚══════╝    ╚══════╝╚═╝     ╚═╝   ╚═╝   ╚═╝

ferramenta_testeemail() {
clear
dados
nome_testeemail
preencha_as_info

while true; do

echo -e "\e[97mPasso$amarelo 1/5\e[0m"
echo -en "\e[33mDigite o endereço de Email (ex: contato@oriondesign.art.br): \e[0m" && read -r email_teste
echo ""

echo -e "\e[97mPasso$amarelo 2/5\e[0m"
echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
echo -en "\e[33mDigite o usuário de Email (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_teste
echo ""

echo -e "\e[97mPasso$amarelo 3/5\e[0m"
echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
echo -en "\e[33mDigite a Senha do email (ex: @Senha123_): \e[0m" && read -r senha_teste
echo ""

echo -e "\e[97mPasso$amarelo 4/5\e[0m"
echo -en "\e[33mDigite o Host Smtp (ex: smtp.hostinger.com): \e[0m" && read -r host_teste
echo ""

echo -e "\e[97mPasso$amarelo 5/5\e[0m"
echo -en "\e[33mDigite a Porta Smtp (ex: 465): \e[0m" && read -r porta_teste
echo ""

clear
nome_testeemail
conferindo_as_info

echo -e "\e[33mEmail:\e[97m $email_teste\e[0m"
echo ""

echo -e "\e[33mUsuário:\e[97m $user_teste\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $senha_teste\e[0m"
echo ""

echo -e "\e[33mHost:\e[97m $host_teste\e[0m"
echo ""

echo -e "\e[33mPorta:\e[97m $porta_teste\e[0m"
echo ""

read -p "As respostas estão corretas? (Y/N): " confirmacao
if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then
    clear
    nome_testando
    break
else
    clear
    nome_testeemail
    preencha_as_info
fi
done

#MENSAGEM DE INICIANDO (PASSOS)
echo -e "\e[97m• INICIANDO VERIFICAÇÃO \e[33m[1/3]\e[0m"
echo ""

sudo apt-get update > /dev/null 2>&1
sudo apt-get install swaks -y > /dev/null 2>&1

msg="Se você está lendo isso, o seu SMTP está funcionando =D.
By: OrionDesign"

if swaks --to "$email_teste" --from "$email_teste" --server "$host_teste" --port "$porta_teste" --auth LOGIN --auth-user "$user_teste" --auth-password "$senha_teste" --tls --body "$msg"; then
    sleep 2
    clear
    nome_testeemail
    echo -e "\e[32m[Resultado do Teste SMTP]\e[0m"
    echo ""
    echo -e "\e[33mOs dados informados\e[92m estão funcionando corretamente\e[33m.\e[0m"
else
    sleep 2
    clear
    nome_testeemail
    echo -e "\e[32m[Resultado do Teste SMTP]\e[0m"
    echo ""
    echo -e "\e[33mOs dados informados\e[91m NÃO estão funcionando corretamente.\e[33m Por favor, verifique os dados e tente novamente.\e[0m"
fi

creditos_msg

read -p "Deseja instalar outra aplicação? (Y/N): " choice
    if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        return
    else
        cd
        cd
        clear
        exit 1
    fi
}

##   ████████╗██████╗  █████╗ ███████╗███████╗██╗██╗  ██╗    ███████╗
##   ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██║██║ ██╔╝    ██╔════╝
##      ██║   ██████╔╝███████║█████╗  █████╗  ██║█████╔╝     █████╗
##      ██║   ██╔══██╗██╔══██║██╔══╝  ██╔══╝  ██║██╔═██╗     ██╔══╝
##      ██║   ██║  ██║██║  ██║███████╗██║     ██║██║  ██╗    ███████╗
##      ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝    ╚══════╝
##
## ██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗███╗   ██╗███████╗██████╗
## ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║████╗  ██║██╔════╝██╔══██╗
## ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║██╔██╗ ██║█████╗  ██████╔╝
## ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗
## ██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║██║ ╚████║███████╗██║  ██║
## ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝

ferramenta_traefik_e_portainer() {

## Limpa o terminal
clear

## Mostra o nome da aplicação
nome_traefik_e_portainer

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o Dominio para o Portainer (ex: portainer.oriondesign.art.br): \e[0m" && read -r url_portainer
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite um usuario para o Portainer (ex: admin): \e[0m" && read -r user_portainer
    echo ""

    ##Pergunta o Dominio para aplicação
    while true; do
      echo -e "\e[97mPasso$amarelo 3/6\e[0m"
      echo -e "$amarelo--> Minimo 12 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
      echo -e "$amarelo--> Evite os caracteres especiais como: \!#$"
      echo -en "\e[33mDigite uma senha para o Portainer (ex: @Senha123456_): \e[0m" && read -r pass_portainer
      echo ""

      if validar_senha "$pass_portainer" 12; then
          break
      fi
      echo ""
    done

    ## Pergunta o Nome do Servidor
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Não pode conter Espaços e/ou cartacteres especiais"
    echo -en "\e[33mEscolha um nome para o seu servidor (ex: OrionDesign): \e[0m" && read -r nome_servidor
    echo ""

    ## Pergunta o nome da Rede Interna
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -e "$amarelo--> Não pode conter Espaços e/ou cartacteres especiais."
    echo -en "\e[33mDigite um nome para sua rede interna (ex: OrionNet): \e[0m" && read -r nome_rede_interna
    echo ""

    ## Pergunta o Email para informações sobre o certificado
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite um endereço de Email válido (ex: contato@oriondesign.art.br): \e[0m" && read -r email_ssl
    echo ""

    ## Limpa o termianl
    clear

    ## Mostra o nome da aplicação
    nome_traefik_e_portainer

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mLink do Portainer:\e[97m $url_portainer\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mUsuario do Portainer:\e[97m $user_portainer\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mSenha do Portainer:\e[97m $pass_portainer\e[0m"
    echo ""

    ## Informação sobre Nome do Servidor
    echo -e "\e[33mNome do Servidor:\e[97m $nome_servidor\e[0m"
    echo ""

    ## Informação sobre Nome da Rede interna
    echo -e "\e[33mRede interna:\e[97m $nome_rede_interna\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail:\e[97m $email_ssl\e[0m"
    echo ""
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_traefik_e_portainer

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO TRAEFIK \e[33m[1/9]\e[0m"
echo ""
sleep 1

## Neste passo vamos estar salvando os dados preenchidos anteriormente para que o instalador possa usar posteriormente na instalação de qualquer ferramenta.

## Garante que o usuario esteja no /root/
cd
cd

## Verifica se já não existe uma pasta chamada "dados_vps", se existir ele ignora e se não existir ele cria uma
## Esta foi uma PR que veio do usuario Fabio => https://github.com/hipnologo

if [ ! -d "dados_vps" ]; then
    mkdir dados_vps
fi

## Fim da PR

## Abre a pasta dados_vps
cd dados_vps

## Cria um arquivo chamado "dados_vps" com: "nome do servidor", "nome da rede interna", "email", "link do portainer"
cat > dados_vps << EOL
[DADOS DA VPS]

Estes dados foram preenchidos na hora que você foi instalar o Traefik e Portainer e
serão utilizados para realizar as instalações no do SetupOrion v.2

Nome do Servidor: $nome_servidor

Rede interna: $nome_rede_interna

Email para SSL: $email_ssl

Link do Portainer: $url_portainer

Obrigado por utilizar nosso AutoInstalador.
Caso esse conteudo foi util, não deixe de apoiar nosso projeto.

pix@oriondesign.art.br

Bebam água!
EOL

## Volta para /root/
cd
cd

## Ativa a função dados para pegar os dados da vps
dados

## Mensagem de Passo
echo -e "\e[97m• ATUALIZANDO E CONFIGURANDO A VPS \e[33m[2/9]\e[0m"
echo ""
sleep 1

## Neste passo vamos estar Atualizando e configurando a vps para conseguir rodar nosso setup

## Todos os passo que estão com "> /dev/null 2>&1" São para não mostrar os logs.

## Fiz isso com o intuito de melhorar a visualização deixando o terminal apenas com os passos pré descritos

## Vou adicionar uma verificação com echo e o passo caso der algum problema para verificar.

sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/9 - [ OK ] - Update"
else
    echo "1/9 - [ OFF ] - Update"
fi
sudo apt upgrade -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "2/9 - [ OK ] - Upgrade"
else
    echo "2/9 - [ OFF ] - Upgrade"
fi
sudo timedatectl set-timezone America/Sao_Paulo > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "3/9 - [ OK ] - Timezone"
else
    echo "3/9 - [ OFF ] - Timezone"
fi
sudo apt-get install -y apt-utils > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "4/9 - [ OK ] - Apt-Utils"
else
    echo "4/9 - [ OFF ] - Apt-Utils"
fi
sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "5/9 - [ OK ] - Update"
else
    echo "5/9 - [ OFF ] - Update"
fi
hostnamectl set-hostname $nome_servidor > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "6/9 - [ OK ] - Set Hostname"
else
    echo "6/9 - [ OFF ] - Set Hostname"
fi
sudo sed -i "s/127.0.0.1[[:space:]]localhost/127.0.0.1 $nome_servidor/g" /etc/hosts > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "7/9 - [ OK ] - Adicionando nome do servidor em etc/hosts"
else
    echo "7/9 - [ OFF ] - Adicionando nome do servidor em etc/hosts"
fi
sudo apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "8/9 - [ OK ] - Update"
else
    echo "8/9 - [ OFF ] - Update"
fi
sudo apt-get install -y apparmor-utils > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "9/9 - [ OK ] - Apparmor-Utils"
else
    echo "9/9 - [ OFF ] - Apparmor-Utils"
fi
echo ""

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO DOCKER SWARM \e[33m[3/9]\e[0m"
echo ""
sleep 1

telemetria Docker iniciado

## Nesse passo vamos estar instalando docker no modo swarm


#ip=$(curl -s ifconfig.me)
read -r ip _ <<<$(hostname -I | tr ' ' '\n' | grep -v '^127\.0\.0\.1' | tr '\n' ' ')
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Pegando IP $ip"
else
    echo "1/3 - [ OFF ] - Pegando IP $ip"
fi
curl -fsSL https://get.docker.com | bash > /dev/null 2>&1
systemctl enable docker > /dev/null 2>&1
systemctl start docker > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "2/3 - [ OK ] - Baixando e Instalando Docker"
else
    echo "2/3 - [ OFF ] - Baixando e Instalando Docker"
fi
sleep 5

max_attempts=3
attempt=0

while [ $attempt -le $max_attempts ]; do
    docker swarm init --advertise-addr $ip > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "3/3 - [ OK ] - Iniciando Swarm"
        break
    else
        echo "3/3 - [ OFF ] - Iniciando Swarm"
        echo "Ops não foi possivel iniciar o swarm, tentativa $attempt de $max_attempts"
        attempt=$((attempt + 1))
        sleep 5
    fi
done

if [ $attempt -gt $max_attempts ]; then
    echo "Não foi possível iniciar o Swarm após $max_attempts tentativas..."
    echo "Recomendo formatar a VPS e tentar novamente"
    echo "Lembre-se que o primeiro requisito é estar usando uma VPS Vazia."
    sleep 10
    exit 1
fi
echo ""

telemetria Docker finalizado

## Mensagem de Passo
echo -e "\e[97m• CRIANDO REDE INTERNA \e[33m[4/9]\e[0m"
echo ""
sleep 1

## Neste passo vamos criar a rede interna para utilizar nas demais aplicações

docker network create --driver=overlay $nome_rede_interna > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Rede Interna"
else
    echo "1/1 - [ OFF ] - Rede Interna"
fi
echo ""

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO TRAEFIK \e[33m[5/9]\e[0m"
echo ""
sleep 1

telemetria Traefik iniciado

## Neste passo vamos estar criando a Stack yaml do traefik na pasta /root/
## Isso possibilitará que o usuario consiga edita-lo posteriormente

## Depois vamos instalar o traefik e verificar se esta tudo certo.

## Criando a stack traefik.yaml
cat > traefik.yaml << EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  traefik:
    image: traefik:v2.11.2
    command:
      - "--api.dashboard=true"
      - "--providers.docker.swarmMode=true"
      - "--providers.docker.endpoint=unix:///var/run/docker.sock"
      - "--providers.docker.exposedbydefault=false"
      - "--providers.docker.network=$nome_rede_interna" ## Nome da rede interna
      - "--entrypoints.web.address=:80"
      - "--entrypoints.web.http.redirections.entryPoint.to=websecure"
      - "--entrypoints.web.http.redirections.entryPoint.scheme=https"
      - "--entrypoints.web.http.redirections.entrypoint.permanent=true"
      - "--entrypoints.websecure.address=:443"
      - "--entrypoints.web.transport.respondingTimeouts.idleTimeout=3600"
      - "--certificatesresolvers.letsencryptresolver.acme.httpchallenge=true"
      - "--certificatesresolvers.letsencryptresolver.acme.httpchallenge.entrypoint=web"
      - "--certificatesresolvers.letsencryptresolver.acme.storage=/etc/traefik/letsencrypt/acme.json"
      - "--certificatesresolvers.letsencryptresolver.acme.email=$email_ssl" ## Email para receber as notificações
      - "--log.level=DEBUG"
      - "--log.format=common"
      - "--log.filePath=/var/log/traefik/traefik.log"
      - "--accesslog=true"
      - "--accesslog.filepath=/var/log/traefik/access-log"

    volumes:
      - "vol_certificates:/etc/traefik/letsencrypt"
      - "/var/run/docker.sock:/var/run/docker.sock:ro"

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ports:
      - target: 80
        published: 80
        mode: host
      - target: 443
        published: 443
        mode: host

    deploy:
      placement:
        constraints:
          - node.role == manager
      labels:
        - "traefik.enable=true"
        - "traefik.http.middlewares.redirect-https.redirectscheme.scheme=https"
        - "traefik.http.middlewares.redirect-https.redirectscheme.permanent=true"
        - "traefik.http.routers.http-catchall.rule=Host(\`{host:.+}\`)"
        - "traefik.http.routers.http-catchall.entrypoints=web"
        - "traefik.http.routers.http-catchall.middlewares=redirect-https@docker"
        - "traefik.http.routers.http-catchall.priority=1"

## --------------------------- ORION --------------------------- ##

volumes:
  vol_shared:
    external: true
    name: volume_swarm_shared
  vol_certificates:
    external: true
    name: volume_swarm_certificates

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    attachable: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Criando Stack"
else
    echo "1/2 - [ OFF ] - Criando Stack"
    echo "Ops, não foi possivel criar a stack do Traefik"
fi

docker stack deploy --prune --resolve-image always -c traefik.yaml traefik > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Deploy Stack"
else
    echo "2/2 - [ OFF ] - Deploy Stack"
    echo "Ops, não foi possivel subir o Traefik."
fi

echo ""
## Mensagem de Passo
echo -e "\e[97m• ESPERANDO O TRAEFIK ESTAR ONLINE \e[33m[6/9]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "traefik" para verificar se o serviço esta online
wait_stack "traefik"

telemetria Traefik finalizado
## Espera 30 segundos
wait_30_sec

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO PORTAINER \e[33m[7/9]\e[0m"
echo ""
sleep 1

telemetria Portainer iniciado

## Neste passo vamos estar criando a Stack yaml do Portainer na pasta /root/
## Isso possibilitará que o usuario consiga edita-lo posteriormente

## Depois vamos instalar o Portainer e verificar se esta tudo certo.

## Criando a stack portainer.yaml
cat > portainer.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  agent:
    image: portainer/agent:latest ## Versão Agent do Portainer

    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/volumes:/var/lib/docker/volumes

    networks:
      - $nome_rede_interna ## Nome da rede interna

    deploy:
      mode: global
      placement:
        constraints: [node.platform.os == linux]

## --------------------------- ORION --------------------------- ##

  portainer:
    image: portainer/portainer-ce:latest ## Versão do Portainer
    command: -H tcp://tasks.agent:9001 --tlsskipverify

    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints: [node.role == manager]
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.portainer.rule=Host(\`$url_portainer\`)" ## Dominio do Portainer
        - "traefik.http.services.portainer.loadbalancer.server.port=9000"
        - "traefik.http.routers.portainer.tls.certresolver=letsencryptresolver"
        - "traefik.http.routers.portainer.service=portainer"
        - "traefik.docker.network=$nome_rede_interna" ## Nome da rede interna
        - "traefik.http.routers.portainer.entrypoints=websecure"
        - "traefik.http.routers.portainer.priority=1"

## --------------------------- ORION --------------------------- ##

volumes:
  portainer_data:
    external: true
    name: portainer_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    attachable: true
    name: $nome_rede_interna ## Nome da rede interna

EOL
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Criando Stack"
else
    echo "1/2 - [ OFF ] - Criando Stack"
    echo "Ops, não foi possivel criar a stack do Portainer"
fi

docker stack deploy --prune --resolve-image always -c portainer.yaml portainer > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Deploy Stack"
else
    echo "2/2 - [ OFF ] - Deploy Stack"
    echo "Ops, não foi possivel Subir a stack do Portainer"
fi

echo ""
## Mensagem de Passo
echo -e "\e[97m• ESPERANDO O PORTAINER ESTAR ONLINE \e[33m[8/9]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_portainer para verificar se o serviço esta online
wait_stack "portainer"

sleep 5

telemetria Portainer finalizado

echo ""
## Mensagem de Passo
echo -e "\e[97m• CRIANDO CONTA NO PORTAINER \e[33m[9/9]\e[0m"
echo ""
sleep 1

## Tenta criar usuário no Portainer até 4 vezes
MAX_RETRIES=4
DELAY=15  # Delay de 15 segundos entre as tentativas
CONTA_CRIADA=false

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -k -s -X POST "https://$url_portainer/api/users/admin/init" \
    -H "Content-Type: application/json" \
    -d "{\"Username\": \"$user_portainer\", \"Password\": \"$pass_portainer\"}")

  # Verificar se o campo "Username" existe na resposta
  if echo "$RESPONSE" | grep -q "\"Username\":\"$user_portainer\""; then
    echo "1/2 - [ OK ] - Conta de administrador criada com sucesso!"
    CONTA_CRIADA=true
    break
  else
    echo "Falha ao criar a conta de administrador na tentativa $i/4."
    # Se for a última tentativa, exibe mensagem de erro final
    if [ $i -eq $MAX_RETRIES ]; then
      echo "1/2 - [ OFF ] - Não foi possível criar a conta de administrador após $MAX_RETRIES tentativas."
      echo "Erro retornado: $RESPONSE"
      echo -e "\e[33mApós a conclusão da instalação, por favor, crie uma conta acessando o link do seu Portainer"
      CONTA_CRIADA=false
    fi
    sleep $DELAY
  fi
done

# Só tenta criar o token se a conta foi criada com sucesso
if [ "$CONTA_CRIADA" = true ]; then
  sleep 5
  ## Cria primeiro token do Portainer
  token=$(curl -k -s -X POST "https://$url_portainer/api/auth" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user_portainer\",\"password\":\"$pass_portainer\"}" | jq -r .jwt)

  # Verifica se o token foi gerado com sucesso
  if [ -n "$token" ] && [ "$token" != "null" ]; then
    echo "2/2 - [ OK ] - Gerando primeiro token"
  else
    echo "2/2 - [ OFF ] - Falha ao gerar o token"
    exit 1
  fi
fi

sleep 5
## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

if [ "$CONTA_CRIADA" = true ]; then
  cat > dados_portainer <<EOL
[ PORTAINER ]

Dominio do portainer: https://$url_portainer

Usuario: $user_portainer

Senha: $pass_portainer

Token: $token
EOL
else
  cat > dados_portainer <<EOL
[ PORTAINER ]

Dominio do portainer: https://$url_portainer

Usuario: Precisa criar dentro do portainer

Senha: Precisa criar dentro do portainer
EOL
fi

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ PORTAINER ]\e[0m"
echo ""

echo -e "\e[97mDominio do portainer:\e[33m https://$url_portainer\e[0m"
echo ""

if [ "$CONTA_CRIADA" = true ]; then
  echo -e "\e[97mUsuario:\e[33m $user_portainer\e[0m"
  echo ""
  echo -e "\e[97mSenha:\e[33m $pass_portainer\e[0m"
else
  echo -e "\e[97mUsuario:\e[33m Precisa criar dentro do portainer\e[0m"
  echo ""
  echo -e "\e[97mSenha:\e[33m Precisa criar dentro do portainer\e[0m"
  echo ""
  echo -e "\e[97mObservação:\e[33m Você tem menos de 5 minutos para criar uma conta no Portainer, caso\e[0m"
  echo -e "\e[33mexceda esse tempo, você precisara de voltar no menu anterior (digitando: Y)\e[0m"
  echo -e "\e[33me no menu de ferramentas digitar: \e[97mportainer.restart\e[0m"
fi
#echo ""

#echo -e "\e[97mObservação:\e[33m Você tem menos de 5 minutos para criar uma conta no Portainer, caso\e[0m"
#echo -e "\e[33mexceda esse tempo, você precisara de voltar no menu anterior (digitando: Y)\e[0m"
#echo -e "\e[33me no menu de ferramentas digitar: \e[97mportainer.restart\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗
## ██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝██╔════╝
## ██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗  ███████╗
## ██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║
## ██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║
## ╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

ferramenta_postgres() {
## Ativa a função dados para pegar os dados da vps
dados

telemetria Postgres iniciado

## Gerando uma senha aleatória para o Postgres
senha_postgres=$(openssl rand -hex 16)

## Criando a stack postgres.yaml
cat > postgres.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  postgres:
    image: postgres:14 ## Versão do postgres

    volumes:
      - postgres_data:/var/lib/postgresql/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 5432:5432

    environment:
      ## Senha do postgres
      - POSTGRES_PASSWORD=$senha_postgres
      - PG_MAX_CONNECTIONS=500

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  postgres_data:
    external: true
    name: postgres_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Postgres"
fi
STACK_NAME="postgres"
stack_editavel #> /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c postgres.yaml postgres > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Postgres."
#fi

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_postgres <<EOL
[ POSTGRES ]

Dominio do postgres: postgres://postgres:5432

Usuario: postgres

Senha: $senha_postgres
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

telemetria Postgres finalizado

}

## ██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗
## ██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝██╔════╝
## ██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗  ███████╗
## ██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║
## ██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║
## ╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
##
## ███████╗███████╗████████╗██╗   ██╗██████╗
## ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
## ███████╗█████╗     ██║   ██║   ██║██████╔╝
## ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
## ███████║███████╗   ██║   ╚██████╔╝██║
## ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝

ferramenta_postgres_setup() {

## Ativa a função dados para pegar os dados da vps
dados

## Limpar o terminal
clear
## Mostrar mensagem de Instalando
instalando_msg

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO POSTGRES \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Postgres iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO POSTGRES \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Gerando uma senha aleatória para o Postgres
senha_postgres=$(openssl rand -hex 16)

## Criando a stack postgres.yaml
cat > postgres${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  postgres${1:+_$1}:
    image: postgres:14 ## Versão do postgres

    volumes:
      - postgres${1:+_$1}_data:/var/lib/postgresql/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 2587:5432

    environment:
      ## Senha do postgres
      - POSTGRES_PASSWORD=$senha_postgres
      #- PG_MAX_CONNECTIONS=500

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  postgres${1:+_$1}_data:
    external: true
    name: postgres${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Postgres"
fi
STACK_NAME="postgres${1:+_$1}"
stack_editavel #> /dev/null 2>&1

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

wait_stack "postgres${1:+_$1}"

telemetria Postgres finalizado

#docker stack deploy --prune --resolve-image always -c postgres.yaml postgres > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Postgres."
#fi

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_postgres${1:+_$1} <<EOL
[ POSTGRES ]

Dominio do postgres: postgres://postgres${1:+_$1}:5432

Usuario: postgres

Senha: $senha_postgres
EOL

cd
cd

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ POSTGRES ]\e[0m"
echo ""

echo -e "\e[97mDominio do postgres:\e[33m postgres://postgres${1:+_$1}:5432\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m postgres\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m $senha_postgres\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  ██████╗     ██╗   ██╗███████╗ ██████╗████████╗ ██████╗ ██████╗
## ██╔══██╗██╔════╝     ██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
## ██████╔╝██║  ███╗    ██║   ██║█████╗  ██║        ██║   ██║   ██║██████╔╝
## ██╔═══╝ ██║   ██║    ╚██╗ ██╔╝██╔══╝  ██║        ██║   ██║   ██║██╔══██╗
## ██║     ╚██████╔╝     ╚████╔╝ ███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║
## ╚═╝      ╚═════╝       ╚═══╝  ╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝


ferramenta_pgvector() {

## Ativa a função dados para pegar os dados da vps
dados

telemetria PgVector iniciado

## Gerando uma senha aleatória para o Postgres
senha_pgvector=$(openssl rand -hex 16)

## Criando a stack pgvector.yaml
cat > pgvector.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  pgvector:
    image: pgvector/pgvector:pg16 ## Versão do PgVector

    volumes:
      - pgvector:/var/lib/postgresql/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 5433:5432

    environment:
      ## Senha do postgres
      - POSTGRES_PASSWORD=$senha_pgvector

      ## Maximo de Conexões
      #- PG_MAX_CONNECTIONS=500

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  pgvector:
    external: true
    name: pgvector

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do PgVector"
fi
STACK_NAME="pgvector"
stack_editavel #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do PgVector."
#fi
#docker stack deploy --prune --resolve-image always -c pgvector.yaml pgvector > /dev/null 2>&1

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_pgvector <<EOL
[ PGVECTOR ]

Dominio do pgvector: postgres://pgvector:5432

Usuario: postgres

Senha: $senha_pgvector
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

telemetria PgVector finalizado

}

## ██████╗  ██████╗     ██╗   ██╗███████╗ ██████╗████████╗ ██████╗ ██████╗
## ██╔══██╗██╔════╝     ██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
## ██████╔╝██║  ███╗    ██║   ██║█████╗  ██║        ██║   ██║   ██║██████╔╝
## ██╔═══╝ ██║   ██║    ╚██╗ ██╔╝██╔══╝  ██║        ██║   ██║   ██║██╔══██╗
## ██║     ╚██████╔╝     ╚████╔╝ ███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║
## ╚═╝      ╚═════╝       ╚═══╝  ╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
##
## ███████╗███████╗████████╗██╗   ██╗██████╗
## ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
## ███████╗█████╗     ██║   ██║   ██║██████╔╝
## ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
## ███████║███████╗   ██║   ╚██████╔╝██║
## ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝

ferramenta_pgvector_setup() {

## Ativa a função dados para pegar os dados da vps
dados

## Limpar o terminal
clear
## Mostrar mensagem de Instalando
instalando_msg

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO PGVECTOR \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria PgVector iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO PGVECTOR \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Gerando uma senha aleatória para o Postgres
senha_pgvector=$(openssl rand -hex 16)

## Criando a stack do pgvector.yaml
cat > pgvector${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  pgvector${1:+_$1}:
    image: pgvector/pgvector:pg16 ## Versão do PgVector

    volumes:
      - pgvector${1:+_$1}:/var/lib/postgresql/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 5433:5432

    environment:
      ## Senha do postgres
      - POSTGRES_PASSWORD=$senha_pgvector

      ## Maximo de Conexões
      #- PG_MAX_CONNECTIONS=500

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  pgvector${1:+_$1}:
    external: true
    name: pgvector${1:+_$1}

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do PgVector"
fi
STACK_NAME="pgvector${1:+_$1}"
stack_editavel #> /dev/null 2>&1

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

wait_stack "pgvector${1:+_$1}"

telemetria PgVector finalizado
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do PgVector."
#fi
#docker stack deploy --prune --resolve-image always -c pgvector.yaml pgvector > /dev/null 2>&1

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_pgvector${1:+_$1} <<EOL
[ PGVECTOR ]

Dominio do pgvector: postgres://pgvector${1:+_$1}:5432

Usuario: postgres

Senha: $senha_pgvector
EOL

cd
cd

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ PGVECTOR ]\e[0m"
echo ""

echo -e "\e[97mDominio do PgVector:\e[33m postgres://pgvector${1:+_$1}:5432\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m postgres\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m $senha_pgvector\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

cd
cd

}

## ██████╗ ███████╗██████╗ ██╗███████╗
## ██╔══██╗██╔════╝██╔══██╗██║██╔════╝
## ██████╔╝█████╗  ██║  ██║██║███████╗
## ██╔══██╗██╔══╝  ██║  ██║██║╚════██║
## ██║  ██║███████╗██████╔╝██║███████║
## ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝

ferramenta_redis() {

## Ativa a função dados para pegar os dados da vps
dados

telemetria Redis iniciado

## Criando a stack do redis.yaml
cat > redis.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  redis:
    image: redis:latest  ## Versão do Redis
    command: [
        "redis-server",
        "--appendonly",
        "yes",
        "--port",
        "6379"
      ]

    volumes:
      - redis_data:/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 6379:6379

    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 2048M

## --------------------------- ORION --------------------------- ##

volumes:
  redis_data:
    external: true
    name: redis_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Redis"
fi
STACK_NAME="redis"
stack_editavel #> /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c redis.yaml redis
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Redis."
#fi

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_redis <<EOL
[ REDIS ]

Dominio do Redis: redis://redis:6379

Usuario: redis

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

telemetria Redis finalizado

}

## ██████╗ ███████╗██████╗ ██╗███████╗
## ██╔══██╗██╔════╝██╔══██╗██║██╔════╝
## ██████╔╝█████╗  ██║  ██║██║███████╗
## ██╔══██╗██╔══╝  ██║  ██║██║╚════██║
## ██║  ██║███████╗██████╔╝██║███████║
## ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝
##
## ███████╗███████╗████████╗██╗   ██╗██████╗
## ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
## ███████╗█████╗     ██║   ██║   ██║██████╔╝
## ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
## ███████║███████╗   ██║   ╚██████╔╝██║
## ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝

ferramenta_redis_setup() {

## Ativa a função dados para pegar os dados da vps
dados

## Limpar o terminal
clear
## Mostrar mensagem de Instalando
instalando_msg

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO REDIS \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Redis iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO REDIS \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack do redis.yaml
cat > redis${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  redis${1:+_$1}:
    image: redis:latest  ## Versão do Redis
    command: [
        "redis-server",
        "--appendonly",
        "yes",
        "--port",
        "6379"
      ]

    volumes:
      - redis${1:+_$1}_data:/data

    ## Descomente as linhas abaixo para uso externo
    networks:
      - $nome_rede_interna ## Nome da rede interna

    #ports:
    #  - 6379:6379

    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 2048M

## --------------------------- ORION --------------------------- ##

volumes:
  redis${1:+_$1}_data:
    external: true
    name: redis${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Ops, não foi criar a stack do Redis."
fi
sleep 1
STACK_NAME="redis${1:+_$1}"
stack_editavel

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

wait_stack "redis${1:+_$1}"

telemetria Redis finalizado

#stack_editavel > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c redis.yaml redis
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Redis."
#fi

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_redis${1:+_$1} <<EOL
[ REDIS ]

Dominio do Redis: redis://redis${1:+_$1}:6379

Usuario: redis

EOL

cd
cd

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ REDIS ]\e[0m"
echo ""

echo -e "\e[97mHost:\e[33m redis${1:+_$1}\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m redis\e[0m"
echo ""

echo -e "\e[97mPorta:\e[33m 6379\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

cd
cd

}

## ███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗
## ████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║
## ██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║
## ██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║
## ██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗
## ╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝

ferramenta_mysql() {

## Ativa a função dados para pegar os dados da vps
dados

telemetria MySQL iniciado

## Gerando uma senha aleatória para o Mysql
senha_mysql=$(openssl rand -hex 16)

## Criando a stack do mysql.yaml
cat > mysql.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  mysql:
    image: percona/percona-server:8.0 ## Versão do MySQL
    command:
      [
        "--character-set-server=utf8mb4",
        "--collation-server=utf8mb4_general_ci",
        "--sql-mode=",
        "--default-authentication-plugin=caching_sha2_password",
        "--max-allowed-packet=512MB",
      ]

    volumes:
      - mysql_data:/var/lib/mysql

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 3306:3306

    environment:
      ## Senha do MYSQL
      - MYSQL_ROOT_PASSWORD=$senha_mysql

      ## TimeZone
      - TZ=America/Sao_Paulo

    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  mysql_data:
    external: true
    name: mysql_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do MySQL"
fi

STACK_NAME="mysql"
stack_editavel #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Postgres."
#fi

wait_stack "mysql${1:+_$1}"

#docker stack deploy --prune --resolve-image always -c mysql.yaml mysql #> /dev/null 2>&1

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_mysql <<EOL
[ MYSQL ]

Dominio do mysql: mysql

Usuario: root

Senha: $senha_mysql
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

telemetria MySQL finalizado

}

## ███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗
## ████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║
## ██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║
## ██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║
## ██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗
## ╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝
##
## ███████╗███████╗████████╗██╗   ██╗██████╗
## ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
## ███████╗█████╗     ██║   ██║   ██║██████╔╝
## ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
## ███████║███████╗   ██║   ╚██████╔╝██║
## ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝
ferramenta_mysql_setup() {

## Ativa a função dados para pegar os dados da vps
dados

## Limpar o terminal
clear
## Mostrar mensagem de Instalando
instalando_msg

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MYSQL \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria MySQL iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MYSQL \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Gerando uma senha aleatória para o Mysql
senha_mysql=$(openssl rand -hex 16)

## Criando a stack do mysql.yaml
cat > mysql${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  mysql${1:+_$1}:
    image: percona/percona-server:8.0 ## Versão do MySQL
    command:
      [
        "--character-set-server=utf8mb4",
        "--collation-server=utf8mb4_general_ci",
        "--sql-mode=",
        "--default-authentication-plugin=caching_sha2_password",
        "--max-allowed-packet=512MB",
      ]

    volumes:
      - mysql${1:+_$1}_data:/var/lib/mysql

    networks:
      - $nome_rede_interna ## Nome da rede interna

    ## Descomente as linhas abaixo para uso externo
    #ports:
    #  - 3306:3306

    environment:
      ## Senha do MYSQL
      - MYSQL_ROOT_PASSWORD=$senha_mysql

      ## TimeZone
      - TZ=America/Sao_Paulo

    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  mysql${1:+_$1}_data:
    external: true
    name: mysql${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Ops, não foi criar a stack do Mysql."
fi

STACK_NAME="mysql"

stack_editavel

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

wait_stack "mysql" > /dev/null 2>&1

telemetria MySQL finalizado
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Ops, não foi possivel subir a stack do Postgres."
#fi

#docker stack deploy --prune --resolve-image always -c mysql.yaml mysql #> /dev/null 2>&1

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_mysql${1:+_$1} <<EOL
[ MYSQL ]

Dominio do mysql: mysql${1:+_$1}

Usuario: mysql ou root

Senha: $senha_mysql
EOL

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MYSQL ]\e[0m"
echo ""

echo -e "\e[97mHost:\e[33m mysql${1:+_$1}\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m root\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m $senha_mysql\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗██╗  ██╗ █████╗ ████████╗██╗    ██╗ ██████╗  ██████╗ ████████╗
## ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔═══██╗╚══██╔══╝
## ██║     ███████║███████║   ██║   ██║ █╗ ██║██║   ██║██║   ██║   ██║
## ██║     ██╔══██║██╔══██║   ██║   ██║███╗██║██║   ██║██║   ██║   ██║
## ╚██████╗██║  ██║██║  ██║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝   ██║
##  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝    ╚═╝

ferramenta_chatwoot() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_chatwoot

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o Dominio para o Chatwoot (ex: chatwoot.oriondesign.art.br): \e[0m" && read -r url_chatwoot
    echo ""

    ## Pega o nome do dominio para ser o nome da empresa
    nome_empresa_chatwoot="$nome_servidor"

    ## Pergunta o email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_admin_chatwoot
    echo ""

    ## Define o dominio SMTP com o dominio do email
    dominio_smtp_chatwoot=$(echo "$email_admin_chatwoot" | cut -d "@" -f 2)

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_chatwoot
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_chatwoot
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_chatwoot
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_chatwoot


    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_chatwoot" -eq 465 ]; then
     sobre_ssl=true
    else
     sobre_ssl=false
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_chatwoot

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Chatwoot:\e[97m $url_chatwoot\e[0m"
    echo ""

    ## Informação sobre Nome da Empresa
    echo -e "\e[33mNome da Empresa:\e[97m $nome_empresa_chatwoot\e[0m"
    echo ""

    ## Informação sobre Email de SMTP
    echo -e "\e[33mEmail do SMTP:\e[97m $email_admin_chatwoot\e[0m"
    echo ""

    ## Informação sobre Usuario do SMTP
    echo -e "\e[33mUser do SMTP:\e[97m $user_smtp_chatwoot\e[0m"
    echo ""

    ## Informação sobre Senha de SMTP
    echo -e "\e[33mSenha do SMTP:\e[97m $senha_email_chatwoot\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP:\e[97m $smtp_email_chatwoot\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_chatwoot\e[0m"
    echo ""
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_chatwoot

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO CHATWOOT \e[33m[1/7]\e[0m"
echo ""
sleep 1

telemetria Chatwoot iniciado

## Ativa a função dados para pegar os dados da vps
dados

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/7]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "chatwoot${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "chatwoot${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/7]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO CHATWOOT \e[33m[4/7]\e[0m"
echo ""
sleep 1

## Neste passo vamos estar criando a Stack yaml do Chatwoot na pasta /root/
## Isso possibilitará que o usuario consiga edita-lo posteriormente

## Depois vamos instalar o Chatwoot e verificar se esta tudo certo.

## Criando key aleatória
encryption_key=$(openssl rand -hex 16)

## Criando a stack chatwoot.yaml
cat > chatwoot${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  chatwoot${1:+_$1}_app:
    image: chatwoot/chatwoot:latest ## Versão do Chatwoot
    command: bundle exec rails s -p 3000 -b 0.0.0.0
    entrypoint: docker/entrypoints/rails.sh

    volumes:
      - chatwoot${1:+_$1}_storage:/app/storage ## Arquivos de conversa
      - chatwoot${1:+_$1}_public:/app/public ## Arquivos de logos
      - chatwoot${1:+_$1}_mailer:/app/app/views/devise/mailer ## Arquivos de email
      - chatwoot${1:+_$1}_mailers:/app/app/views/mailers ## Arquivos de emails

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Qualquer Url com # no final
      - CHATWOOT_HUB_URL=https://oriondesign.art.br/setup#

      ## Nome da Empresa
      - INSTALLATION_NAME=$nome_empresa_chatwoot

      ## Secret key
      - SECRET_KEY_BASE=$encryption_key

      ## Url Chatwoot
      - FRONTEND_URL=https://$url_chatwoot
      - FORCE_SSL=true

      ## Idioma/Localização padrão
      - DEFAULT_LOCALE=pt_BR
      - TZ=America/Brasil

      ## Google Cloud - Modifique de acordo com os seus dados (lembre-se de mudar no chatwoot_sidekiq)
      #- GOOGLE_OAUTH_CLIENT_ID=369777777777-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com
      #- GOOGLE_OAUTH_CLIENT_SECRET=ABCDEF-GHijklmnoPqrstuvwX-yz1234567
      #- GOOGLE_OAUTH_CALLBACK_URL=https://<your-server-domain>/omniauth/google_oauth2/callback

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379

      ## Dados do Postgres
      - POSTGRES_HOST=postgres
      - POSTGRES_USERNAME=postgres
      - POSTGRES_PASSWORD=$senha_postgres ## Senha do postgres
      - POSTGRES_DATABASE=chatwoot${1:+_$1}

      ## Armazenamento
      - ACTIVE_STORAGE_SERVICE=local ## use s3_compatible para MinIO
      #- STORAGE_BUCKET_NAME=chatwoot${1:+_$1}
      #- STORAGE_ACCESS_KEY_ID=ACCESS_KEY_MINIO
      #- STORAGE_SECRET_ACCESS_KEY=SECRET_KEY_MINIO
      #- STORAGE_REGION=eu-south
      #- STORAGE_ENDPOINT=https://s3.DOMINIO.COM
      #- STORAGE_FORCE_PATH_STYLE=true

      ## Dados do SMTP
      - MAILER_SENDER_EMAIL=$email_admin_chatwoot <$email_admin_chatwoot> ## Email SMTP
      - SMTP_DOMAIN=$dominio_smtp_chatwoot ## Dominio do email
      - SMTP_ADDRESS=$smtp_email_chatwoot ## Host SMTP
      - SMTP_PORT=$porta_smtp_chatwoot ## Porta SMTP
      - SMTP_SSL=$sobre_ssl ## Se a porta for 465 = true | Se a porta for 587 = false
      - SMTP_USERNAME=$user_smtp_chatwoot ## Usuario SMTP
      - SMTP_PASSWORD=$senha_email_chatwoot ## Senha do SMTP
      - SMTP_AUTHENTICATION=login
      - SMTP_ENABLE_STARTTLS_AUTO=true
      - SMTP_OPENSSL_VERIFY_MODE=peer
      - MAILER_INBOUND_EMAIL_DOMAIN=$email_admin_chatwoot ## Email SMTP

      ## Melhorias
      - SIDEKIQ_CONCURRENCY=10
      - RACK_TIMEOUT_SERVICE_TIMEOUT=0
      - RAILS_MAX_THREADS=5
      - WEB_CONCURRENCY=2
      - ENABLE_RACK_ATTACK=false

      ## Outras configurações
      - NODE_ENV=production
      - RAILS_ENV=production
      - INSTALLATION_ENV=docker
      - RAILS_LOG_TO_STDOUT=true
      - USE_INBOX_AVATAR_FOR_BOT=true
      - ENABLE_ACCOUNT_SIGNUP=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.chatwoot${1:+_$1}_app.rule=Host(\`$url_chatwoot\`)
        - traefik.http.routers.chatwoot${1:+_$1}_app.entrypoints=websecure
        - traefik.http.routers.chatwoot${1:+_$1}_app.tls.certresolver=letsencryptresolver
        - traefik.http.routers.chatwoot${1:+_$1}_app.priority=1
        - traefik.http.routers.chatwoot${1:+_$1}_app.service=chatwoot${1:+_$1}_app
        - traefik.http.services.chatwoot${1:+_$1}_app.loadbalancer.server.port=3000
        - traefik.http.services.chatwoot${1:+_$1}_app.loadbalancer.passhostheader=true
        - traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https
        - traefik.http.routers.chatwoot${1:+_$1}_app.middlewares=sslheader@docker

## --------------------------- ORION --------------------------- ##

  chatwoot${1:+_$1}_sidekiq:
    image: chatwoot/chatwoot:latest ## Versão do Chatwoot
    command: bundle exec sidekiq -C config/sidekiq.yml

    volumes:
      - chatwoot${1:+_$1}_storage:/app/storage ## Arquivos de conversa
      - chatwoot${1:+_$1}_public:/app/public ## Arquivos de logos
      - chatwoot${1:+_$1}_mailer:/app/app/views/devise/mailer ## Arquivos de email
      - chatwoot${1:+_$1}_mailers:/app/app/views/mailers ## Arquivos de emails

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Qualquer Url com # no final
      - CHATWOOT_HUB_URL=https://oriondesign.art.br/setup#

      ## Nome da Empresa
      - INSTALLATION_NAME=$nome_empresa_chatwoot

      ## Secret key
      - SECRET_KEY_BASE=$encryption_key

      ## Url Chatwoot
      - FRONTEND_URL=https://$url_chatwoot
      - FORCE_SSL=true

      ## Idioma/Localização padrão
      - DEFAULT_LOCALE=pt_BR
      - TZ=America/Brasil

      ## Google Cloud - Modifique de acordo com os seus dados (lembre-se de mudar no chatwoot_sidekiq)
      #- GOOGLE_OAUTH_CLIENT_ID=369777777777-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com
      #- GOOGLE_OAUTH_CLIENT_SECRET=ABCDEF-GHijklmnoPqrstuvwX-yz1234567
      #- GOOGLE_OAUTH_CALLBACK_URL=https://<your-server-domain>/omniauth/google_oauth2/callback

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379

      ## Dados do Postgres
      - POSTGRES_HOST=postgres
      - POSTGRES_USERNAME=postgres
      - POSTGRES_PASSWORD=$senha_postgres ## Senha do postgres
      - POSTGRES_DATABASE=chatwoot${1:+_$1}

      ## Armazenamento
      - ACTIVE_STORAGE_SERVICE=local ## use s3_compatible para MinIO
      #- STORAGE_BUCKET_NAME=chatwoot${1:+_$1}
      #- STORAGE_ACCESS_KEY_ID=ACCESS_KEY_MINIO
      #- STORAGE_SECRET_ACCESS_KEY=SECRET_KEY_MINIO
      #- STORAGE_REGION=eu-south
      #- STORAGE_ENDPOINT=https://s3.DOMINIO.COM
      #- STORAGE_FORCE_PATH_STYLE=true

      ## Dados do SMTP
      - MAILER_SENDER_EMAIL=$email_admin_chatwoot <$email_admin_chatwoot> ## Email SMTP
      - SMTP_DOMAIN=$dominio_smtp_chatwoot ## Dominio do email
      - SMTP_ADDRESS=$smtp_email_chatwoot ## Host SMTP
      - SMTP_PORT=$porta_smtp_chatwoot ## Porta SMTP
      - SMTP_SSL=$sobre_ssl ## Se a porta for 465 = true | Se a porta for 587 = false
      - SMTP_USERNAME=$user_smtp_chatwoot ## Usuario SMTP
      - SMTP_PASSWORD=$senha_email_chatwoot ## Senha do SMTP
      - SMTP_AUTHENTICATION=login
      - SMTP_ENABLE_STARTTLS_AUTO=true
      - SMTP_OPENSSL_VERIFY_MODE=peer
      - MAILER_INBOUND_EMAIL_DOMAIN=$email_admin_chatwoot ## Email SMTP

      ## Melhorias
      - SIDEKIQ_CONCURRENCY=10
      - RACK_TIMEOUT_SERVICE_TIMEOUT=0
      - RAILS_MAX_THREADS=5
      - WEB_CONCURRENCY=2
      - ENABLE_RACK_ATTACK=false

      ## Outras configurações
      - NODE_ENV=production
      - RAILS_ENV=production
      - INSTALLATION_ENV=docker
      - RAILS_LOG_TO_STDOUT=true
      - USE_INBOX_AVATAR_FOR_BOT=true
      - ENABLE_ACCOUNT_SIGNUP=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  chatwoot${1:+_$1}_storage:
    external: true
    name: chatwoot${1:+_$1}_storage
  chatwoot${1:+_$1}_public:
    external: true
    name: chatwoot${1:+_$1}_public
  chatwoot${1:+_$1}_mailer:
    external: true
    name: chatwoot${1:+_$1}_mailer
  chatwoot${1:+_$1}_mailers:
    external: true
    name: chatwoot${1:+_$1}_mailers

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Chatwoot"
fi
STACK_NAME="chatwoot${1:+_$1}"
stack_editavel #> /dev/null 2>&1

#docker stack deploy --prune --resolve-image always -c chatwoot.yaml chatwoot > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Chatwoot"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/7]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_chatwoot para verificar se o serviço esta online
wait_stack "chatwoot${1:+_$1}"

telemetria Chatwoot finalizado
## Mensagem de Passo
echo -e "\e[97m• MIGRANDO BANCO DE DADOS \e[33m[6/7]\e[0m"
echo ""
sleep 1

## Aqui vamos estar migrando o banco de dados usando o comando "bundle exec rails db:chatwoot_prepare"

## Basicamente voce poderia entrar no banco de dados do chatwoot e executar o comando por lá tambem

container_name="chatwoot${1:+_$1}_chatwoot${1:+_$1}_app"

max_wait_time=1200

wait_interval=60

elapsed_time=0

while [ $elapsed_time -lt $max_wait_time ]; do
  CONTAINER_ID=$(docker ps -q --filter "name=$container_name")
  if [ -n "$CONTAINER_ID" ]; then
    break
  fi
  sleep $wait_interval
  elapsed_time=$((elapsed_time + wait_interval))
done

if [ -z "$CONTAINER_ID" ]; then
  echo "O contêiner não foi encontrado após $max_wait_time segundos."
  exit 1
fi

docker exec -it "$CONTAINER_ID" bundle exec rails db:chatwoot_prepare > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Executando no container: bundle exec rails db:chatwoot_prepare"
else
    echo "1/1 - [ OFF ] - Executando no container: bundle exec rails db:chatwoot_prepare"
    echo "Não foi possivel migrar o banco de dados"
fi

echo ""
## Mensagem de Passo
echo -e "\e[97m• ATIVANDO FUNÇÕES DO SUPER ADMIN \e[33m[7/7]\e[0m"
echo ""
sleep 1

##  Aqui vamos alterar um dado no postgres para liberar algumas funções ocultas no painel de super admin
wait_for_postgres

docker exec -i $CONTAINER_ID psql -U postgres <<EOF > /dev/null 2>&1
\c chatwoot;
update installation_configs set locked = false;
\q
EOF
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Desbloqueando tabela installation_configs no postgres"
else
    echo "1/1 - [ OFF ] - Desbloqueando tabela installation_configs no postgres"
    echo "Não foi possivel liberar as funções do super_admin"
fi

echo ""

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_chatwoot${1:+_$1} <<EOL
[ CHATWOOT ]

Dominio do Chatwoot: https://$url_chatwoot

Usuario: Precisa criar dentro do Chatwoot

Senha: Precisa criar dentro do Chatwoot
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ CHATWOOT ]\e[0m"
echo ""

echo -e "\e[97mDominio:\e[33m https://$url_chatwoot\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m Precisa criar dentro do Chatwoot\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m Precisa criar dentro do Chatwoot\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗ ██████╗ ██╗
## ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║
## █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ███████║██████╔╝██║
## ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██╔═══╝ ██║
## ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║██║     ██║
## ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_evolution() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_evolution

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o Dominio para a Evolution API (ex: api.oriondesign.art.br): \e[0m" && read -r url_evolution
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_evolution

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da Evolution API:\e[97m $url_evolution\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_evolution

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA EVOLUTION API \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria "Evolution API" "iniciado"

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres Instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "evolution${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "evolution${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO A EVOLUTION API \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Aqui de fato vamos iniciar a instalação da Evolution API

## Criando uma Global Key Aleatória
apikeyglobal=$(openssl rand -hex 16)

## Criando a stack evolution.yaml
cat > evolution${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  evolution${1:+_$1}:
    image: atendai/evolution-api:latest ## Versão da Evolution API

    volumes:
      - evolution${1:+_$1}_instances:/evolution/instances

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Configurações Gerais
      - SERVER_URL=https://$url_evolution
      - AUTHENTICATION_API_KEY=$apikeyglobal
      - AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true
      - DEL_INSTANCE=false
      - QRCODE_LIMIT=1902
      - LANGUAGE=pt-BR

      ## Configuração do Cliente
      ## Pegue a versão em: https://wppconnect.io/pt-BR/whatsapp-versions/
      - CONFIG_SESSION_PHONE_VERSION=2.3000.1015901307
      - CONFIG_SESSION_PHONE_CLIENT=OrionDesign
      - CONFIG_SESSION_PHONE_NAME=Chrome

      ## Configuração do Banco de Dados
      - DATABASE_ENABLED=true
      - DATABASE_PROVIDER=postgresql
      - DATABASE_CONNECTION_URI=postgresql://postgres:$senha_postgres@postgres:5432/evolution${1:+_$1}
      - DATABASE_CONNECTION_CLIENT_NAME=evolution${1:+_$1}
      - DATABASE_SAVE_DATA_INSTANCE=true
      - DATABASE_SAVE_DATA_NEW_MESSAGE=true
      - DATABASE_SAVE_MESSAGE_UPDATE=true
      - DATABASE_SAVE_DATA_CONTACTS=true
      - DATABASE_SAVE_DATA_CHATS=true
      - DATABASE_SAVE_DATA_LABELS=true
      - DATABASE_SAVE_DATA_HISTORIC=true

      ## Integração com OpenAI
      - OPENAI_ENABLED=true

      ## Integração com Dify
      - DIFY_ENABLED=true

      ## Integração com Typebot
      - TYPEBOT_ENABLED=true
      - TYPEBOT_API_VERSION=latest

      ## Integração com Chatwoot
      - CHATWOOT_ENABLED=true
      - CHATWOOT_MESSAGE_READ=true
      - CHATWOOT_MESSAGE_DELETE=true
      - CHATWOOT_IMPORT_DATABASE_CONNECTION_URI=postgresql://postgres:$senha_postgres@postgres:5432/chatwoot?sslmode=disable
      - CHATWOOT_IMPORT_PLACEHOLDER_MEDIA_MESSAGE=false

      ## Configuração do Cache
      - CACHE_REDIS_ENABLED=true
      - CACHE_REDIS_URI=redis://redis:6379/8
      - CACHE_REDIS_PREFIX_KEY=evolution
      - CACHE_REDIS_SAVE_INSTANCES=false
      - CACHE_LOCAL_ENABLED=false

      ## Configuração do S3
      - S3_ENABLED=false
      - S3_ACCESS_KEY=
      - S3_SECRET_KEY=
      - S3_BUCKET=evolution
      - S3_PORT=443
      - S3_ENDPOINT=
      - S3_USE_SSL=true
      #- S3_REGION=eu-south

      ## Configuração do WhatsApp Business
      - WA_BUSINESS_TOKEN_WEBHOOK=evolution
      - WA_BUSINESS_URL=https://graph.facebook.com
      - WA_BUSINESS_VERSION=v20.0
      - WA_BUSINESS_LANGUAGE=pt_BR

      ## Telemetria
      - TELEMETRY=false
      - TELEMETRY_URL=

      ## Configuração do WebSocket
      - WEBSOCKET_ENABLED=false
      - WEBSOCKET_GLOBAL_EVENTS=false

      ## Configuração do SQS
      - SQS_ENABLED=false
      - SQS_ACCESS_KEY_ID=
      - SQS_SECRET_ACCESS_KEY=
      - SQS_ACCOUNT_ID=
      - SQS_REGION=

      ## Configuração do RabbitMQ
      - RABBITMQ_ENABLED=false
      - RABBITMQ_URI=amqp://USER:PASS@rabbitmq:5672/evolution${1:+_$1}
      - RABBITMQ_EXCHANGE_NAME=evolution
      - RABBITMQ_GLOBAL_ENABLED=false
      - RABBITMQ_EVENTS_APPLICATION_STARTUP=false
      - RABBITMQ_EVENTS_INSTANCE_CREATE=false
      - RABBITMQ_EVENTS_INSTANCE_DELETE=false
      - RABBITMQ_EVENTS_QRCODE_UPDATED=false
      - RABBITMQ_EVENTS_MESSAGES_SET=false
      - RABBITMQ_EVENTS_MESSAGES_UPSERT=true
      - RABBITMQ_EVENTS_MESSAGES_EDITED=false
      - RABBITMQ_EVENTS_MESSAGES_UPDATE=false
      - RABBITMQ_EVENTS_MESSAGES_DELETE=false
      - RABBITMQ_EVENTS_SEND_MESSAGE=false
      - RABBITMQ_EVENTS_CONTACTS_SET=false
      - RABBITMQ_EVENTS_CONTACTS_UPSERT=false
      - RABBITMQ_EVENTS_CONTACTS_UPDATE=false
      - RABBITMQ_EVENTS_PRESENCE_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_SET=false
      - RABBITMQ_EVENTS_CHATS_UPSERT=false
      - RABBITMQ_EVENTS_CHATS_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_DELETE=false
      - RABBITMQ_EVENTS_GROUPS_UPSERT=false
      - RABBITMQ_EVENTS_GROUP_UPDATE=false
      - RABBITMQ_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - RABBITMQ_EVENTS_CONNECTION_UPDATE=true
      - RABBITMQ_EVENTS_CALL=false
      - RABBITMQ_EVENTS_TYPEBOT_START=false
      - RABBITMQ_EVENTS_TYPEBOT_CHANGE_STATUS=false

      ## Configuração do Webhook
      - WEBHOOK_GLOBAL_ENABLED=false
      - WEBHOOK_GLOBAL_URL=
      - WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
      - WEBHOOK_EVENTS_APPLICATION_STARTUP=false
      - WEBHOOK_EVENTS_QRCODE_UPDATED=false
      - WEBHOOK_EVENTS_MESSAGES_SET=false
      - WEBHOOK_EVENTS_MESSAGES_UPSERT=false
      - WEBHOOK_EVENTS_MESSAGES_EDITED=false
      - WEBHOOK_EVENTS_MESSAGES_UPDATE=false
      - WEBHOOK_EVENTS_MESSAGES_DELETE=false
      - WEBHOOK_EVENTS_SEND_MESSAGE=false
      - WEBHOOK_EVENTS_CONTACTS_SET=false
      - WEBHOOK_EVENTS_CONTACTS_UPSERT=false
      - WEBHOOK_EVENTS_CONTACTS_UPDATE=false
      - WEBHOOK_EVENTS_PRESENCE_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_SET=false
      - WEBHOOK_EVENTS_CHATS_UPSERT=false
      - WEBHOOK_EVENTS_CHATS_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_DELETE=false
      - WEBHOOK_EVENTS_GROUPS_UPSERT=false
      - WEBHOOK_EVENTS_GROUPS_UPDATE=false
      - WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - WEBHOOK_EVENTS_CONNECTION_UPDATE=false
      - WEBHOOK_EVENTS_LABELS_EDIT=false
      - WEBHOOK_EVENTS_LABELS_ASSOCIATION=false
      - WEBHOOK_EVENTS_CALL=false
      - WEBHOOK_EVENTS_TYPEBOT_START=false
      - WEBHOOK_EVENTS_TYPEBOT_CHANGE_STATUS=false
      - WEBHOOK_EVENTS_ERRORS=false
      - WEBHOOK_EVENTS_ERRORS_WEBHOOK=

      ## Configuração do Provider
      - PROVIDER_ENABLED=false
      - PROVIDER_HOST=127.0.0.1
      - PROVIDER_PORT=5656
      - PROVIDER_PREFIX=evolution${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
      - traefik.enable=1
      - traefik.http.routers.evolution${1:+_$1}.rule=Host(\`$url_evolution\`) ## Url da Evolution API
      - traefik.http.routers.evolution${1:+_$1}.entrypoints=websecure
      - traefik.http.routers.evolution${1:+_$1}.priority=1
      - traefik.http.routers.evolution${1:+_$1}.tls.certresolver=letsencryptresolver
      - traefik.http.routers.evolution${1:+_$1}.service=evolution${1:+_$1}
      - traefik.http.services.evolution${1:+_$1}.loadbalancer.server.port=8080
      - traefik.http.services.evolution${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  evolution${1:+_$1}_instances:
    external: true
    name: evolution${1:+_$1}_instances

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Evolution API"
fi
STACK_NAME="evolution${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c evolution.yaml evolution > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da Evolution API"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_evolution para verificar se o serviço esta online
wait_stack "evolution${1:+_$1}"

telemetria "Evolution API" "finalizado"

cd dados_vps

cat > dados_evolution${1:+_$1} <<EOL
[ EVOLUTION API ]

Manager Evolution: https://$url_evolution/manager

URL: https://$url_evolution

Global API Key: $apikeyglobal
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ EVOLUTION API ]\e[0m"
echo ""

echo -e "\e[97mLink do Manager:\e[33m https://$url_evolution/manager\e[0m"
echo ""

echo -e "\e[97mAPI URL:\e[33m https://$url_evolution\e[0m"
echo ""

echo -e "\e[97mGLOBAL API KEY:\e[33m $apikeyglobal\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗ ██████╗ ██╗
## ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██║
## █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ███████║██████╔╝██║
## ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██╔═══╝ ██║
## ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║██║     ██║
## ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝     ╚═╝
##
## ██╗     ██╗████████╗███████╗
## ██║     ██║╚══██╔══╝██╔════╝
## ██║     ██║   ██║   █████╗
## ██║     ██║   ██║   ██╔══╝
## ███████╗██║   ██║   ███████╗
## ╚══════╝╚═╝   ╚═╝   ╚══════╝

ferramenta_evolution_lite() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_evolution_lite

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o Dominio para a Evolution API Lite (ex: api.oriondesign.art.br): \e[0m" && read -r url_evolution
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_evolution_lite

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da Evolution API:\e[97m $url_evolution\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_evolution_lite

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA EVOLUTION API LITE \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria "Evolution API" "iniciado"

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres Instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "evolution${1:+_$1}_lite"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "evolution${1:+_$1}_lite"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO A EVOLUTION API \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Aqui de fato vamos iniciar a instalação da Evolution API

## Criando uma Global Key Aleatória
apikeyglobal=$(openssl rand -hex 16)

## Criando a stack evolution.yaml
cat > evolution${1:+_$1}_lite.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  evolution${1:+_$1}_lite:
    image: atendai/evolution-api-lite:latest ## Versão da Evolution API
    entrypoint: ["/bin/bash", "-c", ". ./Docker/scripts/deploy_database.sh && npm run start:prod" ]

    volumes:
      - evolution${1:+_$1}_lite_instances:/evolution/instances

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Configurações Gerais
      - SERVER_URL=https://$url_evolution
      - AUTHENTICATION_API_KEY=$apikeyglobal
      - AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true
      - DEL_INSTANCE=false
      - QRCODE_LIMIT=1902
      - LANGUAGE=pt-BR

      ## Configuração do Cliente
      ## Pegue a versão em: https://wppconnect.io/pt-BR/whatsapp-versions/
      - CONFIG_SESSION_PHONE_VERSION=2.3000.1015901307
      - CONFIG_SESSION_PHONE_CLIENT=OrionDesign
      - CONFIG_SESSION_PHONE_NAME=Chrome

      ## Configuração do Banco de Dados
      - DATABASE_ENABLED=true
      - DATABASE_PROVIDER=postgresql
      - DATABASE_CONNECTION_URI=postgresql://postgres:$senha_postgres@postgres:5432/evolution${1:+_$1}_lite
      - DATABASE_CONNECTION_CLIENT_NAME=evolution${1:+_$1}_lite
      - DATABASE_SAVE_DATA_INSTANCE=true
      - DATABASE_SAVE_DATA_NEW_MESSAGE=true
      - DATABASE_SAVE_MESSAGE_UPDATE=true
      - DATABASE_SAVE_DATA_CONTACTS=true
      - DATABASE_SAVE_DATA_CHATS=true
      - DATABASE_SAVE_DATA_LABELS=true
      - DATABASE_SAVE_DATA_HISTORIC=true

      ## Configuração do Cache
      - CACHE_REDIS_ENABLED=true
      - CACHE_REDIS_URI=redis://redis:6379/8
      - CACHE_REDIS_PREFIX_KEY=evolution
      - CACHE_REDIS_SAVE_INSTANCES=false
      - CACHE_LOCAL_ENABLED=false

      ## Configuração do S3
      - S3_ENABLED=false
      - S3_ACCESS_KEY=
      - S3_SECRET_KEY=
      - S3_BUCKET=evolution
      - S3_PORT=443
      - S3_ENDPOINT=
      - S3_USE_SSL=true
      #- S3_REGION=eu-south

      ## Configuração do WhatsApp Business
      - WA_BUSINESS_TOKEN_WEBHOOK=evolution
      - WA_BUSINESS_URL=https://graph.facebook.com
      - WA_BUSINESS_VERSION=v20.0
      - WA_BUSINESS_LANGUAGE=pt_BR

      ## Telemetria
      - TELEMETRY=false
      - TELEMETRY_URL=

      ## Configuração do WebSocket
      - WEBSOCKET_ENABLED=false
      - WEBSOCKET_GLOBAL_EVENTS=false

      ## Configuração do SQS
      - SQS_ENABLED=false
      - SQS_ACCESS_KEY_ID=
      - SQS_SECRET_ACCESS_KEY=
      - SQS_ACCOUNT_ID=
      - SQS_REGION=

      ## Configuração do RabbitMQ
      - RABBITMQ_ENABLED=false
      - RABBITMQ_URI=amqp://USER:PASS@rabbitmq:5672/evolution${1:+_$1}
      - RABBITMQ_EXCHANGE_NAME=evolution
      - RABBITMQ_GLOBAL_ENABLED=false
      - RABBITMQ_EVENTS_APPLICATION_STARTUP=false
      - RABBITMQ_EVENTS_INSTANCE_CREATE=false
      - RABBITMQ_EVENTS_INSTANCE_DELETE=false
      - RABBITMQ_EVENTS_QRCODE_UPDATED=false
      - RABBITMQ_EVENTS_MESSAGES_SET=false
      - RABBITMQ_EVENTS_MESSAGES_UPSERT=true
      - RABBITMQ_EVENTS_MESSAGES_EDITED=false
      - RABBITMQ_EVENTS_MESSAGES_UPDATE=false
      - RABBITMQ_EVENTS_MESSAGES_DELETE=false
      - RABBITMQ_EVENTS_SEND_MESSAGE=false
      - RABBITMQ_EVENTS_CONTACTS_SET=false
      - RABBITMQ_EVENTS_CONTACTS_UPSERT=false
      - RABBITMQ_EVENTS_CONTACTS_UPDATE=false
      - RABBITMQ_EVENTS_PRESENCE_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_SET=false
      - RABBITMQ_EVENTS_CHATS_UPSERT=false
      - RABBITMQ_EVENTS_CHATS_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_DELETE=false
      - RABBITMQ_EVENTS_GROUPS_UPSERT=false
      - RABBITMQ_EVENTS_GROUP_UPDATE=false
      - RABBITMQ_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - RABBITMQ_EVENTS_CONNECTION_UPDATE=true
      - RABBITMQ_EVENTS_CALL=false
      - RABBITMQ_EVENTS_TYPEBOT_START=false
      - RABBITMQ_EVENTS_TYPEBOT_CHANGE_STATUS=false

      ## Configuração do Webhook
      - WEBHOOK_GLOBAL_ENABLED=false
      - WEBHOOK_GLOBAL_URL=
      - WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
      - WEBHOOK_EVENTS_APPLICATION_STARTUP=false
      - WEBHOOK_EVENTS_QRCODE_UPDATED=false
      - WEBHOOK_EVENTS_MESSAGES_SET=false
      - WEBHOOK_EVENTS_MESSAGES_UPSERT=false
      - WEBHOOK_EVENTS_MESSAGES_EDITED=false
      - WEBHOOK_EVENTS_MESSAGES_UPDATE=false
      - WEBHOOK_EVENTS_MESSAGES_DELETE=false
      - WEBHOOK_EVENTS_SEND_MESSAGE=false
      - WEBHOOK_EVENTS_CONTACTS_SET=false
      - WEBHOOK_EVENTS_CONTACTS_UPSERT=false
      - WEBHOOK_EVENTS_CONTACTS_UPDATE=false
      - WEBHOOK_EVENTS_PRESENCE_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_SET=false
      - WEBHOOK_EVENTS_CHATS_UPSERT=false
      - WEBHOOK_EVENTS_CHATS_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_DELETE=false
      - WEBHOOK_EVENTS_GROUPS_UPSERT=false
      - WEBHOOK_EVENTS_GROUPS_UPDATE=false
      - WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - WEBHOOK_EVENTS_CONNECTION_UPDATE=false
      - WEBHOOK_EVENTS_LABELS_EDIT=false
      - WEBHOOK_EVENTS_LABELS_ASSOCIATION=false
      - WEBHOOK_EVENTS_CALL=false
      - WEBHOOK_EVENTS_TYPEBOT_START=false
      - WEBHOOK_EVENTS_TYPEBOT_CHANGE_STATUS=false
      - WEBHOOK_EVENTS_ERRORS=false
      - WEBHOOK_EVENTS_ERRORS_WEBHOOK=

      ## Configuração do Provider
      - PROVIDER_ENABLED=false
      - PROVIDER_HOST=127.0.0.1
      - PROVIDER_PORT=5656
      - PROVIDER_PREFIX=evolution${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
      - traefik.enable=1
      - traefik.http.routers.evolution${1:+_$1}_lite.rule=Host(\`$url_evolution\`) ## Url da Evolution API
      - traefik.http.routers.evolution${1:+_$1}_lite.entrypoints=websecure
      - traefik.http.routers.evolution${1:+_$1}_lite.priority=1
      - traefik.http.routers.evolution${1:+_$1}_lite.tls.certresolver=letsencryptresolver
      - traefik.http.routers.evolution${1:+_$1}_lite.service=evolution${1:+_$1}_lite
      - traefik.http.services.evolution${1:+_$1}_lite.loadbalancer.server.port=8080
      - traefik.http.services.evolution${1:+_$1}_lite.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  evolution${1:+_$1}_lite_instances:
    external: true
    name: evolution${1:+_$1}_lite_instances

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Evolution API"
fi
STACK_NAME="evolution${1:+_$1}_lite"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c evolution.yaml evolution > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da Evolution API"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_evolution para verificar se o serviço esta online
wait_stack "evolution${1:+_$1}_lite"

telemetria "Evolution API" "finalizado"

cd dados_vps

cat > dados_evolution${1:+_$1}_lite <<EOL
[ EVOLUTION API LITE ]

Manager Evolution: https://$url_evolution/manager

URL: https://$url_evolution

Global API Key: $apikeyglobal
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ EVOLUTION API LITE ]\e[0m"
echo ""

echo -e "\e[97mAPI URL:\e[33m https://$url_evolution\e[0m"
echo ""

echo -e "\e[97mGLOBAL API KEY:\e[33m $apikeyglobal\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}


## ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗    ██╗   ██╗ ██╗
## ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██║   ██║███║
## █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ██║   ██║╚██║
## ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ╚██╗ ██╔╝ ██║
## ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║     ╚████╔╝  ██║
## ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝      ╚═══╝   ╚═╝

ferramenta_evolution_v1() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_evolution

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o Dominio para a Evolution API (ex: api.oriondesign.art.br): \e[0m" && read -r url_evolution
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_evolution

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da Evolution API:\e[97m $url_evolution\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_evolution

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA EVOLUTION API \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria "Evolution API (v1)" "iniciado"

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO A EVOLUTION API \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Verifica se existe postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    pegar_senha_postgres > /dev/null 2>&1
    senha_do_postgres=$senha_postgres
else
    senha_do_postgres=SENHA_DO_POSTGRES_AQUI
fi

## Aqui de fato vamos iniciar a instalação da Evolution API

## Criando uma Global Key Aleatória
apikeyglobal=$(openssl rand -hex 16)

## Criando a stack
cat > evolution_v1${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  evolution_oriondesign${1:+_$1}:
    image: atendai/evolution-api:v1.8.2 ## Versão da Evolution API
    command: ["node", "./dist/src/main.js"]

    volumes:
    - evolution_oriondesign${1:+_$1}_instances:/evolution/instances
    - evolution_oriondesign${1:+_$1}_store:/evolution/store
    - evolution_oriondesign${1:+_$1}_views:/evolution/views

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Url da Evolution API
    - SERVER_URL=https://$url_evolution ## Url da aplicação

    ## Dados de Autenticação
    - AUTHENTICATION_TYPE=apikey
    - AUTHENTICATION_API_KEY=$apikeyglobal ## GLOBAL API KEY
    - AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true

    ## Configurações
    - CONFIG_SESSION_PHONE_CLIENT=OrionDesign ## Nome que aparece no celular
    - CONFIG_SESSION_PHONE_NAME=chrome

    ## Definir versão do Whatsapp Web
    ## pegue a versão em: https://web.whatsapp.com/check-update?version=0&platform=web
    - CONFIG_SESSION_PHONE_VERSION=2,3000,1015901307

    ## Sobre os QR-Codes
    - QRCODE_LIMIT=1902
    - QRCODE_COLOR=#000000

    # Ativer o RabbitMQ
    - RABBITMQ_ENABLED=false ## Colocar true se quiser usar | Recomendado | Necessario instalar RabbitMQ antes
    - RABBITMQ_URI=amqp://USER:PASS@rabbitmq:5672

    # Aivar Banco de Dados MongoDB
    - DATABASE_ENABLED=false ## Colocar true se quiser usar | Recomendado | Necessario instalar MongoDB antes
    - DATABASE_CONNECTION_URI=mongodb://USUARIO:SENHA@IP_VPS:27017/?authSource=admin&readPreference=primary&ssl=false&directConnection=true ## Colocar a URL do MongoDB
    - DATABASE_CONNECTION_DB_PREFIX_NAME=evolution${1:+_$1}
    - DATABASE_SAVE_DATA_INSTANCE=true
    - DATABASE_SAVE_DATA_NEW_MESSAGE=true
    - DATABASE_SAVE_MESSAGE_UPDATE=true
    - DATABASE_SAVE_DATA_CONTACTS=true
    - DATABASE_SAVE_DATA_CHATS=true

    ## Ativar o Redis
    - REDIS_ENABLED=false ## Colocar true se quiser usar | Não recomendado
    - REDIS_URI=redis://redis:6379

    ## Ativar o Cache Redis (Em testes)
    - CACHE_REDIS_ENABLED=false
    - CACHE_REDIS_URI=redis://redis:6379
    - CACHE_REDIS_PREFIX_KEY=evolution${1:+_$1}
    - CACHE_REDIS_TTL=604800
    - CACHE_REDIS_SAVE_INSTANCES=false
    - CACHE_LOCAL_ENABLED=false
    - CACHE_LOCAL_TTL=604800

    ## Novas variaveis para o Typebot
    - TYPEBOT_KEEP_OPEN=true
    - TYPEBOT_API_VERSION=latest

    ## Novas variaveis para o Chatwoot
    - CHATWOOT_MESSAGE_DELETE=true
    - CHATWOOT_MESSAGE_READ=true

    ## Importar mensagens para o Chawoot | Descomente para usar
    ## Se estiver usando Chatwoot do Nestor mude o a parte "chatwoot" para "chatwoot_nestor"
    #- CHATWOOT_IMPORT_DATABASE_CONNECTION_URI=postgresql://postgres:$senha_do_postgres@postgres:5432/chatwoot?sslmode=disable
    #- CHATWOOT_IMPORT_DATABASE_PLACEHOLDER_MEDIA_MESSAGE=false ## true = Importar midia | false = Não importar midia

    ## Informações do Webhook
    - WEBHOOK_GLOBAL_ENABLED=false
    - WEBHOOK_GLOBAL_URL=
    - WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
    - WEBHOOK_EVENTS_APPLICATION_STARTUP=false
    - WEBHOOK_EVENTS_QRCODE_UPDATED=true
    - WEBHOOK_EVENTS_MESSAGES_SET=false
    - WEBHOOK_EVENTS_MESSAGES_UPSERT=true
    - WEBHOOK_EVENTS_MESSAGES_UPDATE=true
    - WEBHOOK_EVENTS_CONTACTS_SET=true
    - WEBHOOK_EVENTS_CONTACTS_UPSERT=true
    - WEBHOOK_EVENTS_CONTACTS_UPDATE=true
    - WEBHOOK_EVENTS_PRESENCE_UPDATE=true
    - WEBHOOK_EVENTS_CHATS_SET=true
    - WEBHOOK_EVENTS_CHATS_UPSERT=true
    - WEBHOOK_EVENTS_CHATS_UPDATE=true
    - WEBHOOK_EVENTS_CHATS_DELETE=true
    - WEBHOOK_EVENTS_GROUPS_UPSERT=true
    - WEBHOOK_EVENTS_GROUPS_UPDATE=true
    - WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=true
    - WEBHOOK_EVENTS_CONNECTION_UPDATE=true

    ## Sobre as instancias
    - DEL_INSTANCE=false
    - DEL_TEMP_INSTANCES=false
    - STORE_MESSAGES=true
    - STORE_MESSAGE_UP=true
    - STORE_CONTACTS=true
    - STORE_CHATS=true
    - CLEAN_STORE_CLEANING_INTERVAL=7200 # seconds === 2h
    - CLEAN_STORE_MESSAGES=true
    - CLEAN_STORE_MESSAGE_UP=true
    - CLEAN_STORE_CONTACTS=true
    - CLEAN_STORE_CHATS=true

    ## Outros dados
    - DOCKER_ENV=true
    - LOG_LEVEL=ERROR

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
      - traefik.enable=1
      - traefik.http.routers.evolution_oriondesign${1:+_$1}.rule=Host(\`$url_evolution\`) ## Url da Evolution API
      - traefik.http.routers.evolution_oriondesign${1:+_$1}.entrypoints=websecure
      - traefik.http.routers.evolution_oriondesign${1:+_$1}.priority=1
      - traefik.http.routers.evolution_oriondesign${1:+_$1}.tls.certresolver=letsencryptresolver
      - traefik.http.routers.evolution_oriondesign${1:+_$1}.service=evolution_oriondesign${1:+_$1}
      - traefik.http.services.evolution_oriondesign${1:+_$1}.loadbalancer.server.port=8080
      - traefik.http.services.evolution_oriondesign${1:+_$1}.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

volumes:
  evolution_oriondesign${1:+_$1}_instances:
    external: true
    name: evolution_oriondesign${1:+_$1}_instances
  evolution_oriondesign${1:+_$1}_store:
    external: true
    name: evolution_oriondesign${1:+_$1}_store
  evolution_oriondesign${1:+_$1}_views:
    external: true
    name: evolution_oriondesign${1:+_$1}_views
networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Evolution API"
fi
STACK_NAME="evolution_v1${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c evolution_v1.yaml evolution > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da Evolution API"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_evolution para verificar se o serviço esta online
wait_stack "evolution_v1${1:+_$1}"

telemetria "Evolution API (v1)" "finalizado"

cd dados_vps

cat > dados_evolution_v1${1:+_$1} <<EOL
[ EVOLUTION API ]

Manager Evolution: https://$url_evolution/manager

URL: https://$url_evolution

Global API Key: $apikeyglobal
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ Evolution API ]\e[0m"
echo ""

echo -e "\e[97mLink do Manager:\e[33m https://$url_evolution/manager\e[0m"
echo ""

echo -e "\e[97mAPI URL:\e[33m https://$url_evolution\e[0m"
echo ""

echo -e "\e[97mGLOBAL API KEY:\e[33m $apikeyglobal\e[0m"
echo ""

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗    ██╗   ██╗██████╗
## ██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██║   ██║╚════██╗
## █████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ██║   ██║ █████╔╝
## ██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ╚██╗ ██╔╝██╔═══╝
## ███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║     ╚████╔╝ ███████╗
## ╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝      ╚═══╝  ╚══════╝

ferramenta_evolution_v2() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_evolution

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o Dominio para a Evolution API (ex: api.oriondesign.art.br): \e[0m" && read -r url_evolution
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_evolution

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da Evolution API:\e[97m $url_evolution\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_evolution

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA EVOLUTION API \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria "Evolution API" "iniciado"

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres Instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "evolution${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "evolution${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO A EVOLUTION API \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Aqui de fato vamos iniciar a instalação da Evolution API

## Criando uma Global Key Aleatória
apikeyglobal=$(openssl rand -hex 16)

## Criando a stack
cat > evolution_v2${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  evolution${1:+_$1}:
    image: atendai/evolution-api:v2.1.2 ## Versão da Evolution API

    volumes:
      - evolution${1:+_$1}_instances:/evolution/instances

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Configurações Gerais
      - SERVER_URL=https://$url_evolution
      - AUTHENTICATION_API_KEY=$apikeyglobal
      - AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true
      - DEL_INSTANCE=false
      - QRCODE_LIMIT=1902
      - LANGUAGE=pt-BR

      ## Configuração do Cliente
      ## Pegue a versão em: https://wppconnect.io/pt-BR/whatsapp-versions/
      - CONFIG_SESSION_PHONE_VERSION=2.3000.1015901307
      - CONFIG_SESSION_PHONE_CLIENT=OrionDesign
      - CONFIG_SESSION_PHONE_NAME=Chrome

      ## Configuração do Banco de Dados
      - DATABASE_ENABLED=true
      - DATABASE_PROVIDER=postgresql
      - DATABASE_CONNECTION_URI=postgresql://postgres:$senha_postgres@postgres:5432/evolution${1:+_$1}
      - DATABASE_CONNECTION_CLIENT_NAME=evolution${1:+_$1}
      - DATABASE_SAVE_DATA_INSTANCE=true
      - DATABASE_SAVE_DATA_NEW_MESSAGE=true
      - DATABASE_SAVE_MESSAGE_UPDATE=true
      - DATABASE_SAVE_DATA_CONTACTS=true
      - DATABASE_SAVE_DATA_CHATS=true
      - DATABASE_SAVE_DATA_LABELS=true
      - DATABASE_SAVE_DATA_HISTORIC=true

      ## Integração com OpenAI
      - OPENAI_ENABLED=true

      ## Integração com Dify
      - DIFY_ENABLED=true

      ## Integração com Typebot
      - TYPEBOT_ENABLED=true
      - TYPEBOT_API_VERSION=latest

      ## Integração com Chatwoot
      - CHATWOOT_ENABLED=true
      - CHATWOOT_MESSAGE_READ=true
      - CHATWOOT_MESSAGE_DELETE=true
      - CHATWOOT_IMPORT_DATABASE_CONNECTION_URI=postgresql://postgres:$senha_postgres@postgres:5432/chatwoot?sslmode=disable
      - CHATWOOT_IMPORT_PLACEHOLDER_MEDIA_MESSAGE=false

      ## Configuração do Cache
      - CACHE_REDIS_ENABLED=true
      - CACHE_REDIS_URI=redis://redis:6379/8
      - CACHE_REDIS_PREFIX_KEY=evolution
      - CACHE_REDIS_SAVE_INSTANCES=false
      - CACHE_LOCAL_ENABLED=false

      ## Configuração do S3
      - S3_ENABLED=false
      - S3_ACCESS_KEY=
      - S3_SECRET_KEY=
      - S3_BUCKET=evolution
      - S3_PORT=443
      - S3_ENDPOINT=
      - S3_USE_SSL=true
      #- S3_REGION=eu-south

      ## Configuração do WhatsApp Business
      - WA_BUSINESS_TOKEN_WEBHOOK=evolution
      - WA_BUSINESS_URL=https://graph.facebook.com
      - WA_BUSINESS_VERSION=v20.0
      - WA_BUSINESS_LANGUAGE=pt_BR

      ## Telemetria
      - TELEMETRY=false
      - TELEMETRY_URL=

      ## Configuração do WebSocket
      - WEBSOCKET_ENABLED=false
      - WEBSOCKET_GLOBAL_EVENTS=false

      ## Configuração do SQS
      - SQS_ENABLED=false
      - SQS_ACCESS_KEY_ID=
      - SQS_SECRET_ACCESS_KEY=
      - SQS_ACCOUNT_ID=
      - SQS_REGION=

      ## Configuração do RabbitMQ
      - RABBITMQ_ENABLED=false
      - RABBITMQ_URI=amqp://USER:PASS@rabbitmq:5672/evolution${1:+_$1}
      - RABBITMQ_EXCHANGE_NAME=evolution
      - RABBITMQ_GLOBAL_ENABLED=false
      - RABBITMQ_EVENTS_APPLICATION_STARTUP=false
      - RABBITMQ_EVENTS_INSTANCE_CREATE=false
      - RABBITMQ_EVENTS_INSTANCE_DELETE=false
      - RABBITMQ_EVENTS_QRCODE_UPDATED=false
      - RABBITMQ_EVENTS_MESSAGES_SET=false
      - RABBITMQ_EVENTS_MESSAGES_UPSERT=true
      - RABBITMQ_EVENTS_MESSAGES_EDITED=false
      - RABBITMQ_EVENTS_MESSAGES_UPDATE=false
      - RABBITMQ_EVENTS_MESSAGES_DELETE=false
      - RABBITMQ_EVENTS_SEND_MESSAGE=false
      - RABBITMQ_EVENTS_CONTACTS_SET=false
      - RABBITMQ_EVENTS_CONTACTS_UPSERT=false
      - RABBITMQ_EVENTS_CONTACTS_UPDATE=false
      - RABBITMQ_EVENTS_PRESENCE_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_SET=false
      - RABBITMQ_EVENTS_CHATS_UPSERT=false
      - RABBITMQ_EVENTS_CHATS_UPDATE=false
      - RABBITMQ_EVENTS_CHATS_DELETE=false
      - RABBITMQ_EVENTS_GROUPS_UPSERT=false
      - RABBITMQ_EVENTS_GROUP_UPDATE=false
      - RABBITMQ_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - RABBITMQ_EVENTS_CONNECTION_UPDATE=true
      - RABBITMQ_EVENTS_CALL=false
      - RABBITMQ_EVENTS_TYPEBOT_START=false
      - RABBITMQ_EVENTS_TYPEBOT_CHANGE_STATUS=false

      ## Configuração do Webhook
      - WEBHOOK_GLOBAL_ENABLED=false
      - WEBHOOK_GLOBAL_URL=
      - WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
      - WEBHOOK_EVENTS_APPLICATION_STARTUP=false
      - WEBHOOK_EVENTS_QRCODE_UPDATED=false
      - WEBHOOK_EVENTS_MESSAGES_SET=false
      - WEBHOOK_EVENTS_MESSAGES_UPSERT=false
      - WEBHOOK_EVENTS_MESSAGES_EDITED=false
      - WEBHOOK_EVENTS_MESSAGES_UPDATE=false
      - WEBHOOK_EVENTS_MESSAGES_DELETE=false
      - WEBHOOK_EVENTS_SEND_MESSAGE=false
      - WEBHOOK_EVENTS_CONTACTS_SET=false
      - WEBHOOK_EVENTS_CONTACTS_UPSERT=false
      - WEBHOOK_EVENTS_CONTACTS_UPDATE=false
      - WEBHOOK_EVENTS_PRESENCE_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_SET=false
      - WEBHOOK_EVENTS_CHATS_UPSERT=false
      - WEBHOOK_EVENTS_CHATS_UPDATE=false
      - WEBHOOK_EVENTS_CHATS_DELETE=false
      - WEBHOOK_EVENTS_GROUPS_UPSERT=false
      - WEBHOOK_EVENTS_GROUPS_UPDATE=false
      - WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=false
      - WEBHOOK_EVENTS_CONNECTION_UPDATE=false
      - WEBHOOK_EVENTS_LABELS_EDIT=false
      - WEBHOOK_EVENTS_LABELS_ASSOCIATION=false
      - WEBHOOK_EVENTS_CALL=false
      - WEBHOOK_EVENTS_TYPEBOT_START=false
      - WEBHOOK_EVENTS_TYPEBOT_CHANGE_STATUS=false
      - WEBHOOK_EVENTS_ERRORS=false
      - WEBHOOK_EVENTS_ERRORS_WEBHOOK=

      ## Configuração do Provider
      - PROVIDER_ENABLED=false
      - PROVIDER_HOST=127.0.0.1
      - PROVIDER_PORT=5656
      - PROVIDER_PREFIX=evolution${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
      - traefik.enable=1
      - traefik.http.routers.evolution_v2${1:+_$1}.rule=Host(\`$url_evolution\`) ## Url da Evolution API
      - traefik.http.routers.evolution_v2${1:+_$1}.entrypoints=websecure
      - traefik.http.routers.evolution_v2${1:+_$1}.priority=1
      - traefik.http.routers.evolution_v2${1:+_$1}.tls.certresolver=letsencryptresolver
      - traefik.http.routers.evolution_v2${1:+_$1}.service=evolution_v2${1:+_$1}
      - traefik.http.services.evolution_v2${1:+_$1}.loadbalancer.server.port=8080
      - traefik.http.services.evolution_v2${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  evolution${1:+_$1}_instances:
    external: true
    name: evolution${1:+_$1}_instances

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Evolution API"
fi
STACK_NAME="evolution_v2${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c evolution_v2.yaml evolution > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da Evolution API"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_evolution para verificar se o serviço esta online
wait_stack "evolution_v2${1:+_$1}"

telemetria "Evolution API" "finalizado"

cd dados_vps

cat > dados_evolution_v2${1:+_$1} <<EOL
[ EVOLUTION API ]

Manager Evolution: https://$url_evolution/manager

URL: https://$url_evolution

Global API Key: $apikeyglobal
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ EVOLUTION API ]\e[0m"
echo ""

echo -e "\e[97mLink do Manager:\e[33m https://$url_evolution/manager\e[0m"
echo ""

echo -e "\e[97mAPI URL:\e[33m https://$url_evolution\e[0m"
echo ""

echo -e "\e[97mGLOBAL API KEY:\e[33m $apikeyglobal\e[0m"
echo ""

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ███╗██╗███╗   ██╗██╗ ██████╗
## ████╗ ████║██║████╗  ██║██║██╔═══██╗
## ██╔████╔██║██║██╔██╗ ██║██║██║   ██║
## ██║╚██╔╝██║██║██║╚██╗██║██║██║   ██║
## ██║ ╚═╝ ██║██║██║ ╚████║██║╚██████╔╝
## ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝

ferramenta_minio() {
## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_minio

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Minio
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o MinIO (ex: minio.oriondesign.art.br): \e[0m" && read -r url_minio
    echo ""

    ##Pergunta o Dominio para o S3 do Minio
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o Minio S3 (ex: s3.oriondesign.art.br): \e[0m" && read -r url_s3
    echo ""

    ##Pergunta o Usuario para o Minio
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$ e/ou espaço"
    echo -en "\e[33mDigite um usuario para o MinIO (ex: OrionDesign): \e[0m" && read -r user_minio
    echo ""

    ##Pergunta a Senha para o Minio
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -e "$amarelo--> Minimo 8 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma senha para o MinIO (ex: @Senha123_): \e[0m" && read -r senha_minio
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_minio

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Minio
    echo -e "\e[33mDominio do MinIO:\e[97m $url_minio\e[0m"
    echo ""

    ## Informação sobre URL para o S# do Minio
    echo -e "\e[33mDominio do S3:\e[97m $url_s3\e[0m"
    echo ""

    ## Informação sobre Usuario do Minio
    echo -e "\e[33mUsuario do MinIO:\e[97m $user_minio\e[0m"
    echo ""

    ## Informação sobre Senha do Minio
    echo -e "\e[33mSenha do MinIO:\e[97m $senha_minio\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MINIO \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria MinIO iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MINIO \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack minio.yaml
cat > minio${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  minio${1:+_$1}:
    image: quay.io/minio/minio:latest ## Versão do Minio
    command: server /data --console-address ":9001"

    volumes:
      - minio${1:+_$1}_data:/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - MINIO_ROOT_USER=$user_minio
      - MINIO_ROOT_PASSWORD=$senha_minio ## Precisa conter no minimo 8 caracteres

      ## Url do minio
      - MINIO_BROWSER_REDIRECT_URL=https://$url_minio ## Url do minio
      - MINIO_SERVER_URL=https://$url_s3 ## Url do s3 | Comente esta linha caso tiver erro ao fazer login

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.minio_public${1:+_$1}.rule=Host(\`$url_s3\`) ## Url do s3
        - traefik.http.routers.minio_public${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.minio_public${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.minio_public${1:+_$1}.loadbalancer.server.port=9000
        - traefik.http.services.minio_public${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.routers.minio_public${1:+_$1}.service=minio_public${1:+_$1}
        - traefik.http.routers.minio_console${1:+_$1}.rule=Host(\`$url_minio\`) ## Url do minio
        - traefik.http.routers.minio_console${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.minio_console${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.minio_console${1:+_$1}.loadbalancer.server.port=9001
        - traefik.http.services.minio_console${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.routers.minio_console${1:+_$1}.service=minio_console${1:+_$1}

## --------------------------- ORION --------------------------- ##

volumes:
  minio${1:+_$1}_data:
    external: true
    name: minio${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do MinIO"
fi
sleep 1
STACK_NAME="minio${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c minio.yaml minio

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Minio"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_minio para verificar se o serviço esta online
wait_stack "minio${1:+_$1}"

telemetria MinIO finalizado

cd dados_vps

cat > dados_minio${1:+_$1} <<EOL
[ MINIO ]

Dominio do Minio: https://$url_minio

Dominio do S3: https://$url_s3

Usuario: $user_minio

Senha: $senha_minio

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MINIO ]\e[0m"
echo ""

echo -e "\e[33mDominio MinIO:\e[97m https://$url_minio\e[0m"
echo ""

echo -e "\e[33mDominio S3:\e[97m https://$url_s3\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_minio\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $senha_minio\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}


## ████████╗██╗   ██╗██████╗ ███████╗██████╗  ██████╗ ████████╗
## ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝
##    ██║    ╚████╔╝ ██████╔╝█████╗  ██████╔╝██║   ██║   ██║
##    ██║     ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║   ██║   ██║
##    ██║      ██║   ██║     ███████╗██████╔╝╚██████╔╝   ██║
##    ╚═╝      ╚═╝   ╚═╝     ╚══════╝╚═════╝  ╚═════╝    ╚═╝

ferramenta_typebot() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_typebot

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Builder
    echo -e "\e[97mPasso$amarelo 1/10\e[0m"
    echo -en "\e[33mDigite o Dominio para o Builder do Typebot (ex: typebot.oriondesign.art.br): \e[0m" && read -r url_typebot
    echo ""

    ##Pergunta o Dominio do Viewer
    echo -e "\e[97mPasso$amarelo 2/10\e[0m"
    echo -en "\e[33mDigite o Dominio para o Viewer do Typebot (ex: bot.oriondesign.art.br): \e[0m" && read -r url_viewer
    echo ""

    ##Pergunta a versão da ferramenta
    echo -e "\e[97mPasso$amarelo 3/10\e[0m"
    echo -en "\e[33mDigite a versão que deseja do Typebot (ex: 3.0.1 ou latest): \e[0m" && read -r versao_typebot
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 4/10\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_typebot
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 5/10\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_email_typebot
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 6/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_typebot
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 7/10\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_typebot
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 8/10\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_typebot
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_typebot" -eq 465 ]; then
    smtp_secure_typebot=true
    else
    smtp_secure_typebot=false
    fi

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 9/10\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 10/10\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_typebot

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Builder
    echo -e "\e[33mDominio do Typebot Builder:\e[97m $url_typebot\e[0m"
    echo ""

    ## Informação sobre URL do Viewer
    echo -e "\e[33mDominio do Typebot Viewer:\e[97m $url_viewer\e[0m"
    echo ""

    ## Informação sobre a versão da ferramenta
    echo -e "\e[33mVersão do Typebot:\e[97m $versao_typebot\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail do SMTP:\e[97m $email_typebot\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mUsuário do SMTP:\e[97m $usuario_email_typebot\e[0m"
    echo ""

    ## Informação sobre Senha do Email
    echo -e "\e[33mSenha do Email:\e[97m $senha_email_typebot\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP do Email:\e[97m $smtp_email_typebot\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_typebot\e[0m"
    echo ""

    ## Informação sobre Secure SMTP
    echo -e "\e[33mSecure SMTP do Email:\e[97m $smtp_secure_typebot\e[0m"
    echo ""

    ## Informação sobre Access Key
    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""

    ## Informação sobre Secret Key
    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_typebot

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO TYPEBOT \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Typebot iniciado

## Nada nada nada.. só para aparecer a mensagem de passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "typebot${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "typebot${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• PEGANDO DADOS DO MINIO \e[33m[3/5]\e[0m"
echo ""
sleep 1

pegar_senha_minio
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Pegando Senha do MinIO"
else
    echo "1/2 - [ OFF ] - Pegando Senha do MinIO"
    echo "Não foi possivel pegar a senha do minio"
    echo ""
fi
pegar_link_s3
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Pegando URL do S3"
    echo ""
else
    echo "2/2 - [ OFF ] - Pegando URL do S3"
    echo "Não foi possivel pegar o link do S3"
    echo ""
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO TYPEBOT \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
key_typebot=$(openssl rand -hex 16)

## Criando a stack typebot.yaml
cat > typebot${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  typebot${1:+_$1}_builder:
    image: baptistearno/typebot-builder:$versao_typebot ## Versão do Builder do Typebot

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/typebot${1:+_$1}

      ## Encryption key
      - ENCRYPTION_SECRET=$key_typebot

      ## Plano Padrão (das novas contas)
      - DEFAULT_WORKSPACE_PLAN=UNLIMITED

      ## Urls do typebot
      - NEXTAUTH_URL=https://$url_typebot ## URL Builder
      - NEXT_PUBLIC_VIEWER_URL=https://$url_viewer ## URL Viewer
      - NEXTAUTH_URL_INTERNAL=http://localhost:3000

      ## Desativer/ativar novos cadastros
      - DISABLE_SIGNUP=false

      ## Dados do SMTP
      - ADMIN_EMAIL=$email_typebot ## Email SMTP
      - NEXT_PUBLIC_SMTP_FROM='Suporte' <$email_typebot>
      - SMTP_AUTH_DISABLED=false
      - SMTP_USERNAME=$usuario_email_typebot
      - SMTP_PASSWORD=$senha_email_typebot
      - SMTP_HOST=$smtp_email_typebot
      - SMTP_PORT=$porta_smtp_typebot
      - SMTP_SECURE=$smtp_secure_typebot

      ## Dados Google Cloud
      #- GOOGLE_AUTH_CLIENT_ID=
      #- GOOGLE_SHEETS_CLIENT_ID=
      #- GOOGLE_AUTH_CLIENT_SECRET=
      #- GOOGLE_SHEETS_CLIENT_SECRET=
      #- NEXT_PUBLIC_GOOGLE_SHEETS_API_KEY=

      ## Dados do Minio/S3
      - S3_ACCESS_KEY=$S3_ACCESS_KEY
      - S3_SECRET_KEY=$S3_SECRET_KEY
      - S3_BUCKET=typebot${1:+-$1}
      - S3_ENDPOINT=$url_s3

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - io.portainer.accesscontrol.users=admin
        - traefik.enable=true
        - traefik.http.routers.typebot${1:+_$1}_builder.rule=Host(\`$url_typebot\`) ## Url do Builder do Typebot
        - traefik.http.routers.typebot${1:+_$1}_builder.entrypoints=websecure
        - traefik.http.routers.typebot${1:+_$1}_builder.tls.certresolver=letsencryptresolver
        - traefik.http.services.typebot${1:+_$1}_builder.loadbalancer.server.port=3000
        - traefik.http.services.typebot${1:+_$1}_builder.loadbalancer.passHostHeader=true
        - traefik.http.routers.typebot${1:+_$1}_builder.service=typebot${1:+_$1}_builder

## --------------------------- ORION --------------------------- ##

  typebot${1:+_$1}_viewer:
    image: baptistearno/typebot-viewer:$versao_typebot ## Versão do Viewer do Typebot

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/typebot${1:+_$1}

      ## Encryption key
      - ENCRYPTION_SECRET=$key_typebot

      ## Plano Padrão (das novas contas)
      - DEFAULT_WORKSPACE_PLAN=UNLIMITED

      ## Urls do typebot
      - NEXTAUTH_URL=https://$url_typebot ## URL Builder
      - NEXT_PUBLIC_VIEWER_URL=https://$url_viewer ## URL Viewer
      - NEXTAUTH_URL_INTERNAL=http://localhost:3000

      ## Desativer/ativar novos cadastros
      - DISABLE_SIGNUP=false

      ## Dados do SMTP
      - ADMIN_EMAIL=$email_typebot ## Email SMTP
      - NEXT_PUBLIC_SMTP_FROM='Suporte' <$email_typebot>
      - SMTP_AUTH_DISABLED=false
      - SMTP_USERNAME=$usuario_email_typebot
      - SMTP_PASSWORD=$senha_email_typebot
      - SMTP_HOST=$smtp_email_typebot
      - SMTP_PORT=$porta_smtp_typebot
      - SMTP_SECURE=$smtp_secure_typebot

      ## Dados Google Cloud
      #- GOOGLE_AUTH_CLIENT_ID=
      #- GOOGLE_SHEETS_CLIENT_ID=
      #- GOOGLE_AUTH_CLIENT_SECRET=
      #- GOOGLE_SHEETS_CLIENT_SECRET=
      #- NEXT_PUBLIC_GOOGLE_SHEETS_API_KEY=

      ## Dados do Minio/S3
      - S3_ACCESS_KEY=$S3_ACCESS_KEY
      - S3_SECRET_KEY=$S3_SECRET_KEY
      - S3_BUCKET=typebot${1:+-$1}
      - S3_ENDPOINT=$url_s3

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - io.portainer.accesscontrol.users=admin
        - traefik.enable=true
        - traefik.http.routers.typebot${1:+_$1}_viewer.rule=Host(\`$url_viewer\`) ## Url do Viewer do Typebot
        - traefik.http.routers.typebot${1:+_$1}_viewer.entrypoints=websecure
        - traefik.http.routers.typebot${1:+_$1}_viewer.tls.certresolver=letsencryptresolver
        - traefik.http.services.typebot${1:+_$1}_viewer.loadbalancer.server.port=3000
        - traefik.http.services.typebot${1:+_$1}_viewer.loadbalancer.passHostHeader=true
        - traefik.http.routers.typebot${1:+_$1}_viewer.service=typebot${1:+_$1}_viewer

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Typebot"
fi
STACK_NAME="typebot${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c typebot.yaml typebot > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Typebot"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_typebot para verificar se o serviço esta online
wait_stack "typebot${1:+_$1}"

telemetria Typebot finalizado

cd dados_vps

cat > dados_typebot${1:+_$1} <<EOL
[ TYPEBOT ]

Dominio do Typebot: https://$url_typebot

Email: Qualquer um (cada email é um workspace)

Senha: Não tem senha, chega no seu email o link magico de acesso
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ TYPEBOT ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_typebot\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Qualquer um (não precisa ser o mesmo que usou na instalação)\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Não tem senha, chega no seu email um link magico de acesso.\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗ █████╗ ███╗   ██╗
## ████╗  ██║██╔══██╗████╗  ██║
## ██╔██╗ ██║╚█████╔╝██╔██╗ ██║
## ██║╚██╗██║██╔══██╗██║╚██╗██║
## ██║ ╚████║╚█████╔╝██║ ╚████║
## ╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═══╝

ferramenta_n8n() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_n8n

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do N8N
    echo -e "\e[97mPasso$amarelo 1/7\e[0m"
    echo -en "\e[33mDigite o dominio para o N8N (ex: n8n.oriondesign.art.br): \e[0m" && read -r url_editorn8n
    echo ""

    ##Pergunta o Dominio do Webhook
    echo -e "\e[97mPasso$amarelo 2/7\e[0m"
    echo -en "\e[33mDigite o dominio para o Webhook do N8N (ex: webhook.oriondesign.art.br): \e[0m" && read -r url_webhookn8n
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 3/7\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_n8n
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 4/7\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_smtp_n8n
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 5/7\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_smtp_n8n
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 6/7\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_n8n
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 7/7\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_n8n
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_typebot" -eq 465 ]; then
    smtp_secure_smtp_n8n=true
    else
    smtp_secure_smtp_n8n=false
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_n8n

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do N8N
    echo -e "\e[33mDominio do N8N:\e[97m $url_editorn8n\e[0m"
    echo ""

    ## Informação sobre URL do Webhook
    echo -e "\e[33mDominio para o Webhook:\e[97m $url_webhookn8n\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail do SMTP:\e[97m $email_smtp_n8n\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mUsuário do SMTP:\e[97m $usuario_smtp_n8n\e[0m"
    echo ""

    ## Informação sobre Senha do Email
    echo -e "\e[33mSenha do Email:\e[97m $senha_smtp_n8n\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP do Email:\e[97m $host_smtp_n8n\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_n8n\e[0m"
    echo ""

    ## Informação sobre Secure SMTP
    echo -e "\e[33mSecure SMTP do Email:\e[97m $smtp_secure_smtp_n8n\e[0m"
    echo ""

    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_n8n

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO N8N \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria N8N iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Verifica se tem postgres, se sim pega a senha e cria um banco nele, se não instala, pega a senha e cria o banco
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "n8n_queue${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "n8n_queue${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO N8N \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
encryption_key=$(openssl rand -hex 16)

## Criando a stack n8n.yaml
cat > n8n${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  n8n${1:+_$1}_editor:
    image: n8nio/n8n:latest ## Versão do N8N
    command: start

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Community Nodes
      - N8N_REINSTALL_MISSING_PACKAGES=true
      - N8N_COMMUNITY_PACKAGES_ENABLED=true
      - N8N_NODE_PATH=/home/node/.n8n/nodes

      ## Dados SMTP
      - N8N_SMTP_SENDER=$email_smtp_n8n
      - N8N_SMTP_USER=$usuario_smtp_n8n
      - N8N_SMTP_PASS=$senha_smtp_n8n
      - N8N_SMTP_HOST=$host_smtp_n8n
      - N8N_SMTP_PORT=$porta_smtp_n8n
      - N8N_SMTP_SSL=$smtp_secure_smtp_n8n

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n${1:+_$1}_editor.rule=Host(\`$url_editorn8n\`) ## Url do Editor do N8N
        - traefik.http.routers.n8n${1:+_$1}_editor.entrypoints=websecure
        - traefik.http.routers.n8n${1:+_$1}_editor.priority=1
        - traefik.http.routers.n8n${1:+_$1}_editor.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n${1:+_$1}_editor.service=n8n${1:+_$1}_editor
        - traefik.http.services.n8n${1:+_$1}_editor.loadbalancer.server.port=5678
        - traefik.http.services.n8n${1:+_$1}_editor.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

  n8n${1:+_$1}_webhook:
    image: n8nio/n8n:latest ## Versão do N8N
    command: webhook

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Community Nodes
      - N8N_REINSTALL_MISSING_PACKAGES=true
      - N8N_COMMUNITY_PACKAGES_ENABLED=true
      - N8N_NODE_PATH=/home/node/.n8n/nodes

      ## Dados SMTP
      - N8N_SMTP_SENDER=$email_smtp_n8n
      - N8N_SMTP_USER=$usuario_smtp_n8n
      - N8N_SMTP_PASS=$senha_smtp_n8n
      - N8N_SMTP_HOST=$host_smtp_n8n
      - N8N_SMTP_PORT=$porta_smtp_n8n
      - N8N_SMTP_SSL=$smtp_secure_smtp_n8n

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n${1:+_$1}_webhook.rule=(Host(\`$url_webhookn8n\`)) ## Url do Webhook do N8N
        - traefik.http.routers.n8n${1:+_$1}_webhook.entrypoints=websecure
        - traefik.http.routers.n8n${1:+_$1}_webhook.priority=1
        - traefik.http.routers.n8n${1:+_$1}_webhook.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n${1:+_$1}_webhook.service=n8n${1:+_$1}_webhook
        - traefik.http.services.n8n${1:+_$1}_webhook.loadbalancer.server.port=5678
        - traefik.http.services.n8n${1:+_$1}_webhook.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

  n8n${1:+_$1}_worker:
    image: n8nio/n8n:latest ## Versão do N8N
    command: worker --concurrency=10

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Community Nodes
      - N8N_REINSTALL_MISSING_PACKAGES=true
      - N8N_COMMUNITY_PACKAGES_ENABLED=true
      - N8N_NODE_PATH=/home/node/.n8n/nodes

      ## Dados SMTP
      - N8N_SMTP_SENDER=$email_smtp_n8n
      - N8N_SMTP_USER=$usuario_smtp_n8n
      - N8N_SMTP_PASS=$senha_smtp_n8n
      - N8N_SMTP_HOST=$host_smtp_n8n
      - N8N_SMTP_PORT=$porta_smtp_n8n
      - N8N_SMTP_SSL=$smtp_secure_smtp_n8n

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do N8N"
fi
STACK_NAME="n8n${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c n8n.yaml n8n > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do N8N"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_n8n para verificar se o serviço esta online
wait_stack "n8n${1:+_$1}"

telemetria N8N finalizado

cd dados_vps

cat > dados_n8n${1:+_$1} <<EOL
[ N8N ]

Dominio do N8N: https://$url_editorn8n

Dominio do Webhook do N8N: https://$url_webhookn8n

Email: Precisa criar no primeiro acesso do N8N

Senha: Precisa criar no primeiro acesso do N8N

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ N8N ]\e[0m"
echo ""

echo -e "\e[33mDominio Editor:\e[97m https://$url_editorn8n\e[0m"
echo ""

echo -e "\e[33mDominio Webhook:\e[97m https://$url_webhookn8n\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa criar no primeiro acesso do N8N\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do N8N\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗      ██████╗ ██╗    ██╗██╗███████╗███████╗
## ██╔════╝██║     ██╔═══██╗██║    ██║██║██╔════╝██╔════╝
## █████╗  ██║     ██║   ██║██║ █╗ ██║██║███████╗█████╗
## ██╔══╝  ██║     ██║   ██║██║███╗██║██║╚════██║██╔══╝
## ██║     ███████╗╚██████╔╝╚███╔███╔╝██║███████║███████╗
## ╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝

ferramenta_flowise() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_flowise

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o Flowise (ex: flowise.oriondesign.art.br): \e[0m" && read -r url_flowise
    echo ""

    ##Pergunta o Usuario para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -e "$amarelo--> Minimo 5 caracteres. Evite os caracteres especiais: \!#$ e/ou espaço"
    echo -en "\e[33mDigite um usuario para o Flowise (ex: admin): \e[0m" && read -r user_flowise
    echo ""

    ##Pergunta a Senha para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "$amarelo--> Minimo 8 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma senha para o usuario (ex: @Senha123_): \e[0m" && read -r pass_flowise
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_flowise

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Flowise
    echo -e "\e[33mDominio do Flowise\e[97m $url_flowise\e[0m"
    echo ""

    ## Informação sobre Usuario do Flowise
    echo -e "\e[33mUsuario:\e[97m $user_flowise\e[0m"
    echo ""

    ## Informação sobre a Senha do Usuario do Flowise
    echo -e "\e[33mSenha:\e[97m $pass_flowise\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_flowise

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO FLOWISE \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Flowise iniciado

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Já sabe né ksk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "flowise${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "flowise${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO FLOWISE \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando uma Encryption Key Aleatória
encryption_key=$(openssl rand -hex 16)

## Criando a stack flowise.yaml
cat > flowise${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  flowise${1:+_$1}:
    image: flowiseai/flowise:latest ## Versão do Flowise

    volumes:
     - flowise${1:+_$1}_data:/root/.flowise

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
     ## Dados de acesso
     - FLOWISE_USERNAME=$user_flowise
     - FLOWISE_PASSWORD=$pass_flowise

     ## Dados do Postgres
     - DATABASE_TYPE=postgres
     - DATABASE_HOST=postgres
     - DATABASE_PORT=5432
     - DATABASE_USER=postgres
     - DATABASE_PASSWORD=$senha_postgres
     - DATABASE_NAME=flowise${1:+_$1}

     ## Encryption Key
     - FLOWISE_SECRETKEY_OVERWRITE=$encryption_key

     ## Diretório das API Keys
     - APIKEY_PATH=/root/.flowise
     - SECRETKEY_PATH=/root/.flowise

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.flowise${1:+_$1}.rule=Host(\`$url_flowise\`) ## Url da aplicação
        - traefik.http.services.flowise${1:+_$1}.loadBalancer.server.port=3000
        - traefik.http.routers.flowise${1:+_$1}.service=flowise${1:+_$1}
        - traefik.http.routers.flowise${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.flowise${1:+_$1}.tls.certresolver=letsencryptresolver

## --------------------------- ORION --------------------------- ##

volumes:
  flowise${1:+_$1}_data:
    external: true

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Flowise"
fi
STACK_NAME="flowise${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c flowise.yaml flowise  > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Flowise"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_flowise para verificar se o serviço esta online
wait_stack "flowise${1:+_$1}"

telemetria Flowise finalizado

cd dados_vps

cat > dados_flowise${1:+_$1} <<EOL
[ FLOWISE ]

Dominio do Flowise: https://$url_flowise

Usuario: $user_flowise

Senha: $pass_flowise
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ FLOWISE ]\e[0m"
echo ""
echo -e "\e[33mDominio:\e[97m https://$url_flowise\e[0m"
echo ""
echo -e "\e[33mUsuario:\e[97m $user_flowise\e[0m"
echo ""
echo -e "\e[33mSenha:\e[97m $pass_flowise\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  ██████╗      █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗    ██╗  ██╗
## ██╔══██╗██╔════╝     ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║    ██║  ██║
## ██████╔╝██║  ███╗    ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║    ███████║
## ██╔═══╝ ██║   ██║    ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║    ╚════██║
## ██║     ╚██████╔╝    ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║         ██║
## ╚═╝      ╚═════╝     ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝         ╚═╝

ferramenta_pgAdmin_4() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_pgAdmin_4

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o PgAdmin 4 (ex: pgadmin.oriondesign.art.br): \e[0m" && read -r url_PgAdmin_4
    echo ""

    ##Pergunta o Email para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite um email para o PgAdmin 4 (ex: contato@oriondesign.art.br): \e[0m" && read -r user_PgAdmin_4
    echo ""

    ##Pergunta a Senha para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "$amarelo--> Minimo 8 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma senha para o usuario (ex: @Senha123_): \e[0m" && read -r pass_PgAdmin_4
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_pgAdmin_4

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do PgAdmin
    echo -e "\e[33mDominio do PgAdmin 4\e[97m $url_PgAdmin_4\e[0m"
    echo ""

    ## Informação sobre email do PgAdmin
    echo -e "\e[33mEmail:\e[97m $user_PgAdmin_4\e[0m"
    echo ""

    ## Informação sobre a senha do PgAdmin
    echo -e "\e[33mSenha:\e[97m $pass_PgAdmin_4\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO PGADMIN 4 \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria "PgAdmin 4" "iniciado"

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO PGADMIN 4 \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack pgadmin.yaml
cat > pgadmin${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  pgadmin${1:+_$1}:
    image: dpage/pgadmin4:latest ## Versão do PgAdmin 4

    volumes:
      - pgadmin${1:+_$1}_data:/var/lib/pgadmin

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de Acesso
      - PGADMIN_DEFAULT_EMAIL=$user_PgAdmin_4
      - PGADMIN_DEFAULT_PASSWORD=$pass_PgAdmin_4

    deploy:
      mode: replicated
      replicas: 1
      placement:
          constraints:
            - node.role == manager
      resources:
          limits:
            cpus: '0.4'
            memory: 256M
      labels:
          - traefik.enable=true
          - traefik.http.routers.pgadmin${1:+_$1}.rule=Host(\`$url_PgAdmin_4\`) ## Url da Ferramenta
          - traefik.http.services.pgadmin${1:+_$1}.loadbalancer.server.port=80
          - traefik.http.routers.pgadmin${1:+_$1}.service=pgadmin${1:+_$1}
          - traefik.http.routers.pgadmin${1:+_$1}.tls.certresolver=letsencryptresolver
          - traefik.http.routers.pgadmin${1:+_$1}.entrypoints=websecure
          - traefik.http.routers.pgadmin${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  pgadmin${1:+_$1}_data:
    external: true

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do PgAdmin 4"
fi
STACK_NAME="pgadmin${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c pgadmin.yaml pgadmin  > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do PgAdmin 4"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_pgadmin_4 para verificar se o serviço esta online
wait_stack "pgadmin${1:+_$1}"

telemetria "PgAdmin 4" "finalizado"

cd dados_vps

cat > dados_pgadmin${1:+_$1} <<EOL
[ PGADMIN 4 ]

Dominio do pgadmin: https://$url_PgAdmin_4

Usuario: $user_PgAdmin_4

Senha: $pass_PgAdmin_4
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ PGADMIN 4 ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_PgAdmin_4\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m $user_PgAdmin_4\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_PgAdmin_4\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗ ██████╗  ██████╗ ██████╗ ██████╗  █████╗ ███████╗███████╗
## ████╗  ██║██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
## ██╔██╗ ██║██║   ██║██║     ██║   ██║██████╔╝███████║███████╗█████╗
## ██║╚██╗██║██║   ██║██║     ██║   ██║██╔══██╗██╔══██║╚════██║██╔══╝
## ██║ ╚████║╚██████╔╝╚██████╗╚██████╔╝██████╔╝██║  ██║███████║███████╗
## ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

ferramenta_nocobase() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_nocobase
## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o dominio para o Nocobase (ex: nocobase.oriondesign.art.br): \e[0m" && read -r url_nocobase
    echo ""

    ##Pergunta o Email para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -en "\e[33mDigite um email para o Nocobase (ex: contato@oriondesign.art.br): \e[0m" && read -r mail_nocobase
    echo ""

    ##Pergunta um Usuario para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -en "\e[33mDigite um nome de usuario para o Nocobase (ex: OrionDesign): \e[0m" && read -r user_nocobase
    echo ""

    ##Pergunta a Senha para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -e "$amarelo--> Minimo 8 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma senha para o usuario (ex: @Senha123_): \e[0m" && read -r pass_nocobase
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_nocobase

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Nocobase
    echo -e "\e[33mDominio do Nocobase:\e[97m $url_nocobase\e[0m"
    echo ""

    ## Informação sobre Email do Nocobase
    echo -e "\e[33mEmail:\e[97m $mail_nocobase\e[0m"
    echo ""

    ## Informação sobre Usuario do Nocobase
    echo -e "\e[33mUsuario:\e[97m $user_nocobase\e[0m"
    echo ""

    ## Informação sobre Senha do Nocobase
    echo -e "\e[33mSenha:\e[97m $pass_nocobase\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO NOCOBASE \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Nocobase iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Cansei já de explicar o que isso faz kkkk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "nocobase${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "nocobase${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO NOCOBASE \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando uma Encryption Key Aleatória
nocobase_key=$(openssl rand -hex 16)
nocobase_encryption=$(openssl rand -hex 16)

## Criando a stack nocobase.yaml
cat > nocobase${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  nocobase${1:+_$1}:
    image: nocobase/nocobase:latest ## Versão do Nocobase

    volumes:
      - nocobase${1:+_$1}_storage:/app/nocobase/storage

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - INIT_ROOT_EMAIL=$mail_nocobase
      - INIT_ROOT_PASSWORD=$pass_nocobase
      - INIT_ROOT_NICKNAME=$user_nocobase
      - INIT_ROOT_USERNAME=$user_nocobase

      ## Dados do Postgres
      - DB_DIALECT=postgres
      - DB_HOST=postgres
      - DB_DATABASE=nocobase${1:+_$1}
      - DB_USER=postgres
      - DB_PASSWORD=$senha_postgres

      ## Paths de URL
      - LOCAL_STORAGE_BASE_URL=/storage/uploads
      - API_BASE_PATH=/api/

      ## Encryption Key
      - APP_KEY=$nocobase_key
      - ENCRYPTION_FIELD_KEY=$nocobase_encryption

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.nocobase${1:+_$1}.rule=Host(\`$url_nocobase\`) ## Url da aplicação
        - traefik.http.services.nocobase${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.nocobase${1:+_$1}.service=nocobase${1:+_$1}
        - traefik.http.routers.nocobase${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.nocobase${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.nocobase${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  nocobase${1:+_$1}_storage:
    external: true

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Nocobase"
fi
STACK_NAME="nocobase${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c nocobase.yaml nocobase > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Nocobase"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "nocobase" para verificar se o serviço esta online
wait_stack "nocobase${1:+_$1}"

telemetria Nocobase finalizado

cd dados_vps

cat > dados_nocobase<<EOL
[ NOCOBASE ]

Dominio do Nocobase: https://$url_nocobase

Email: $mail_nocobase

Usuario: $user_nocobase

Senha: $pass_nocobase
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ NOCOBASE ]\e[0m"
echo ""
echo -e "\e[33mDominio:\e[97m https://$url_nocobase\e[0m"
echo ""
echo -e "\e[33mEmail:\e[97m $mail_nocobase\e[0m"
echo ""
echo -e "\e[33mUsuario:\e[97m $user_nocobase\e[0m"
echo ""
echo -e "\e[33mSenha:\e[97m $pass_nocobase\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  ██████╗ ████████╗██████╗ ██████╗ ███████╗███████╗███████╗
## ██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
## ██████╔╝██║   ██║   ██║   ██████╔╝██████╔╝█████╗  ███████╗███████╗
## ██╔══██╗██║   ██║   ██║   ██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║
## ██████╔╝╚██████╔╝   ██║   ██║     ██║  ██║███████╗███████║███████║
## ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

ferramenta_botpress() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_botpress

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Botpress (ex: botpress.oriondesign.art.br): \e[0m" && read -r url_botpress
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_botpress

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Botpress
    echo -e "\e[33mDominio do Botpress:\e[97m $url_botpress\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_botpress

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO BOTPRESS \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Botpress iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Cansei já de explicar o que isso faz kkkk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "botpress${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "botpress${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO BOTPRESS \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando a stack botpress.yaml
cat > botpress${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  botpress${1:+_$1}:
    image: botpress/server:latest

    volumes:
      - botpress${1:+_$1}_data:/botpress/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Url Botpress
      - EXTERNAL_URL=https://$url_botpress

      ## Modo
      - BP_PRODUCTION=true

      ## Dados Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/botpress${1:+_$1}

      ## Dados Redis
      - REDIS_URL=redis://redis:6379

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.botpress${1:+_$1}.rule=Host(\`$url_botpress\`)
        - traefik.http.services.botpress${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.botpress${1:+_$1}.service=botpress${1:+_$1}
        - traefik.http.routers.botpress${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.botpress${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.botpress${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  botpress${1:+_$1}_data:
    external: true
    name: botpress${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Botpress"
fi
STACK_NAME="botpress${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c botpress.yaml botpress > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Botpress"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_botpress para verificar se o serviço esta online
wait_stack "botpress${1:+_$1}"

telemetria Botpress finalizado

cd dados_vps

cat > dados_${1:+_$1}botpress <<EOL
[ BOTPRESS ]

Dominio do Botpress: https://$url_botpress

Usuario: Precisa criar no primeiro acesso do Botpress

Senha: Precisa criar no primeiro acesso do Botpress

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ Botpress ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_botpress\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Botpress\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Botpress\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}


## ██╗    ██╗ ██████╗ ██████╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗███████╗
## ██║    ██║██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
## ██║ █╗ ██║██║   ██║██████╔╝██║  ██║██████╔╝██████╔╝█████╗  ███████╗███████╗
## ██║███╗██║██║   ██║██╔══██╗██║  ██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║
## ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝██║     ██║  ██║███████╗███████║███████║
##  ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

ferramenta_wordpress() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_wordpress

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o Wordpress (ex: oriondesign.art.br ou loja.oriondesign.art.br): \e[0m" && read -r url_wordpress
    echo ""

    ## Pergunta o nome do site
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -e "$amarelo--> Use apenas letras minusculas, sem espaço ou caracteres especiais"
    echo -en "\e[33mDigite o nome do Site (ex: lojaorion): \e[0m" && read -r nome_site_wordpress
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_wordpress

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Wordpress
    echo -e "\e[33mDominio do Wordpress:\e[97m $url_wordpress\e[0m"
    echo ""

    ## Informação sobre Nome do site
    echo -e "\e[33mNome do Site:\e[97m $nome_site_wordpress\e[0m"
    echo ""


    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO WORDPRESS \e[33m[1/7]\e[0m"
echo ""
sleep 1

telemetria Wordpress iniciado

## Ativa a função dados para pegar os dados da vps
dados

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/7]\e[0m"
echo ""
sleep 1

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "$nome_site_wordpress"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "$nome_site_wordpress"
    fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/7]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi


## Mensagem de Passo
echo -e "\e[97m• INSTALANDO WORDPRESS \e[33m[4/7]\e[0m"
echo ""
sleep 1

## Criando a stack wordpress.yaml
cat > wordpress_$nome_site_wordpress.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  wordpress_$nome_site_wordpress:
    image: wordpress:latest ## Versão do Wordpress

    volumes:
      - wordpress_$nome_site_wordpress:/var/www/html
      - wordpress_${nome_site_wordpress}_php:/usr/local/etc/php

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do Mysql
      - WORDPRESS_DB_NAME=$nome_site_wordpress
      - WORDPRESS_DB_HOST=mysql
      - WORDPRESS_DB_PORT=3306
      - WORDPRESS_DB_USER=root
      - WORDPRESS_DB_PASSWORD=$senha_mysql

      ## Redis
      - WP_REDIS_HOST=redis
      - WP_REDIS_PORT=6379
      - WP_REDIS_DATABASE=6

      ## Url do Wordpress
      - VIRTUAL_HOST=$url_wordpress

      ## Localização
      - WP_LOCALE=pt_BR

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.wordpress_$nome_site_wordpress.rule=Host(\`$url_wordpress\`)
        - traefik.http.routers.wordpress_$nome_site_wordpress.entrypoints=websecure
        - traefik.http.routers.wordpress_$nome_site_wordpress.tls.certresolver=letsencryptresolver
        - traefik.http.routers.wordpress_$nome_site_wordpress.service=wordpress_$nome_site_wordpress
        - traefik.http.services.wordpress_$nome_site_wordpress.loadbalancer.server.port=80
        - traefik.http.services.wordpress_$nome_site_wordpress.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  wordpress_$nome_site_wordpress:
    external: true
    name: wordpress_$nome_site_wordpress
  wordpress_${nome_site_wordpress}_php:
    external: true
    name: wordpress_${nome_site_wordpress}_php

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Wordpress"
fi
STACK_NAME="wordpress_$nome_site_wordpress"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c $nome_da_stack_wordpress $nome_da_stack_wordpress_subir #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Wordpress"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/7]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_wordpress para verificar se o serviço esta online
wait_stack "wordpress_$nome_site_wordpress"

## Mensagem de Passo
echo -e "\e[97m• EDITANDO PHP.INI \e[33m[6/7]\e[0m"
echo ""
sleep 1

## Editando o PHP.INI
cp /var/lib/docker/volumes/wordpress_${nome_site_wordpress}_php/_data/php.ini-production /var/lib/docker/volumes/wordpress_${nome_site_wordpress}_php/_data/php.ini
if [ $? -eq 0 ]; then
    echo "1/5 - [ OK ] - Copiando arquivo php.ini"
else
    echo "1/5 - [ OFF ] - Copiando arquivo php.ini"
fi
caminho_php_ini="/var/lib/docker/volumes/wordpress_${nome_site_wordpress}_php/_data/php.ini"

sed -i "s/^upload_max_filesize =.*/upload_max_filesize = 1024M/" "$caminho_php_ini"
if [ $? -eq 0 ]; then
    echo "2/7 - [ OK ] - Modificando upload_max_filesize para 1024M"
else
    echo "2/7 - [ OFF ] - Modificando upload_max_filesize para 1024M"
fi
sed -i "s/^max_execution_time =.*/max_execution_time = 450/" "$caminho_php_ini"
if [ $? -eq 0 ]; then
    echo "3/7 - [ OK ] - Modificando max_execution_time para 450"
else
    echo "3/7 - [ OFF ] - Modificando max_execution_time para 450"
fi
sed -i "s/^memory_limit =.*/memory_limit = 1024M/" "$caminho_php_ini"
if [ $? -eq 0 ]; then
    echo "4/7 - [ OK ] - Modificando memory_limit para 1024M"
else
    echo "4/7 - [ OFF ] - Modificando memory_limit para 1024M"
fi
cd

caminho_wp_config="/var/lib/docker/volumes/wordpress_$nome_site_wordpress/_data/wp-config.php"
if [ $? -eq 0 ]; then
    echo "5/7 - [ OK ] - Pegando arquivo wp-config.php"
else
    echo "5/7 - [ OFF ] - Pegando arquivo wp-config.php"
fi
sed -i "/\/\* Add any custom values between this line and the \"stop editing\" line. \*\//i\\
define( 'WP_REDIS_HOST', 'redis' );\n\
define( 'WP_REDIS_PORT', 6379 );\n" "$caminho_wp_config"

if [ $? -eq 0 ]; then
    echo "6/7 - [ OK ] - Adicionando configurações do Redis no wp-config.php"
else
    echo "6/7 - [ OFF ] - Adicionando configurações do Redis no wp-config.php"
fi

docker service update --force wordpress_${nome_site_wordpress}_wordpress_$nome_site_wordpress > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "7/7 - [ OK ] - Aplicando atualização no php.ini"
else
    echo "7/7 - [ OK ] - Aplicando atualização no php.ini"
fi
echo ""

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[7/7]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_wordpress para verificar se o serviço esta online
wait_stack "wordpress_$nome_site_wordpress"

telemetria Wordpress finalizado

cd dados_vps

cat > wordpress_$nome_do_servico_wordpress <<EOL
[ WORDPRESS ]

Dominio do Wordpress: https://$url_wordpress

Arquivos do site: /var/lib/docker/volumes/wordpress_$nome_site_wordpress/_data

Arquivos do php: /var/lib/docker/volumes/wordpress_${nome_site_wordpress}_php/_data
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ WORDPRESS ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_wordpress\e[0m"
echo ""

echo -e "\e[33mArquivos do site:\e[97m /var/lib/docker/volumes/wordpress_$nome_site_wordpress/_data\e[0m"
echo ""

echo -e "\e[33mArquivos do php:\e[97m /var/lib/docker/volumes/wordpress_${nome_site_wordpress}_php/_data\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  █████╗ ███████╗███████╗██████╗  ██████╗ ██╗    ██╗
## ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔═══██╗██║    ██║
## ██████╔╝███████║███████╗█████╗  ██████╔╝██║   ██║██║ █╗ ██║
## ██╔══██╗██╔══██║╚════██║██╔══╝  ██╔══██╗██║   ██║██║███╗██║
## ██████╔╝██║  ██║███████║███████╗██║  ██║╚██████╔╝╚███╔███╔╝
## ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝

ferramenta_baserow() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_baserow

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o dominio para o Baserow (ex: baserow.oriondesign.art.br): \e[0m" && read -r url_baserow
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r mail_baserow
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_baserow
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r pass_baserow
    echo ""


    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_baserow
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a Porta SMTP do Email (ex: 465): \e[0m" && read -r porta_baserow
    echo ""


    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_baserow" -eq 465 ]; then
    ssl_baserow_environments="- EMAIL_SMTP_USE_SSL=true"
    else
    ssl_baserow_environments="- EMAIL_SMTP_USE_TLS=true"
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_baserow

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o Baserow:\e[97m $url_baserow\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mEmail do SMTP:\e[97m $mail_baserow\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mUsuário do SMTP:\e[97m $user_baserow\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mSenha do SMTP:\e[97m $pass_baserow\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mHost do SMTP:\e[97m $host_baserow\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mPorta do SMTP:\e[97m $porta_baserow\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_baserow

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO BASEROW \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Baserow iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "baserow${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "baserow${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO BASEROW \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando a stack baserow.yaml
cat > baserow${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  baserow${1:+_$1}:
    image: baserow/baserow:latest ## Versão do Baserow

    volumes:
      - baserow${1:+_$1}_data:/baserow/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Url do baserow
      - BASEROW_PUBLIC_URL=https://$url_baserow

      ## Porta do baserow
      - BASEROW_CADDY_ADDRESSES=:80

      ## Dados SMTP
      - EMAIL_SMTP=true ## Ativar/Desativar SMTP
      - FROM_EMAIL=$mail_baserow ## Email
      - EMAIL_SMTP_USER=$user_baserow ## Email (ou usuario)
      - EMAIL_SMTP_PASSWORD=$pass_baserow ## Senha do SMTP
      - EMAIL_SMTP_HOST=$host_baserow ## Host SMTP
      - EMAIL_SMTP_PORT=$porta_baserow ## Porta SMTP
      $ssl_baserow_environments

      ## Dados Redis
      - REDIS_URL=redis://redis:6379/11

      ## Dados postgres:
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/baserow${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      #resources:
      #  limits:
      #    cpus: "1"
      #    memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.baserow${1:+_$1}.rule=Host(\`$url_baserow\`)
        - traefik.http.services.baserow${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.baserow${1:+_$1}.service=baserow${1:+_$1}
        - traefik.http.routers.baserow${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.baserow${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.baserow${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  baserow${1:+_$1}_data:
    external: true
    name: baserow${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true

EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Baserow"
fi

STACK_NAME="baserow${1:+_$1}"
stack_editavel # > /dev/null 2>&1

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_baserow para verificar se o serviço esta online
wait_stack "baserow${1:+_$1}"

telemetria Baserow finalizado

cd dados_vps

cat > dados_baserow${1:+_$1} <<EOL
[ BASEROW ]

Dominio do Baserow: https://$url_baserow

Usuario: Precisa criar no primeiro acesso do Baserow

Senha: Precisa criar no primeiro acesso do Baserow

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ BASEROW ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_baserow\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Baserow\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Baserow\e[0m"
echo ""

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ███╗ ██████╗ ███╗   ██╗ ██████╗  ██████╗ ██████╗ ██████╗
## ████╗ ████║██╔═══██╗████╗  ██║██╔════╝ ██╔═══██╗██╔══██╗██╔══██╗
## ██╔████╔██║██║   ██║██╔██╗ ██║██║  ███╗██║   ██║██║  ██║██████╔╝
## ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║██║   ██║██║  ██║██╔══██╗
## ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝██████╔╝
## ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝

ferramenta_mongodb() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_mongodb

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o nome de usuario
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: @\!#$ e/ou espaço"
    echo -en "\e[33mDigite o nome de usuario (ex: oriondesign): \e[0m" && read -r user_mongo
    echo ""

    ## Gera a senha aleatória
    pass_mongo=$(openssl rand -hex 16)

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_mongodb

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação do Usuario
    echo -e "\e[33mUsuario:\e[97m $user_mongo\e[0m"
    echo ""

    ## Informação da Senha gerada
    echo -e "\e[33mSenha gerada:\e[97m $pass_mongo\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_mongodb

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MONGO DB \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria MongoDB iniciado

## NADA NADA NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MONGO DB \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack mongodb.yaml
cat > mongodb${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  mongodb${1:+_$1}:
    image: mongo:latest
    command: mongod --port 27017

    volumes:
      - mongodb${1:+_$1}_data:/data/db
      - mongodb${1:+_$1}_dump:/dump
      - mongodb${1:+_$1}_configdb_data:/data/configdb

    networks:
      - $nome_rede_interna
    #ports:
    #  - 27017:27017

    environment:
      ## Dados de acesso
      - MONGO_INITDB_ROOT_USERNAME=$user_mongo
      - MONGO_INITDB_ROOT_PASSWORD=$pass_mongo
      - PUID=1000
      - PGID=1000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: '1'
          memory: 2048M

## --------------------------- ORION --------------------------- ##

volumes:
  mongodb${1:+_$1}_data:
    external: true
    name: mongodb${1:+_$1}_data
  mongodb${1:+_$1}_dump:
    external: true
    name: mongodb${1:+_$1}_dump
  mongodb${1:+_$1}_configdb_data:
    external: true
    name: mongodb${1:+_$1}_configdb_data

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do MongoDB"
fi
STACK_NAME="mongodb${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c mongodb.yaml mongodb > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do MongoDB"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "mongodb" para verificar se o serviço esta online
wait_stack "mongodb${1:+_$1}"

telemetria MongoDB finalizado

cd dados_vps

read -r ip _ <<<$(hostname -I)
ip_vps=$ip

cat > dados_mongodb${1:+_$1} <<EOL
[ MONGODB ]

Dominio do MongoDB: MongoDB://$user_mongo:$pass_mongo@$ip_vps:27017/?authSource=admin&readPreference=primary&ssl=false&directConnection=true

Usuario: $user_mongo

Senha: $pass_mongo

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MONGODB ]\e[0m"
echo ""
echo -e "\e[33mUsuario:\e[97m $user_mongo\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_mongo\e[0m"
echo ""

echo -e "\e[33mUrl Database:\e[97m mongodb://$user_mongo:$pass_mongo@$ip_vps:27017/?authSource=admin&readPreference=primary&ssl=false&directConnection=true\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  █████╗ ██████╗ ██████╗ ██╗████████╗███╗   ███╗ ██████╗
## ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║╚══██╔══╝████╗ ████║██╔═══██╗
## ██████╔╝███████║██████╔╝██████╔╝██║   ██║   ██╔████╔██║██║   ██║
## ██╔══██╗██╔══██║██╔══██╗██╔══██╗██║   ██║   ██║╚██╔╝██║██║▄▄ ██║
## ██║  ██║██║  ██║██████╔╝██████╔╝██║   ██║   ██║ ╚═╝ ██║╚██████╔╝
## ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚═╝   ╚═╝   ╚═╝     ╚═╝ ╚══▀▀═╝

ferramenta_rabbitmq() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_rabbitmq

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio do RabbitMq
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o RabbitMQ (ex: rabbitmq.oriondesign.art.br): \e[0m" && read -r url_rabbitmq
    echo ""

    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: @\!#$ e/ou espaço"
    echo -en "\e[33mDigite o nome de usuario (ex: OrionDesign): \e[0m" && read -r user_rabbitmq
    echo ""

    ## Gera a senha aleatória
    pass_rabbitmq=$(openssl rand -hex 16)

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_rabbitmq

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação do Dominio do RabbitMQ
    echo -e "\e[33mDominio do RabbitMQ:\e[97m $url_rabbitmq\e[0m"
    echo ""

    ## Informação do Usuario do RabbitMQ
    echo -e "\e[33mUsario:\e[97m $user_rabbitmq\e[0m"
    echo ""

    ## Informação da Senha do RabbitMQ
    echo -e "\e[33mSenha:\e[97m $pass_rabbitmq\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_rabbitmq

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done
## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO RABBITMQ \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria RabbitMQ iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO RABBITMQ \e[33m[2/3]\e[0m"
echo ""
sleep 1

#Key aleatória cookie
key_cookie=$(openssl rand -hex 16)

## Criando a stack rabbitmq.yaml
cat > rabbitmq${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  rabbitmq${1:+_$1}:
    image: rabbitmq:management
    command: rabbitmq-server

    hostname: rabbitmq

    volumes:
      - rabbitmq${1:+_$1}_data:/var/lib/rabbitmq

    networks:
      - $nome_rede_interna
    #ports:
    #  - 5672:5672
    #  - 15672:15672

    environment:
      ## Dados de acesso
      RABBITMQ_DEFAULT_USER: $user_rabbitmq
      RABBITMQ_DEFAULT_PASS: $pass_rabbitmq
      RABBITMQ_ERLANG_COOKIE: $key_cookie
      RABBITMQ_DEFAULT_VHOST: "/"

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 512M
      labels:
        - traefik.enable=true
        - traefik.http.routers.rabbitmq${1:+_$1}.rule=Host(\`$url_rabbitmq\`)
        - traefik.http.routers.rabbitmq${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.rabbitmq${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.rabbitmq${1:+_$1}.service=rabbitmq${1:+_$1}
        - traefik.http.services.rabbitmq${1:+_$1}.loadbalancer.server.port=15672

## --------------------------- ORION --------------------------- ##

volumes:
  rabbitmq${1:+_$1}_data:
    external: true

networks:
  $nome_rede_interna:
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do RabbitMQ"
fi
STACK_NAME="rabbitmq${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c rabbitmq.yaml rabbitmq > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do RabbitMQ"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "pgadmin_4" para verificar se o serviço esta online
wait_stack "rabbit${1:+_$1}"

telemetria RabbitMQ finalizado

cd dados_vps

ip_vps=$(curl -s ifconfig.me)

cat > dados_rabbitmq${1:+_$1} <<EOL
[ RABBITMQ ]

Dominio do RabbitMq: $url_rabbitmq

Usuario: $user_rabbitmq

Senha: $pass_rabbitmq

URL: amqp://$user_rabbitmq:$pass_rabbitmq@rabbitmq:5672
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ RABBITMQ ]\e[0m"
echo ""
echo -e "\e[33mDominio:\e[97m https://$url_rabbitmq\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_rabbitmq\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_rabbitmq\e[0m"
echo ""

echo -e "\e[33mURL:\e[97m amqp://$user_rabbitmq:$pass_rabbitmq@rabbitmq:5672\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}


ferramenta_poker() {
  # Limpa o terminal
  clear

  # Ativa a função dados para pegar os dados da vps
  dados

  # Mostra o nome da aplicação
  nome_poker

  # Mostra mensagem para preencher informações
  preencha_as_info

  # Inicia um Loop até os dados estarem certos
  while true; do

    # Pergunta o Dominio do poker
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Poker (ex: poker.oriondesign.art.br): \e[0m" && read -r url_poker
    echo ""

    # Limpa o terminal
    clear

    # Mostra o nome da aplicação
    nome_poker

    # Mostra mensagem para verificar as informações
    conferindo_as_info

    # Informação do Dominio do poker
    echo -e "\e[33mDominio do Poker:\e[97m $url_poker\e[0m"
    echo ""

    # Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        # Digitou Y para confirmar que as informações estão corretas

        # Limpar o terminal
        clear

        # Mostrar mensagem de Instalando
        instalando_msg

        # Sai do Loop
        break
    else

        # Digitou N para dizer que as informações não estão corretas.

        # Limpar o terminal
        clear

        # Mostra o nome da ferramenta
        nome_poker

        # Mostra mensagem para preencher informações
        preencha_as_info

    # Volta para o inicio do loop com as perguntas
    fi
  done

  # Mensagem de Passo
  echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO POKER \e[33m[1/3]\e[0m"
  echo ""
  sleep 1

  telemetria "Poker" "iniciado"

  # Mensagem de Passo
  echo -e "\e[97m• INSTALANDO POKER \e[33m[2/3]\e[0m"
  echo ""
  sleep 1

  # Criando a stack poker.yaml
  cat > poker${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- POKER --------------------------- ##

  poker${1:+_$1}:
    image: ofcedsoncosta/poker-web:latest
    ports:
      - "3030:3030"
    environment:
      - NODE_ENV=production
    volumes:
      - poker${1:+_$1}:/app/data
    networks:
      - $nome_rede_interna
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.poker${1:+_$1}.rule=Host(\$url_poker\)
        - traefik.http.routers.poker${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.poker${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.poker${1:+_$1}.loadBalancer.server.port=3030
        - traefik.http.routers.poker${1:+_$1}.service=poker${1:+_$1}

## --------------------------- POKER --------------------------- ##

volumes:
  poker${1:+_$1}:
    external: true
    name: poker${1:+_$1}

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
  if [ $? -eq 0 ]; then
      echo "1/10 - [ OK ] - Criando Stack"
  else
      echo "1/10 - [ OFF ] - Criando Stack"
      echo "Não foi possível criar a stack do Poker"
  fi
  STACK_NAME="poker${1:+_$1}"
  stack_editavel # > /dev/null 2>&1

  # Mensagem de Passo
  echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
  echo ""
  sleep 1

  # Usa o serviço wait_stack "poker" para verificar se o serviço está online
  wait_stack "poker${1:+_$1}"

  telemetria "Poker" "finalizado"

  cd dados_vps

  ip_vps=$(curl -s ifconfig.me)

  cat > dados_poker${1:+_$1} <<EOL
[ POKER ]

Dominio do Poker: $url_poker

Usuario: Precisa criar dentro do Poker

Senha: Precisa criar dentro do Poker

EOL

  cd
  cd

  ## Espera 30 segundos
  wait_30_sec

  ## Mensagem de finalizado
  instalado_msg

  ## Mensagem de Guarde os Dados
  guarde_os_dados_msg

  ## Dados da Aplicação:
  echo -e "\e[32m[ POKER ] \e[0m"
  echo ""

  echo -e "\e[33mDominio:\e[97m https://$url_poker\e[0m"
  echo ""

  echo -e "\e[33mUsuario:\e[97m Precisa criar dentro do Poker\e[0m"
  echo ""

  echo -e "\e[33mSenha:\e[97m Precisa criar dentro do Poker\e[0m"

}

## ██╗   ██╗██████╗ ████████╗██╗███╗   ███╗███████╗    ██╗  ██╗██╗   ██╗███╗   ███╗ █████╗
## ██║   ██║██╔══██╗╚══██╔══╝██║████╗ ████║██╔════╝    ██║ ██╔╝██║   ██║████╗ ████║██╔══██╗
## ██║   ██║██████╔╝   ██║   ██║██╔████╔██║█████╗      █████╔╝ ██║   ██║██╔████╔██║███████║
## ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██╔══╝      ██╔═██╗ ██║   ██║██║╚██╔╝██║██╔══██║
## ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║███████╗    ██║  ██╗╚██████╔╝██║ ╚═╝ ██║██║  ██║
##  ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝

ferramenta_uptimekuma() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_uptimekuma

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio do uptime kuma
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Uptime Kuma (ex: uptimekuma.oriondesign.art.br): \e[0m" && read -r url_uptimekuma
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_uptimekuma

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação do Dominio do uptimekuma
    echo -e "\e[33mDominio do Uptime Kuma:\e[97m $url_uptimekuma\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_mongodb

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO UPTIME KUMA \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria "Uptime Kuma" "iniciado"

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO UPTIME KUMA \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack uptimekuma.yaml
cat > uptimekuma${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  uptimekuma${1:+_$1}:
    image: louislam/uptime-kuma:latest

    volumes:
      - uptimekuma${1:+_$1}:/app/data

    networks:
      - $nome_rede_interna

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.uptimekuma${1:+_$1}.rule=Host(\`$url_uptimekuma\`)
        - traefik.http.routers.uptimekuma${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.uptimekuma${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.uptimekuma${1:+_$1}.loadBalancer.server.port=3001
        - traefik.http.routers.uptimekuma${1:+_$1}.service=uptimekuma${1:+_$1}

## --------------------------- ORION --------------------------- ##

volumes:
  uptimekuma${1:+_$1}:
    external: true
    name: uptimekuma${1:+_$1}

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Uptime Kuma"
fi
STACK_NAME="uptimekuma${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c uptimekuma.yaml uptimekuma #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Uptime Kuma"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "uptimekuma" para verificar se o serviço esta online
wait_stack "uptimekuma${1:+_$1}"

telemetria "Uptime Kuma" "finalizado"

cd dados_vps

ip_vps=$(curl -s ifconfig.me)

cat > dados_uptimekuma${1:+_$1} <<EOL
[ UPTIME KUMA ]

Dominio do Uptime Kuma: $url_uptimekuma

Usuario: Precisa criar dentro do Uptime Kuma

Senha: Precisa criar dentro do Uptime Kuma

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ UPTIME KUMA ] \e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_uptimekuma\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar dentro do Uptime Kuma\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar dentro do Uptime Kuma\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ █████╗ ██╗      ██████╗ ██████╗ ███╗   ███╗
## ██╔════╝██╔══██╗██║     ██╔════╝██╔═══██╗████╗ ████║
## ██║     ███████║██║     ██║     ██║   ██║██╔████╔██║
## ██║     ██╔══██║██║     ██║     ██║   ██║██║╚██╔╝██║
## ╚██████╗██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║
##  ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝

ferramenta_calcom() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_calcom

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o dominio para o Cal (ex: calcom.oriondesign.art.br): \e[0m" && read -r url_calcom
    echo ""

    ## Pergunta o email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_calcom
    echo ""

    ## Pergunta o Ususario SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuario para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_calcom
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_calcom
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_calcom
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_calcom
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_calcom

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Cal.com\e[97m $url_calcom\e[0m"
    echo ""

    ## Informação sobre Email SMTP
    echo -e "\e[33mEmail SMTP:\e[97m $email_calcom\e[0m"
    echo ""

    ## Informação sobre Email SMTP
    echo -e "\e[33mUser SMTP:\e[97m $user_calcom\e[0m"
    echo ""

    ## Informação sobre Senha SMTP
    echo -e "\e[33mSenha SMTP:\e[97m $senha_email_calcom\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP:\e[97m $smtp_email_calcom\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_calcom\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_calcom

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO CALCOM \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Calcom iniciado

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "calcom${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "calcom${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO CAL.COM \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando key aleatória
secret=$(openssl rand -hex 16)

## Criando a stack calcom.yaml
cat > calcom${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  calcom${1:+_$1}_app:
    image: calcom/cal.com:v4.7.8

    networks:
      - $nome_rede_interna

    environment:
    ## Licenças
      - NEXT_PUBLIC_LICENSE_CONSENT=agree
      - LICENSE=agree
      #- CALCOM_LICENSE_KEY= ## Descomente este campo caso tenha licença do mesmo

    ## URLs
      - NEXT_PUBLIC_WEBAPP_URL=https://$url_calcom
      - BASE_URL=https://$url_calcom
      - NEXTAUTH_URL=https://$url_calcom
      - NEXT_PUBLIC_CONSOLE_URL=https://$url_calcom
      - NEXT_PUBLIC_APP_URL=https://$url_calcom
      - NEXT_PUBLIC_WEBSITE_URL=https://$url_calcom
      - WEB_APP=https://$url_calcom

    ## Encrypition
      - NEXTAUTH_SECRET=$secret
      - CALENDSO_ENCRYPTION_KEY=$secret

    ## Dados Postgress
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/calcom${1:+_$1}
      - DATABASE_DIRECT_URL=postgresql://postgres:$senha_postgres@postgres:5432/calcom${1:+_$1}
      - CALENDSO_ENCRYPTION_KEY=postgresql://postgres:$senha_postgres@postgres:5432/calcom${1:+_$1}

    ## Configurações de Email e SMTP
      - EMAIL_FROM=$email_calcom
      - EMAIL_SERVER_HOST=$smtp_email_calcom
      - EMAIL_SERVER_PORT=$porta_smtp_calcom
      - EMAIL_SERVER_USER=$user_calcom
      - EMAIL_SERVER_PASSWORD=$senha_email_calcom

    ## Nodes
      - NODE_ENV=production
      #- NODE_TLS_REJECT_UNAUTHORIZED=0

    ## Brand
      #- NEXT_PUBLIC_APP_NAME="Cal.com"
      #- NEXT_PUBLIC_SUPPORT_MAIL_ADDRESS="help@cal.com"
      #- NEXT_PUBLIC_COMPANY_NAME="Cal.com, Inc."
      #- NEXT_PUBLIC_DISABLE_SIGNUP=false ## false = novas inscrições permitidas | true = novas incrições fechadas

    ## Integração com Google (Calendario & Meet)
      #-GOOGLE_LOGIN_ENABLED=false
      #-GOOGLE_API_CREDENTIALS=

    ## Integração com Microsoft 365
      #- MS_GRAPH_CLIENT_ID=
      #- MS_GRAPH_CLIENT_SECRET=

    ## Integração com Zoom
      #- ZOOM_CLIENT_ID=
      #- ZOOM_CLIENT_SECRET=

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
      - traefik.enable=true
      - traefik.http.routers.calcom${1:+_$1}_app.rule=Host(\`$url_calcom\`)
      - traefik.http.routers.calcom${1:+_$1}_app.entrypoints=websecure
      - traefik.http.routers.calcom${1:+_$1}_app.priority=1
      - traefik.http.routers.calcom${1:+_$1}_app.tls.certresolver=letsencryptresolver
      - traefik.http.routers.calcom${1:+_$1}_app.service=calcom${1:+_$1}_app
      - traefik.http.services.calcom${1:+_$1}_app.loadbalancer.server.port=3000
      - traefik.http.services.calcom${1:+_$1}_app.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do CalCom"
fi
STACK_NAME="calcom${1:+_$1}"
stack_editavel # > /dev/null 2>&1

telemetria Calcom finalizado
#docker stack deploy --prune --resolve-image always -c calcom.yaml calcom  > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do CalCom"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "calcom" para verificar se o serviço esta online
wait_stack "calcom${1:+_$1}"

cd dados_vps

cat > dados_calcom${1:+_$1} <<EOL
[ CAL.COM ]

Dominio do CalCom: $url_calcom

Usuario: Precisa criar dentro do Calcom

Senha: Precisa criar dentro do Calcom

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ CAL.COM ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_calcom\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar dentro do Calcom\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar dentro do Calcom\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ███╗ █████╗ ██╗   ██╗████████╗██╗ ██████╗
## ████╗ ████║██╔══██╗██║   ██║╚══██╔══╝██║██╔════╝
## ██╔████╔██║███████║██║   ██║   ██║   ██║██║
## ██║╚██╔╝██║██╔══██║██║   ██║   ██║   ██║██║
## ██║ ╚═╝ ██║██║  ██║╚██████╔╝   ██║   ██║╚██████╗
## ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝

ferramenta_mautic() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_mautic

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o Mautic (ex: mautic.oriondesign.art.br): \e[0m" && read -r url_mautic
    echo ""

    ## Pergunta o usuario da ferramenta
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ e/ou espaços"
    echo -en "\e[33mDigite um usuario (ex: OrionDesign): \e[0m" && read -r user_mautic
    echo ""

    ## Pergunta o email da ferramenta
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -en "\e[33mDigite o Email de admin: (ex: contato@oriondesign.art.br): \e[0m" && read -r email_mautic
    echo ""

    ## Pergunta o senha da ferramenta
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma Senha (ex: @Senha123_): \e[0m" && read -r senha_email_mautic
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_mautic

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Mautic:\e[97m $url_mautic\e[0m"
    echo ""

    ## Informação sobre Usuario Admin
    echo -e "\e[33mUsuario admin:\e[97m $user_mautic\e[0m"
    echo ""

    ## Informação sobre Email Admin
    echo -e "\e[33mEmail do admin:\e[97m $email_mautic\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mSenha do Admin:\e[97m $senha_email_mautic\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_mautic

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MAUTIC \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Mautic iniciado

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/4]\e[0m"
echo ""
sleep 1

dados

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "mautic${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "mautic${1:+_$1}"
    fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MAUTIC \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack mautic.yaml
cat > mautic${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  mautic_web${1:+_$1}:
    image: mautic/mautic:latest ## Versão do Mautic

    volumes:
      - mautic${1:+_$1}_config:/var/www/html/config
      - mautic${1:+_$1}_docroot:/var/www/html/docroot
      - mautic${1:+_$1}_media:/var/www/html/docroot/media
      - mautic${1:+_$1}_logs:/var/www/html/var/logs
      - mautic${1:+_$1}_cron:/opt/mautic/cron

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados MySQL
      - MAUTIC_DB_NAME=mautic${1:+_$1}
      - MAUTIC_DB_HOST=mysql
      - MAUTIC_DB_PORT=3306
      - MAUTIC_DB_USER=root
      - MAUTIC_DB_PASSWORD=$senha_mysql

      ## Dados de acesso
      - MAUTIC_ADMIN_EMAIL=$email_mautic
      - MAUTIC_ADMIN_USERNAME=$user_mautic
      - MAUTIC_ADMIN_PASSWORD=$senha_email_mautic
      - MAUTIC_URL=https://$url_mautic

      ## Configurações
      - MAUTIC_TRUSTED_PROXIES=["0.0.0.0/0"]
      - DOCKER_MAUTIC_ROLE=mautic_web
      - DOCKER_MAUTIC_WORKERS_CONSUME_EMAIL=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_HIT=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_FAILED=2

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 2048M
      labels:
        - traefik.enable=true
        - traefik.http.routers.mautic${1:+_$1}.rule=Host(\`$url_mautic\`) # substitua SeuDominio.com.br pelo seu domínio
        - traefik.http.services.mautic${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.mautic${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.mautic${1:+_$1}.service=mautic${1:+_$1}
        - traefik.http.routers.mautic${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.mautic${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

  mautic_worker${1:+_$1}:
    image: mautic/mautic:latest ## Versão do Mautic

    volumes:
      - mautic${1:+_$1}_config:/var/www/html/config
      - mautic${1:+_$1}_docroot:/var/www/html/docroot
      - mautic${1:+_$1}_media:/var/www/html/docroot/media
      - mautic${1:+_$1}_logs:/var/www/html/var/logs
      - mautic${1:+_$1}_cron:/opt/mautic/cron

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados MySQL
      - MAUTIC_DB_NAME=mautic${1:+_$1}
      - MAUTIC_DB_HOST=mysql
      - MAUTIC_DB_PORT=3306
      - MAUTIC_DB_USER=root
      - MAUTIC_DB_PASSWORD=$senha_mysql

      ## Dados de acesso
      - MAUTIC_ADMIN_EMAIL=$email_mautic
      - MAUTIC_ADMIN_USERNAME=$user_mautic
      - MAUTIC_ADMIN_PASSWORD=$senha_email_mautic
      - MAUTIC_URL=https://$url_mautic

      ## Configurações
      - MAUTIC_TRUSTED_PROXIES=["0.0.0.0/0"]
      - DOCKER_MAUTIC_ROLE=mautic_worker
      - DOCKER_MAUTIC_WORKERS_CONSUME_EMAIL=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_HIT=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_FAILED=2

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 2048M

## --------------------------- ORION --------------------------- ##

  mautic_cron${1:+_$1}:
    image: mautic/mautic:latest ## Versão do Mautic

    volumes:
      - mautic${1:+_$1}_config:/var/www/html/config
      - mautic${1:+_$1}_docroot:/var/www/html/docroot
      - mautic${1:+_$1}_media:/var/www/html/docroot/media
      - mautic${1:+_$1}_logs:/var/www/html/var/logs
      - mautic${1:+_$1}_cron:/opt/mautic/cron

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados MySQL
      - MAUTIC_DB_NAME=mautic${1:+_$1}
      - MAUTIC_DB_HOST=mysql
      - MAUTIC_DB_PORT=3306
      - MAUTIC_DB_USER=root
      - MAUTIC_DB_PASSWORD=$senha_mysql

      ## Dados de acesso
      - MAUTIC_ADMIN_EMAIL=$email_mautic
      - MAUTIC_ADMIN_USERNAME=$user_mautic
      - MAUTIC_ADMIN_PASSWORD=$senha_email_mautic
      - MAUTIC_URL=https://$url_mautic

      ## Configurações
      - MAUTIC_TRUSTED_PROXIES=["0.0.0.0/0"]
      - DOCKER_MAUTIC_ROLE=mautic_cron
      - DOCKER_MAUTIC_WORKERS_CONSUME_EMAIL=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_HIT=2
      - DOCKER_MAUTIC_WORKERS_CONSUME_FAILED=2

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 512M

## --------------------------- ORION --------------------------- ##

volumes:
  mautic${1:+_$1}_config:
    external: true
    name: mautic${1:+_$1}_config
  mautic${1:+_$1}_docroot:
    external: true
    name: mautic${1:+_$1}_docroot
  mautic${1:+_$1}_media:
    external: true
    name: mautic${1:+_$1}_media
  mautic${1:+_$1}_logs:
    external: true
    name: mautic${1:+_$1}_logs
  mautic${1:+_$1}_cron:
    external: true
    name: mautic${1:+_$1}_cron

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Mautic"
fi
STACK_NAME="mautic${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c mautic.yaml mautic > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Mautic"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "mautic" para verificar se o serviço esta online
wait_stack "mautic${1:+_$1}"

telemetria Mautic finalizado

cd dados_vps

cat > dados_mautic${1:+_$1} <<EOL
[ MAUTIC 5 ]

Dominio do Mautic: $url_mautic

Usuario: $user_mautic

Email: $email_mautic

Senha: $senha_email_mautic

Database Name: mautic${1:+_$1}

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MAUTIC 5 ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_mautic\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_mautic\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m $email_mautic\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $senha_email_mautic\e[0m"
echo ""

echo -e "\e[33mDatabase Name:\e[97m mautic${1:+_$1}\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  █████╗ ██████╗ ██████╗ ███████╗███╗   ███╗██╗████████╗██╗  ██╗
## ██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗ ████║██║╚══██╔══╝██║  ██║
## ███████║██████╔╝██████╔╝███████╗██╔████╔██║██║   ██║   ███████║
## ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║
## ██║  ██║██║     ██║     ███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║
## ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝

ferramenta_appsmith() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_appsmith

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Appsmith (ex: appsmith.oriondesign.art.br): \e[0m" && read -r url_appsmith
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_appsmith

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Appsmith\e[97m $url_appsmith\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_appsmith

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO APPSMITH \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Appsmith iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO APPSMITH \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando uma Encryption Key Aleatória
secret=$(openssl rand -hex 16)

## Criando a stack appsmith.yaml
cat > appsmith${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  appsmith${1:+_$1}:
    image: appsmith/appsmith-ee:latest

    volumes:
      - appsmith${1:+_$1}_data:/appsmith-stacks

    networks:
      - $nome_rede_interna

    environment:
      ## Url Appsmith
      - APPSMITH_CUSTOM_DOMAIN=https://$url_appsmith

      ## Ativar/Desativar Novas Inscrições
      - APPSMITH_SIGNUP_DISABLED=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 2048M
      labels:
        - traefik.enable=true
        - traefik.http.routers.appsmith${1:+_$1}.rule=Host(\`$url_appsmith\`)
        - traefik.http.routers.appsmith${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.appsmith${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.appsmith${1:+_$1}.service=appsmith${1:+_$1}
        - traefik.http.services.appsmith${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.services.appsmith${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  appsmith${1:+_$1}_data:
    external: true
    name: appsmith${1:+_$1}_data

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Appsmith"
fi
STACK_NAME="appsmith${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c appsmith.yaml appsmith  > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Appsmith"
#fi


## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "nocobase" para verificar se o serviço esta online
wait_stack "appsmith${1:+_$1}"

telemetria Appsmith finalizado

cd dados_vps

cat > dados_appsmith${1:+_$1} <<EOL
[ APPSMITH ]

Dominio do Appsmith: https://$url_nocobase

Usuario: Precisa criar no primeiro acesso do Appsmith

Senha: Precisa criar no primeiro acesso do Appsmith
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ APPSMITH ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_appsmith\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Appsmith\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Appsmith\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██████╗ ██████╗  █████╗ ███╗   ██╗████████╗
## ██╔═══██╗██╔══██╗██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝
## ██║   ██║██║  ██║██████╔╝███████║██╔██╗ ██║   ██║
## ██║▄▄ ██║██║  ██║██╔══██╗██╔══██║██║╚██╗██║   ██║
## ╚██████╔╝██████╔╝██║  ██║██║  ██║██║ ╚████║   ██║
##  ╚══▀▀═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝

ferramenta_qdrant() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_qdrant

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    read -r ip _ <<<$(hostname -I)
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o ip da vps (seu ip: $ip) ou dominio para Qdrant (ex: qdrant.oriondesign.art.br): \e[0m" && read -r ip_vps
    echo ""

    ## Pergunta quandos nodes deseja
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite quantos Nodes você deseja (recomendado: 5): \e[0m" && read -r nodes_qdrant
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_qdrant

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mIp da VPS ou Dominio:\e[97m $ip_vps\e[0m"
    echo ""

    ## Informação sobre quantidade de nodes
    echo -e "\e[33mQuantidade de Nodes:\e[97m $nodes_qdrant\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_qdrant

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO QDRANT \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria QDrant iniciado

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO QDRANT \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack qdrant.yaml
cat <<EOL > qdrant.yaml
version: "3.7"
services:
EOL

for ((i=0; i< $nodes_qdrant; i++)); do
  node_name="qdrant_node_$i"
  volume_name="qdrant_data_$i"

  cat <<EOL >> qdrant.yaml

  ## --------------------------- ORION --------------------------- ##

  $node_name:
    image: qdrant/qdrant:latest ## Versão do Qdrant

    volumes:
      - $volume_name:/qdrant

    networks:
      - $nome_rede_interna

    ports:
      - "$((6333 + i * 10)):6333"
      - "$((6334 + i * 10)):6334"

    environment:
      - QDRANT__SERVICE__GRPC_PORT=6334
      - QDRANT__CLUSTER__ENABLED=true
      - QDRANT__CLUSTER__P2P__PORT=6335
      - QDRANT__CLUSTER__CONSENSUS__MAX_MESSAGE_QUEUE_SIZE=5000
      - QDRANT__LOG_LEVEL=debug,raft=info

    deploy:
      resources:
        limits:
          cpus: "0.3"
EOL

  if ((i == 0)); then
    echo "    command: ./qdrant --uri 'http://qdrant_node_0:6335'" >> qdrant.yaml
  else
    echo "    command: bash -c \"sleep $((10 + i * 3)) && ./qdrant --bootstrap 'http://qdrant_node_0:6335' --uri 'http://qdrant_node_$i:6335'\"" >> qdrant.yaml
  fi

  echo "" >> qdrant.yaml
done

cat <<EOL >> qdrant.yaml
## --------------------------- ORION --------------------------- ##

volumes:
EOL

for ((i=0; i< $nodes_qdrant; i++)); do
  volume_name="qdrant_data_$i"
  echo "  $volume_name:" >> qdrant.yaml
done

cat <<EOL >> qdrant.yaml
networks:
  $nome_rede_interna:
EOL

if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Qdrant"
fi
STACK_NAME="qdrant"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c qdrant.yaml qdrant  > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Qdrant"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "qdrant" para verificar se o serviço esta online
wait_stack "qdrant"

telemetria QDrant finalizado

cd dados_vps

cat > dados_qdrant <<EOL
[ QDRANT ]

Dominio do Qdrant: https://$ip_vps:6333/dashboard

Usuario: Não Tem

Senha: Não Tem
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ QDRANT ]\e[0m"
echo ""

echo -e "\e[33mDashboard:\e[97m http://$ip_vps:6333/dashboard\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Não Tem\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Não Tem\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗    ██╗ ██████╗  ██████╗ ███████╗███████╗██████╗      ██████╗██████╗ ███╗   ███╗
## ██║    ██║██╔═══██╗██╔═══██╗██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔══██╗████╗ ████║
## ██║ █╗ ██║██║   ██║██║   ██║█████╗  █████╗  ██║  ██║    ██║     ██████╔╝██╔████╔██║
## ██║███╗██║██║   ██║██║   ██║██╔══╝  ██╔══╝  ██║  ██║    ██║     ██╔══██╗██║╚██╔╝██║
## ╚███╔███╔╝╚██████╔╝╚██████╔╝██║     ███████╗██████╔╝    ╚██████╗██║  ██║██║ ╚═╝ ██║
##  ╚══╝╚══╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_woofed() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_woofedcrm

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o Dominio para o WoofedCRM (ex: woofedcrm.oriondesign.art.br): \e[0m" && read -r url_woofed
    echo ""

    ## Pergunta o nome do Usuario do Motor
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: @\!#$ e/ou espaço"
    echo -en "\e[33mDigite o User do MOTOR (ex: oriondesign): \e[0m" && read -r email_admin_woofed
    echo ""

    ## Pergunta o nome do Senha do Motor
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$ e/ou espaço"
    echo -en "\e[33mDigite a Senha do MOTOR (ex: @Senha123_): \e[0m" && read -r senha_email_woofed
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_woofedcrm

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre o dominio
    echo -e "\e[33mDominio:\e[97m $url_woofed\e[0m"
    echo ""

    ## Informação sobre o usuario
    echo -e "\e[33mUser MOTOR:\e[97m $email_admin_woofed\e[0m"
    echo ""

    ## Informação sobre a senha
    echo -e "\e[33mSenha MOTOR:\e[97m $senha_email_woofed\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_woofedcrm

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO WOOFED CRM \e[33m[1/7]\e[0m"
echo ""
sleep 1

telemetria WoofedCRM iniciado
dados

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES VECTOR \e[33m[2/7]\e[0m"
echo ""
sleep 1

verificar_container_pgvector
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - PgVector já instalado"
    pegar_senha_pgvector > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do PgVector"
    criar_banco_pgvector_da_stack "woofedcrm${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_pgvector
    pegar_senha_pgvector > /dev/null 2>&1
    criar_banco_pgvector_da_stack "woofedcrm${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/7]\e[0m"
echo ""

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO WOOFED CRM \e[33m[4/7]\e[0m"
echo ""
sleep 1

## Criando uma Encryption Key Aleatória
encryption_key_woofed=$(openssl rand -hex 16)

# Verifica se o arquivo evolution.yaml existe
if [ -f "/root/evolution.yaml" ]; then
    # Extrai os valores do arquivo evolution.yaml e formata no estilo desejado
    EVOLUTION_API_ENDPOINT="- EVOLUTION_API_ENDPOINT=$(grep -oP '(?<=- SERVER_URL=)[^#]*' /root/evolution.yaml | sed 's/ //g')"
    EVOLUTION_API_ENDPOINT_TOKEN="- EVOLUTION_API_ENDPOINT_TOKEN=$(grep -oP '(?<=- AUTHENTICATION_API_KEY=)[^#]*' /root/evolution.yaml | sed 's/ //g')"
else
    # Define os valores padrão se o arquivo não existir
    EVOLUTION_API_ENDPOINT="#- EVOLUTION_API_ENDPOINT="
    EVOLUTION_API_ENDPOINT_TOKEN="#- EVOLUTION_API_ENDPOINT_TOKEN="
fi

## Criando a stack woofedcrm.yaml
cat > woofedcrm${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  woofedcrm${1:+_$1}_web:
    image: douglara/woofedcrm:latest
    command: bundle exec rails s -p 3000 -b 0.0.0.0

    volumes:
      - woofedcrm${1:+_$1}_data:/app/public/assets

    networks:
      - $nome_rede_interna

    environment:
      ## Url WoofedCRM
      - FRONTEND_URL=https://$url_woofed
      - SECRET_KEY_BASE=$encryption_key_woofed

      ## Idioma
      - LANGUAGE=pt-BR

      ## Permitir/Bloquear novas Inscrições
      - ENABLE_USER_SIGNUP=true

      ## Credenciais Motor
      - MOTOR_AUTH_USERNAME=$email_admin_woofed
      - MOTOR_AUTH_PASSWORD=$senha_email_woofed

      ## Endpoints Evolution API
      $EVOLUTION_API_ENDPOINT ## BaseUrl
      $EVOLUTION_API_ENDPOINT_TOKEN ## Global Api Key

      ## Timezone
      - DEFAULT_TIMEZONE=Brasilia

      ## Dados OpenAI
      #- OPENAI_API_KEY=

      ## Dados PgVector
      - DATABASE_URL=postgres://postgres:$senha_pgvector@pgvector:5432/woofedcrm${1:+_$1}

      ## Dados Redis
      - REDIS_URL=redis://redis:6379/0

      ## Dados Storage
      - ACTIVE_STORAGE_SERVICE=local

      ## Modo de Produção
      - RAILS_ENV=production
      - RACK_ENV=production
      - NODE_ENV=production
      - RAILS_LOG_LEVEL=debug

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.woofedcrm${1:+_$1}.rule=Host(\`$url_woofed\`)
        - traefik.http.routers.woofedcrm${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.woofedcrm${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.woofedcrm${1:+_$1}.priority=1
        - traefik.http.routers.woofedcrm${1:+_$1}.service=woofedcrm${1:+_$1}
        - traefik.http.services.woofedcrm${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.services.woofedcrm${1:+_$1}.loadbalancer.passhostheader=true
        - traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https
        - traefik.http.routers.woofedcrm${1:+_$1}.middlewares=sslheader@docker

## --------------------------- ORION --------------------------- ##

  woofedcrm${1:+_$1}_sidekiq:
    image: douglara/woofedcrm:latest
    command: bundle exec sidekiq -C config/sidekiq.yml

    volumes:
      - woofedcrm${1:+_$1}_data:/app/public/assets

    networks:
      - $nome_rede_interna

    environment:
      ## Url WoofedCRM
      - FRONTEND_URL=https://$url_woofed
      - SECRET_KEY_BASE=$encryption_key_woofed

      ## Idioma
      - LANGUAGE=pt-BR

      ## Permitir/Bloquear novas Inscrições
      - ENABLE_USER_SIGNUP=true

      ## Credenciais Motor
      - MOTOR_AUTH_USERNAME=$email_admin_woofed
      - MOTOR_AUTH_PASSWORD=$senha_email_woofed

      ## Endpoints Evolution API
      $EVOLUTION_API_ENDPOINT ## BaseUrl
      $EVOLUTION_API_ENDPOINT_TOKEN ## Global Api Key

      ## Timezone
      - DEFAULT_TIMEZONE=Brasilia

      ## Dados OpenAI
      #- OPENAI_API_KEY=

      ## Dados PgVector
      - DATABASE_URL=postgres://postgres:$senha_pgvector@pgvector:5432/woofedcrm${1:+_$1}

      ## Dados Redis
      - REDIS_URL=redis://redis:6379/0

      ## Dados Storage
      - ACTIVE_STORAGE_SERVICE=local

      ## Modo de Produção
      - RAILS_ENV=production
      - RACK_ENV=production
      - NODE_ENV=production
      - RAILS_LOG_LEVEL=debug

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

  woofedcrm${1:+_$1}_job:
    image: douglara/woofedcrm:latest
    command: bundle exec good_job

    volumes:
      - woofedcrm${1:+_$1}_data:/app/public/assets

    networks:
      - $nome_rede_interna

    environment:
      ## Url WoofedCRM
      - FRONTEND_URL=https://$url_woofed
      - SECRET_KEY_BASE=$encryption_key_woofed

      ## Idioma
      - LANGUAGE=pt-BR

      ## Permitir/Bloquear novas Inscrições
      - ENABLE_USER_SIGNUP=true

      ## Credenciais Motor
      - MOTOR_AUTH_USERNAME=$email_admin_woofed
      - MOTOR_AUTH_PASSWORD=$senha_email_woofed

      ## Endpoints Evolution API
      $EVOLUTION_API_ENDPOINT ## BaseUrl
      $EVOLUTION_API_ENDPOINT_TOKEN ## Global Api Key

      ## Timezone
      - DEFAULT_TIMEZONE=Brasilia

      ## Dados OpenAI
      #- OPENAI_API_KEY=

      ## Dados PgVector
      - DATABASE_URL=postgres://postgres:$senha_pgvector@pgvector:5432/woofedcrm${1:+_$1}

      ## Dados Redis
      - REDIS_URL=redis://redis:6379/0

      ## Dados Storage
      - ACTIVE_STORAGE_SERVICE=local

      ## Modo de Produção
      - RAILS_ENV=production
      - RACK_ENV=production
      - NODE_ENV=production
      - RAILS_LOG_LEVEL=debug

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  woofedcrm${1:+_$1}_data:
    external: true
    name: woofedcrm${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do WoofedCRM"
fi
STACK_NAME="woofedcrm${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c woofedcrm.yaml woofedcrm #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do WoofedCRM"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/7]\e[0m"
wait_30_sec
echo ""
sleep 1
## Usa o serviço wait_stack "woofedcrm" para verificar se o serviço esta online
wait_stack "woofedcrm${1:+_$1}"

telemetria WoofedCRM finalizado

## Mensagem de Passo
echo -e "\e[97m• CONFIGURANDO E MIGRANDO BANCO DE DADOS \e[33m[6/7]\e[0m"
echo ""
sleep 1

#MIGRANDO BANCO DE DADOS DO WOOFED CRM
container_name="woofedcrm${1:+_$1}_web"

max_wait_time=1200

wait_interval=60

elapsed_time=0

while [ $elapsed_time -lt $max_wait_time ]; do
  CONTAINER_ID=$(docker ps -q --filter "name=$container_name")
  if [ -n "$CONTAINER_ID" ]; then
    break
  fi
  sleep $wait_interval
  elapsed_time=$((elapsed_time + wait_interval))
done

if [ -z "$CONTAINER_ID" ]; then
  echo "O contêiner não foi encontrado após $max_wait_time segundos."
  exit 1
fi

docker exec -it "$CONTAINER_ID" bundle exec rails db:create > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "1/2 - [ OK ] - Executando: bundle exec rails db:create"
else
    echo "1/2- [ OFF ] - Executando: bundle exec rails db:create"
fi
docker exec -it "$CONTAINER_ID" bundle exec rails db:migrate > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "2/2 - [ OK ] - Executando: bundle exec rails db:migrate"
else
    echo "2/2- [ OFF ] - Executando: bundle exec rails db:migrate"
fi
echo ""

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[7/7]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "woofedcrm" para verificar se o serviço esta online
wait_stack "woofedcrm${1:+_$1}"

cd dados_vps

cat > dados_woofedcrm${1:+_$1} <<EOL
[ WOOFED CRM ]

Dominio do WoofedCRM: https://$url_woofed

Email: Precisa criar dentro do WoofedCRM

Senha: Precisa criar dentro do WoofedCRM

Acesso ao Motor: https://$url_woofed/motor_admin

Usuario do Motor: $email_admin_woofed

Senha do Motor: $senha_email_woofed
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ WOOFED CRM ]\e[0m"
echo ""

echo -e "\e[97mDominio:\e[33m https://$url_woofed\e[0m"
echo ""

echo -e "\e[97mEmail:\e[33m Precisa criar dentro do WoofedCRM\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m Precisa criar dentro do WoofedCRM\e[0m"
echo ""

echo -e "\e[97mURL MOTOR:\e[33m https://$url_woofed/motor_admin\e[0m"
echo ""

echo -e "\e[97mUser MOTOR:\e[33m $email_admin_woofed\e[0m"
echo ""

echo -e "\e[97mSenha MOTOR:\e[33m $senha_email_woofed\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗ ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ██╗ ██████╗██╗  ██╗███████╗
## ██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗██╔══██╗██║██╔════╝██║ ██╔╝██╔════╝
## █████╗  ██║   ██║██████╔╝██╔████╔██║██████╔╝██████╔╝██║██║     █████╔╝ ███████╗
## ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██╗██╔══██╗██║██║     ██╔═██╗ ╚════██║
## ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║██║╚██████╗██║  ██╗███████║
## ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝

ferramenta_formbricks() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_formbricks

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o Dominio para o Formbricks (ex: formbricks.oriondesign.art.br): \e[0m" && read -r url_formbricks
    echo ""

    ## Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite um Email para o SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_formbricks
    echo ""

    ## Pergunta o User SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuario do SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_formbricks
    echo ""

    ## Pergunta a Senha SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do email (ex: @Senha123_): \e[0m" && read -r senha_formbricks
    echo ""

    ## Pergunta o Host SMTP
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do email (ex: smtp.hostinger.com): \e[0m" && read -r host_formbricks
    echo ""

    ## Pergunta a Porta SMTP
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a Porta SMTP do email (ex: 465): \e[0m" && read -r porta_formbricks
    echo ""

    if [ "$porta_formbricks" -eq 465 ] || [ "$porta_formbricks" -eq 25 ]; then
        ssl_formbricks=1
    else
        ssl_formbricks=0
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_formbricks

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio:\e[97m $url_formbricks\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail SMTP:\e[97m $email_formbricks\e[0m"
    echo ""

    ## Informação sobre UserSMTP
    echo -e "\e[33mUser SMTP:\e[97m $user_smtp_formbricks\e[0m"
    echo ""

    ## Informação sobre Senha
    echo -e "\e[33mSenha SMTP:\e[97m $senha_formbricks\e[0m"
    echo ""

    ## Informação sobre Host
    echo -e "\e[33mHost SMTP:\e[97m $host_formbricks\e[0m"
    echo ""

    ## Informação sobre Porta
    echo -e "\e[33mPorta SMTP:\e[97m $porta_formbricks\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_formbricks

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO FORMBRICKS \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Formbricks iniciado

## Nada nada nada.. só para aparecer a mensagem de passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO PGVECTOR \e[33m[2/4]\e[0m"
echo ""
sleep 1

verificar_container_pgvector
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - PgVector já instalado"
    pegar_senha_pgvector > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do PgVector"
    criar_banco_pgvector_da_stack "formbricks${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_pgvector
    pegar_senha_pgvector > /dev/null 2>&1
    criar_banco_pgvector_da_stack "formbricks${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO FORMBRICKS \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Gera keys aleatórias
encryption_key_form=$(openssl rand -hex 16)
next_key_form=$(openssl rand -hex 16)
cron_key_form=$(openssl rand -hex 16)

## Criando a stack formbricks.yaml
cat > formbricks${1:+_$1}.yaml <<-EOF
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  formbricks${1:+_$1}:
    image: formbricks/formbricks:latest

    volumes:
      - formbricks${1:+_$1}_data:/home/nextjs/apps/web/uploads/

    networks:
      - $nome_rede_interna

    environment:
      ## Url da aplicação
      - WEBAPP_URL=https://$url_formbricks
      - NEXTAUTH_URL=https://$url_formbricks

      ## Banco de dados Postgres
      - DATABASE_URL=postgresql://postgres:$senha_pgvector@pgvector:5432/formbricks${1:+_$1}?schema=public

      ## Licença Enterprise ou Self-hosting
      ## Solicitar licenta Self-hosting --> https://oriondesign.art.br/formbricks_licence/ <-- ##
      - ENTERPRISE_LICENSE_KEY=

      ## Keys aleatórias 32 caracteres
      - ENCRYPTION_KEY=$encryption_key_form
      - NEXTAUTH_SECRET=$next_key_form
      - CRON_SECRET=$cron_key_form

      ## Dados do SMTP
      - MAIL_FROM=$email_formbricks
      - SMTP_HOST=$host_formbricks
      - SMTP_PORT=$porta_formbricks
      - SMTP_SECURE_ENABLED=$ssl_formbricks #(0= false | 1= true)
      - SMTP_USER=$user_smtp_formbricks
      - SMTP_PASSWORD=$senha_formbricks

      ## Ativar/Desativar registros e convites (0= false | 1= true)
      - SIGNUP_DISABLED=0
      - INVITE_DISABLED=0
      - EMAIL_VERIFICATION_DISABLED=0
      - PASSWORD_RESET_DISABLED=0

      ## Dados do Formbricks (para pesquisa)
      - NEXT_PUBLIC_FORMBRICKS_API_HOST=
      - NEXT_PUBLIC_FORMBRICKS_ENVIRONMENT_ID=
      - NEXT_PUBLIC_FORMBRICKS_ONBOARDING_SURVEY_ID=

      ## Login Google Cloud
      - GOOGLE_AUTH_ENABLED=0
      - GOOGLE_CLIENT_ID=
      - GOOGLE_CLIENT_SECRET=

      ## Google Sheets
      - GOOGLE_SHEETS_CLIENT_ID=
      - GOOGLE_SHEETS_CLIENT_SECRET=
      - GOOGLE_SHEETS_REDIRECT_URL=

      ## Login Github
      - GITHUB_AUTH_ENABLED=0
      - GITHUB_ID=
      - GITHUB_SECRET=

      ## Login Github
      - NOTION_OAUTH_CLIENT_ID=
      - NOTION_OAUTH_CLIENT_SECRET=

      ## Login Airtable
      - AIRTABLE_CLIENT_ID=

      ## Termos e politica de privacidade
      #- PRIVACY_URL=
      #- TERMS_URL=
      #- IMPRINT_URL=

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.formbricks${1:+_$1}.rule=Host(\`$url_formbricks\`)
        - traefik.http.services.formbricks${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.formbricks${1:+_$1}.service=formbricks${1:+_$1}
        - traefik.http.routers.formbricks${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.formbricks${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.formbricks${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  formbricks${1:+_$1}_data:
    external: true
    name: formbricks${1:+_$1}_data

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOF
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Formbricks"
fi
STACK_NAME="formbricks${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c formbricks.yaml formbricks > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Formbricks"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "formbricks" para verificar se o serviço esta online
wait_stack "formbricks${1:+_$1}"

telemetria Formbricks finalizado

cd dados_vps

cat > dados_formbricks${1:+_$1} <<EOL
[ FORMBRICKS ]

Dominio do Formbricks: https://$url_formbricks

Email: Precisa de criar dentro do Formbricks

Senha: Precisa de criar dentro do Formbricks
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ FORMBRICKS ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_formbricks\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa de criar dentro do Formbricks\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar dentro do Formbricks\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗ ██████╗  ██████╗ ██████╗ ██████╗ ██████╗
## ████╗  ██║██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗
## ██╔██╗ ██║██║   ██║██║     ██║   ██║██║  ██║██████╔╝
## ██║╚██╗██║██║   ██║██║     ██║   ██║██║  ██║██╔══██╗
## ██║ ╚████║╚██████╔╝╚██████╗╚██████╔╝██████╔╝██████╔╝
## ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═════╝

ferramenta_nocodb() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_nocodb

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o NocoDB (ex: nocodb.oriondesign.art.br): \e[0m" && read -r url_nocodb
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_nocodb

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o NocoDB:\e[97m $url_nocodb\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_nocodb

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO NOCODB \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria NocoDB iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Já sabe né ksk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "nocodb${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "nocodb${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO NOCODB \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack
cat > nocodb${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  nocodb${1:+_$1}:
    image: nocodb/nocodb:latest

    volumes:
      - nocodb${1:+_$1}_data:/usr/app/data

    networks:
      - $nome_rede_interna

    environment:
      ## Url do Nocobase
      - NC_PUBLIC_URL=https://$url_nocodb

      ## Dados Postgres
      - NC_DB=pg://postgres:5432?u=postgres&p=$senha_postgres&d=nocodb${1:+_$1}

      ## Desativar Telemetria
      - NC_DISABLE_TELE=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.nocodb${1:+_$1}.rule=Host(\`$url_nocodb\`)
        - traefik.http.routers.nocodb${1:+_$1}.entrypoints=websecure
        - traefik.http.services.nocodb${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.routers.nocodb${1:+_$1}.service=nocodb${1:+_$1}
        - traefik.http.routers.nocodb${1:+_$1}.tls.certresolver=letsencryptresolver
        - com.centurylinklabs.watchtower.enable=true

## --------------------------- ORION --------------------------- ##

volumes:
  nocodb${1:+_$1}_data:
    external: true
    name: nocodb${1:+_$1}_data

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do NocoDB"
fi
STACK_NAME="nocodb${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c nocodb.yaml nocodb > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do NocoDB"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_nocodb para verificar se o serviço esta online
wait_stack "nocodb${1:+_$1}"

telemetria NocoDB finalizado

cd dados_vps

cat > dados_nocodb${1:+_$1} <<EOL
[ NOCODB ]

Dominio do NocoDB: https://$url_nocodb

Usuario: Precisa criar no primeiro acesso do NocoDB

Senha: Precisa criar no primeiro acesso do NocoDB

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ NOCODB ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_nocodb\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do NocoDB\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do NocoDB\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗██╗   ██╗███████╗███████╗
## ██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║   ██║██╔════╝██╔════╝
## ██║     ███████║██╔██╗ ██║██║  ███╗█████╗  ██║   ██║███████╗█████╗
## ██║     ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║   ██║╚════██║██╔══╝
## ███████╗██║  ██║██║ ╚████║╚██████╔╝██║     ╚██████╔╝███████║███████╗
## ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝      ╚═════╝ ╚══════╝╚══════╝

ferramenta_langfuse() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_langfuse

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Langfuse (ex: langfuse.oriondesign.art.br): \e[0m" && read -r url_langfuse
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_langfuse

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o Langfuse:\e[97m $url_langfuse\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_langfuse

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO LANGFUSE \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Langfuse iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Já sabe né ksk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "langfuse${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "langfuse${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO LANGFUSE \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando key Aleatória 64caracteres
key_encryption=$(openssl rand -hex 32)

## Criando key Aleatória 64caracteres
key_secret=$(openssl rand -hex 32)

## Criando key Aleatória 32caracteres
key_salt=$(openssl rand -hex 32)

## Criando a stack langfuse.yaml
cat > langfuse${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  langfuse${1:+_$1}:
    image: langfuse/langfuse:latest

    networks:
     - $nome_rede_interna

    environment:
      ## Url do Langfuse
      - NEXTAUTH_URL=https://$url_langfuse

      ## Desativar novas incrições
      - NEXT_PUBLIC_SIGN_UP_DISABLED=false

      ## Dados Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/langfuse${1:+_$1}

      ## Secrets Key
      - ENCRYPTION_KEY=$key_encryption
      - NEXTAUTH_SECRET=$key_secret
      - SALT=$key_salt

      ## Ativar Telemetria
      - TELEMETRY_ENABLED=false

      ## Features experimentais
      - LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=false

      ## Node
      - NODE_ENV=production

    deploy:
      mode: replicated
      replicas: 1
      placement:
          constraints:
            - node.role == manager
      resources:
          limits:
            cpus: '0.5'
            memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.langfuse${1:+_$1}.rule=Host(\`$url_langfuse\`)
        - traefik.http.routers.langfuse${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.langfuse${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.langfuse${1:+_$1}.service=langfuse${1:+_$1}
        - traefik.http.services.langfuse${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.services.langfuse${1:+_$1}.loadbalancer.server.port=3000

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do langfuse"
fi
STACK_NAME="langfuse${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c langfuse.yaml langfuse > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do langfuse"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_langfuse para verificar se o serviço esta online
wait_stack "langfuse${1:+_$1}"

telemetria Langfuse finalizado

cd dados_vps

cat > dados_langfuse${1:+_$1} <<EOL
[ LANGFUSE ]

Dominio do Langfuse: https://$url_langfuse

Usuario: Precisa criar no primeiro acesso do langfuse

Senha: Precisa criar no primeiro acesso do langfuse

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ LANGFUSE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_langfuse\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Langfuse\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Langfuse\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ███╗███████╗████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗
## ████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
## ██╔████╔██║█████╗     ██║   ███████║██████╔╝███████║███████╗█████╗
## ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝
## ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗
## ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

ferramenta_metabase() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_metabase

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Metabase (ex: metabase.oriondesign.art.br): \e[0m" && read -r url_metabase
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_metabase

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o metabase:\e[97m $url_metabase\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_metabase

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO METABASE \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria MetaBase iniciado
## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Já sabe né ksk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "metabase${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "metabase${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO METABASE \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando key Aleatória 64caracteres
key_secret=$(openssl rand -hex 32)

## Criando key Aleatória 32caracteres
key_salt=$(openssl rand -hex 16)

## Criando a stack metabase.yaml
cat > metabase${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  metabase${1:+_$1}:
    image: metabase/metabase:latest

    volumes:
      - metabase${1:+_$1}_data:/metabase3-data

    networks:
      - $nome_rede_interna

    environment:
      ## Url MetaBase
      - MB_SITE_URL=https://$url_metabase
      - MB_REDIRECT_ALL_REQUESTS_TO_HTTPS=true
      - MB_JETTY_PORT=3000
      - MB_JETTY_HOST=0.0.0.0

      ## Dados postgres
      - MB_DB_MIGRATION_LOCATION=none
      - MB_DB_TYPE=postgres
      - MB_DB_DBNAME=metabase${1:+_$1}
      - MB_DB_PORT=5432
      - MB_DB_USER=postgres
      - MB_DB_PASS=$senha_postgres
      - MB_DB_HOST=postgres
      - MB_AUTOMIGRATE=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.metabase${1:+_$1}.rule=Host(\`$url_metabase\`)
        - traefik.http.services.metabase${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.metabase${1:+_$1}.service=metabase${1:+_$1}
        - traefik.http.routers.metabase${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.metabase${1:+_$1}.tls=true
        - traefik.http.routers.metabase${1:+_$1}.tls.certresolver=letsencryptresolver

## --------------------------- ORION --------------------------- ##

volumes:
  metabase${1:+_$1}_data:
    external: true
    name: metabase${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do metabase"
fi
STACK_NAME="metabase${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c metabase.yaml metabase > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do metabase"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "metabase" para verificar se o serviço esta online
wait_stack "metabase${1:+_$1}"

telemetria MetaBase finalizado

cd dados_vps

cat > dados_metabase${1:+_$1} <<EOL
[ METABASE ]

Dominio do metabase: https://$url_metabase

Usuario: Precisa criar no primeiro acesso do metabase

Senha: Precisa criar no primeiro acesso do metabase

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ METABASE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_metabase\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do metabase\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do metabase\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██████╗  ██████╗  ██████╗
## ██╔═══██╗██╔══██╗██╔═══██╗██╔═══██╗
## ██║   ██║██║  ██║██║   ██║██║   ██║
## ██║   ██║██║  ██║██║   ██║██║   ██║
## ╚██████╔╝██████╔╝╚██████╔╝╚██████╔╝
##  ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝

ferramenta_odoo() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_odoo

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Odoo (ex: odoo.oriondesign.art.br): \e[0m" && read -r url_odoo
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_odoo

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o Odoo:\e[97m $url_odoo\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_odoo

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO ODOO \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Odoo iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO ODOO \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando senha do postgres
senha_postgres_odoo=$(openssl rand -hex 16)

## Criando a stack odoo.yaml
cat > odoo${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  odoo${1:+_$1}_app:
    image: odoo:18.0

    volumes:
      - odoo${1:+_$1}_app_data:/var/lib/odoo
      - odoo${1:+_$1}_app_config:/etc/odoo
      - odoo${1:+_$1}_app_addons:/mnt/extra-addons

    networks:
      - $nome_rede_interna

    environment:
      ## Dados postgres do Odoo
      - HOST=odoo${1:+_$1}_db
      - USER=odoo
      - PASSWORD=$senha_postgres_odoo

    deploy:
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.odoo${1:+_$1}_app.rule=Host(\`$url_odoo\`)
        - traefik.http.routers.odoo${1:+_$1}_app.entrypoints=websecure
        - traefik.http.routers.odoo${1:+_$1}_app.tls=true
        - traefik.http.routers.odoo${1:+_$1}_app.service=odoo${1:+_$1}_app
        - traefik.http.routers.odoo${1:+_$1}_app.tls.certresolver=letsencryptresolver
        - traefik.http.services.odoo${1:+_$1}_app.loadbalancer.server.port=8069

## --------------------------- ORION --------------------------- ##

  odoo${1:+_$1}_db:
    image: postgres:15

    volumes:
      - odoo${1:+_$1}_db_data:/var/lib/postgresql/data/pgdata

    networks:
      - $nome_rede_interna
    #ports:
    #  - 543:45432

    environment:
      ## Dados Postgres
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=$senha_postgres_odoo
      - POSTGRES_USER=odoo
      - PGDATA=/var/lib/postgresql/data/pgdata
    deploy:
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

volumes:
  odoo${1:+_$1}_app_data:
    external: true
    name: odoo${1:+_$1}_app_data
  odoo${1:+_$1}_app_config:
    external: true
    name: odoo${1:+_$1}_app_config
  odoo${1:+_$1}_app_addons:
    external: true
    name: odoo${1:+_$1}_app_addons
  odoo${1:+_$1}_db_data:
    external: true
    name: odoo${1:+_$1}_db_data

networks:
  $nome_rede_interna:
    external: true
    attachable: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do odoo"
fi
STACK_NAME="odoo${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c odoo.yaml odoo > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Odoo"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_odoo para verificar se o serviço esta online
wait_stack "odoo${1:+_$1}"

telemetria Odoo finalizado

cd dados_vps

cat > dados_odoo${1:+_$1} <<EOL
[ ODOO ]

Dominio do odoo: https://$url_odoo

Usuario: Precisa criar no primeiro acesso do Odoo

Senha: Precisa criar no primeiro acesso do Odoo

Database Name: odoo

Database Password: $senha_postgres_odoo
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ ODOO ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_odoo\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Odoo\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Odoo\e[0m"
echo ""

echo -e "\e[33mDatabase Name:\e[97m odoo\e[0m"
echo ""

echo -e "\e[33mDatabase Password:\e[97m $senha_postgres_odoo\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗██╗  ██╗ █████╗ ████████╗██╗    ██╗ ██████╗  ██████╗ ████████╗
## ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔═══██╗╚══██╔══╝
## ██║     ███████║███████║   ██║   ██║ █╗ ██║██║   ██║██║   ██║   ██║
## ██║     ██╔══██║██╔══██║   ██║   ██║███╗██║██║   ██║██║   ██║   ██║
## ╚██████╗██║  ██║██║  ██║   ██║   ╚███╔███╔╝╚██████╔╝╚██████╔╝   ██║
##  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚══╝╚══╝  ╚═════╝  ╚═════╝    ╚═╝
##
##         ███╗   ██╗███████╗███████╗████████╗ ██████╗ ██████╗
##         ████╗  ██║██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
##         ██╔██╗ ██║█████╗  ███████╗   ██║   ██║   ██║██████╔╝
##         ██║╚██╗██║██╔══╝  ╚════██║   ██║   ██║   ██║██╔══██╗
##         ██║ ╚████║███████╗███████║   ██║   ╚██████╔╝██║  ██║
##         ╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝


ferramenta_chatwoot_nestor() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_chatwoot_nestor

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o Dominio para o Chatwoot (ex: chatwoot.oriondesign.art.br): \e[0m" && read -r url_chatwoot
    echo ""

    ## Pega o nome do dominio para ser o nome da empresa
    nome_empresa_chatwoot="$nome_servidor"

    ## Pergunta o email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_admin_chatwoot
    echo ""

    ## Define o dominio SMTP com o dominio do email
    dominio_smtp_chatwoot=$(echo "$email_admin_chatwoot" | cut -d "@" -f 2)

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_chatwoot
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_chatwoot
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_chatwoot
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_chatwoot


    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_chatwoot" -eq 465 ]; then
     sobre_ssl=true
    else
     sobre_ssl=false
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_chatwoot_nestor

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Chatwoot:\e[97m $url_chatwoot\e[0m"
    echo ""

    ## Informação sobre Nome da Empresa
    echo -e "\e[33mNome da Empresa:\e[97m $nome_empresa_chatwoot\e[0m"
    echo ""

    ## Informação sobre Email de SMTP
    echo -e "\e[33mEmail do SMTP:\e[97m $email_admin_chatwoot\e[0m"
    echo ""

    ## Informação sobre Usuario do SMTP
    echo -e "\e[33mUser do SMTP:\e[97m $user_smtp_chatwoot\e[0m"
    echo ""

    ## Informação sobre Senha de SMTP
    echo -e "\e[33mSenha do SMTP:\e[97m $senha_email_chatwoot\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP:\e[97m $smtp_email_chatwoot\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_chatwoot\e[0m"
    echo ""
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_chatwoot_nestor

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO CHATWOOT NESTOR \e[33m[1/6]\e[0m"
echo ""
sleep 1

telemetria "Chatwoot Nestor" "iniciado"

## Ativa a função dados para pegar os dados da vps
dados

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/6]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "chatwoot_nestor${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "chatwoot_nestor${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/6]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO CHATWOOT NESTOR \e[33m[4/6]\e[0m"
echo ""
sleep 1

## Neste passo vamos estar criando a Stack yaml do Chatwoot na pasta /root/
## Isso possibilitará que o usuario consiga edita-lo posteriormente

## Depois vamos instalar o Chatwoot e verificar se esta tudo certo.

## Criando key aleatória
encryption_key=$(openssl rand -hex 16)

## Criando a stack chatwoot_nestor.yaml
cat > chatwoot_nestor${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  chatwoot_nestor${1:+_$1}_app:
    image: sendingtk/chatwoot:v3.13.8 ## Versão do Chatwoot
    command: bundle exec rails s -p 3000 -b 0.0.0.0
    entrypoint: docker/entrypoints/rails.sh

    volumes:
      - chatwoot_nestor${1:+_$1}_storage:/app/storage ## Arquivos de conversa
      - chatwoot_nestor${1:+_$1}_public:/app/public ## Arquivos de logos
      - chatwoot_nestor${1:+_$1}_mailer:/app/app/views/devise/mailer ## Arquivos de email
      - chatwoot_nestor${1:+_$1}_mailers:/app/app/views/mailers ## Arquivos de emails

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Qualquer Url com # no final
      - CHATWOOT_HUB_URL=https://oriondesign.art.br/setup#

      ## Nome da Empresa
      - INSTALLATION_NAME=$nome_empresa_chatwoot

      ## Secret key
      - SECRET_KEY_BASE=$encryption_key

      ## Url Chatwoot
      - FRONTEND_URL=https://$url_chatwoot
      - FORCE_SSL=true

      ## Idioma/Localização padrão
      - DEFAULT_LOCALE=pt_BR
      - TZ=America/Brasil

      ## Google Cloud - Modifique de acordo com os seus dados (lembre-se de mudar no chatwoot_sidekiq)
      #- GOOGLE_OAUTH_CLIENT_ID=369777777777-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com
      #- GOOGLE_OAUTH_CLIENT_SECRET=ABCDEF-GHijklmnoPqrstuvwX-yz1234567
      #- GOOGLE_OAUTH_CALLBACK_URL=https://<your-server-domain>/omniauth/google_oauth2/callback

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379

      ## Dados do Postgres
      - POSTGRES_HOST=postgres
      - POSTGRES_USERNAME=postgres
      - POSTGRES_PASSWORD=$senha_postgres ## Senha do postgres
      - POSTGRES_DATABASE=chatwoot_nestor${1:+_$1}

      ## Armazenamento
      - ACTIVE_STORAGE_SERVICE=local ## use s3_compatible para MinIO
      #- STORAGE_BUCKET_NAME=chatwoot
      #- STORAGE_ACCESS_KEY_ID=ACCESS_KEY_MINIO
      #- STORAGE_SECRET_ACCESS_KEY=SECRET_KEY_MINIO
      #- STORAGE_REGION=eu-south
      #- STORAGE_ENDPOINT=https://s3.DOMINIO.COM
      #- STORAGE_FORCE_PATH_STYLE=true

      ## Dados do SMTP
      - MAILER_SENDER_EMAIL=$email_admin_chatwoot <$email_admin_chatwoot> ## Email SMTP
      - SMTP_DOMAIN=$dominio_smtp_chatwoot ## Dominio do email
      - SMTP_ADDRESS=$smtp_email_chatwoot ## Host SMTP
      - SMTP_PORT=$porta_smtp_chatwoot ## Porta SMTP
      - SMTP_SSL=$sobre_ssl ## Se a porta for 465 = true | Se a porta for 587 = false
      - SMTP_USERNAME=$user_smtp_chatwoot ## Usuario SMTP
      - SMTP_PASSWORD=$senha_email_chatwoot ## Senha do SMTP
      - SMTP_AUTHENTICATION=login
      - SMTP_ENABLE_STARTTLS_AUTO=true
      - SMTP_OPENSSL_VERIFY_MODE=peer
      - MAILER_INBOUND_EMAIL_DOMAIN=$email_admin_chatwoot ## Email SMTP

      ## Melhorias
      - SIDEKIQ_CONCURRENCY=10
      - RACK_TIMEOUT_SERVICE_TIMEOUT=0
      - RAILS_MAX_THREADS=5
      - WEB_CONCURRENCY=2
      - ENABLE_RACK_ATTACK=false

      ## Outras configurações
      - NODE_ENV=production
      - RAILS_ENV=production
      - INSTALLATION_ENV=docker
      - RAILS_LOG_TO_STDOUT=true
      - USE_INBOX_AVATAR_FOR_BOT=true
      - ENABLE_ACCOUNT_SIGNUP=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.rule=Host(\`$url_chatwoot\`)
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.entrypoints=websecure
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.tls.certresolver=letsencryptresolver
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.priority=1
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.service=chatwoot_nestor${1:+_$1}_app
        - traefik.http.services.chatwoot_nestor${1:+_$1}_app.loadbalancer.server.port=3000
        - traefik.http.services.chatwoot_nestor${1:+_$1}_app.loadbalancer.passhostheader=true
        - traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https
        - traefik.http.routers.chatwoot_nestor${1:+_$1}_app.middlewares=sslheader@docker

## --------------------------- ORION --------------------------- ##

  chatwoot_nestor${1:+_$1}_sidekiq:
    image: sendingtk/chatwoot:v3.13.8 ## Versão do Chatwoot
    command: bundle exec sidekiq -C config/sidekiq.yml

    volumes:
      - chatwoot_nestor${1:+_$1}_storage:/app/storage ## Arquivos de conversa
      - chatwoot_nestor${1:+_$1}_public:/app/public ## Arquivos de logos
      - chatwoot_nestor${1:+_$1}_mailer:/app/app/views/devise/mailer ## Arquivos de email
      - chatwoot_nestor${1:+_$1}_mailers:/app/app/views/mailers ## Arquivos de emails

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Qualquer Url com # no final
      - CHATWOOT_HUB_URL=https://oriondesign.art.br/setup#

      ## Nome da Empresa
      - INSTALLATION_NAME=$nome_empresa_chatwoot

      ## Secret key
      - SECRET_KEY_BASE=$encryption_key

      ## Url Chatwoot
      - FRONTEND_URL=https://$url_chatwoot
      - FORCE_SSL=true

      ## Idioma/Localização padrão
      - DEFAULT_LOCALE=pt_BR
      - TZ=America/Brasil

      ## Google Cloud - Modifique de acordo com os seus dados (lembre-se de mudar no chatwoot_sidekiq)
      #- GOOGLE_OAUTH_CLIENT_ID=369777777777-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com
      #- GOOGLE_OAUTH_CLIENT_SECRET=ABCDEF-GHijklmnoPqrstuvwX-yz1234567
      #- GOOGLE_OAUTH_CALLBACK_URL=https://<your-server-domain>/omniauth/google_oauth2/callback

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379

      ## Dados do Postgres
      - POSTGRES_HOST=postgres
      - POSTGRES_USERNAME=postgres
      - POSTGRES_PASSWORD=$senha_postgres ## Senha do postgres
      - POSTGRES_DATABASE=chatwoot_nestor${1:+_$1}

      ## Armazenamento
      - ACTIVE_STORAGE_SERVICE=local ## use s3_compatible para MinIO
      #- STORAGE_BUCKET_NAME=chatwoot
      #- STORAGE_ACCESS_KEY_ID=ACCESS_KEY_MINIO
      #- STORAGE_SECRET_ACCESS_KEY=SECRET_KEY_MINIO
      #- STORAGE_REGION=eu-south
      #- STORAGE_ENDPOINT=https://s3.DOMINIO.COM
      #- STORAGE_FORCE_PATH_STYLE=true

      ## Dados do SMTP
      - MAILER_SENDER_EMAIL=$email_admin_chatwoot <$email_admin_chatwoot> ## Email SMTP
      - SMTP_DOMAIN=$dominio_smtp_chatwoot ## Dominio do email
      - SMTP_ADDRESS=$smtp_email_chatwoot ## Host SMTP
      - SMTP_PORT=$porta_smtp_chatwoot ## Porta SMTP
      - SMTP_SSL=$sobre_ssl ## Se a porta for 465 = true | Se a porta for 587 = false
      - SMTP_USERNAME=$user_smtp_chatwoot ## Usuario SMTP
      - SMTP_PASSWORD=$senha_email_chatwoot ## Senha do SMTP
      - SMTP_AUTHENTICATION=login
      - SMTP_ENABLE_STARTTLS_AUTO=true
      - SMTP_OPENSSL_VERIFY_MODE=peer
      - MAILER_INBOUND_EMAIL_DOMAIN=$email_admin_chatwoot ## Email SMTP

      ## Melhorias
      - SIDEKIQ_CONCURRENCY=10
      - RACK_TIMEOUT_SERVICE_TIMEOUT=0
      - RAILS_MAX_THREADS=5
      - WEB_CONCURRENCY=2
      - ENABLE_RACK_ATTACK=false

      ## Outras configurações
      - NODE_ENV=production
      - RAILS_ENV=production
      - INSTALLATION_ENV=docker
      - RAILS_LOG_TO_STDOUT=true
      - USE_INBOX_AVATAR_FOR_BOT=true
      - ENABLE_ACCOUNT_SIGNUP=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  chatwoot_nestor${1:+_$1}_storage:
    external: true
    name: chatwoot_nestor${1:+_$1}_storage
  chatwoot_nestor${1:+_$1}_public:
    external: true
    name: chatwoot_nestor${1:+_$1}_public
  chatwoot_nestor${1:+_$1}_mailer:
    external: true
    name: chatwoot_nestor${1:+_$1}_mailer
  chatwoot_nestor${1:+_$1}_mailers:
    external: true
    name: chatwoot_nestor${1:+_$1}_mailers

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Chatwoot"
fi

STACK_NAME="chatwoot_nestor${1:+_$1}"
stack_editavel #> /dev/null 2>&1

#docker stack deploy --prune --resolve-image always -c chatwoot.yaml chatwoot > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Chatwoot"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/6]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_chatwoot para verificar se o serviço esta online
wait_stack "chatwoot_nestor${1:+_$1}"

telemetria "Chatwoot Nestor" "finalizado"
## Mensagem de Passo
echo -e "\e[97m• MIGRANDO BANCO DE DADOS \e[33m[6/6]\e[0m"
echo ""
sleep 1

## Aqui vamos estar migrando o banco de dados usando o comando "bundle exec rails db:chatwoot_prepare"

## Basicamente voce poderia entrar no banco de dados do chatwoot e executar o comando por lá tambem

container_name="chatwoot_nestor${1:+_$1}_chatwoot_nestor${1:+_$1}_app"

max_wait_time=1200

wait_interval=60

elapsed_time=0

while [ $elapsed_time -lt $max_wait_time ]; do
  CONTAINER_ID=$(docker ps -q --filter "name=$container_name")
  if [ -n "$CONTAINER_ID" ]; then
    break
  fi
  sleep $wait_interval
  elapsed_time=$((elapsed_time + wait_interval))
done

if [ -z "$CONTAINER_ID" ]; then
  echo "O contêiner não foi encontrado após $max_wait_time segundos."
  exit 1
fi

docker exec -it "$CONTAINER_ID" bundle exec rails db:chatwoot_prepare > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Executando no container: bundle exec rails db:chatwoot_prepare"
else
    echo "1/1 - [ OFF ] - Executando no container: bundle exec rails db:chatwoot_prepare"
    echo "Não foi possivel migrar o banco de dados"
fi

echo ""

## Salvando informações da instalação dentro de /dados_vps/
cd dados_vps

cat > dados_chatwoot_nestor${1:+_$1} <<EOL
[ CHATWOOT NESTOR ]

Dominio do Chatwoot: https://$url_chatwoot

Usuario: Precisa criar dentro do Chatwoot

Senha: Precisa criar dentro do Chatwoot
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ CHATWOOT NESTOR ]\e[0m"
echo ""

echo -e "\e[97mDominio:\e[33m https://$url_chatwoot\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m Precisa criar dentro do Chatwoot\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m Precisa criar dentro do Chatwoot\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗   ██╗███╗   ██╗ ██████╗      █████╗ ██████╗ ██╗
## ██║   ██║████╗  ██║██╔═══██╗    ██╔══██╗██╔══██╗██║
## ██║   ██║██╔██╗ ██║██║   ██║    ███████║██████╔╝██║
## ██║   ██║██║╚██╗██║██║   ██║    ██╔══██║██╔═══╝ ██║
## ╚██████╔╝██║ ╚████║╚██████╔╝    ██║  ██║██║     ██║
##  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_unoapi() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_unoapi

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio da UnoApi
    echo -e "\e[97mPasso$amarelo 1/11\e[0m"
    echo -en "\e[33mDigite o Dominio para a Uno API (ex: unoapi.oriondesign.art.br): \e[0m" && read -r url_unoapi
    echo ""

    ##Pergunta o Dominio do Chatwoot
    echo -e "\e[97mPasso$amarelo 2/11\e[0m"
    echo -en "\e[33mDigite o Dominio do Chatwoot já instalado (ex: chatwoot.oriondesign.art.br): \e[0m" && read -r url_chatwoot_uno
    echo ""

    ##Pergunta o o token do usuario
    echo -e "\e[97mPasso$amarelo 3/11\e[0m"
    echo -en "\e[33mDigite o token de usuario administrador do Chatwoot: \e[0m" && read -r token_chatwoot_uno
    echo ""

    ##Pergunta se quer ignorar mensagens de grupos
    echo -e "\e[97mPasso$amarelo 4/11\e[0m"
    echo -en "\e[33mIgnorar mensagens de grupos (true ou false): \e[0m" && read -r op_1
    echo ""

    ## Pergunta se quer ignorar o stauts de transmissão
    echo -e "\e[97mPasso$amarelo 5/11\e[0m"
    echo -en "\e[33mIgnorar Status de Transmissão (true ou false): \e[0m" && read -r op_2
    echo ""

    ## Pergunta se quer ignorar mensagens de trasmissão
    echo -e "\e[97mPasso$amarelo 6/11\e[0m"
    echo -en "\e[33mIgnorar Mensagens de Trasmissão (true ou false): \e[0m" && read -r op_3
    echo ""

    ## Pergunta se quer ignorar mensagem de status
    echo -e "\e[97mPasso$amarelo 7/11\e[0m"
    echo -en "\e[33mIgnorar Mensagem de Status (true ou false): \e[0m" && read -r op_4
    echo ""

    ## Pergunta se quer ignorar as próprias mensagens
    echo -e "\e[97mPasso$amarelo 8/11\e[0m"
    echo -en "\e[33mIgnorar Proprias Mensagens (true ou false): \e[0m" && read -r op_5
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 9/11\e[0m"
    echo -en "\e[33mEnviar status de conexão (true ou false): \e[0m" && read -r op_6
    echo ""

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 10/11\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 11/11\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    ## Pegando senha do rabbitMQ
    pegar_user_senha_rabbitmq

    ## Pegando senha do minio
    pegar_senha_minio

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_unoapi

    ## Mostra mensagem para verificar as informações
    conferindo_as_info


    echo -e "\e[33mDominio da Uno API:\e[97m $url_unoapi\e[0m"
    echo ""


    echo -e "\e[33mDominio do Chatwoot:\e[97m $url_chatwoot_uno\e[0m"
    echo ""


    echo -e "\e[33mToken do Administrador:\e[97m $token_chatwoot_uno\e[0m"
    echo ""


    echo -e "\e[33mIgnorar mensagens de grupos:\e[97m $op_1\e[0m"
    echo ""


    echo -e "\e[33mIgnorar Status de Transmissão:\e[97m $op_2\e[0m"
    echo ""

    echo -e "\e[33mIgnorar Mensagens de Trasmissão:\e[97m $op_3\e[0m"
    echo ""


    echo -e "\e[33mIgnorar Mensagem de Status:\e[97m $op_4\e[0m"
    echo ""


    echo -e "\e[33mIgnorar Proprias mensagens:\e[97m $op_5\e[0m"
    echo ""


    echo -e "\e[33mEnviar status de conexão:\e[97m $op_6\e[0m"
    echo ""


    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""


    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""


    echo -e "\e[33mUser RabbitMq:\e[97m $user_rabbit_mqs\e[0m"
    echo ""


    echo -e "\e[33mSenha RabbitMq:\e[97m $senha_rabbit_mqs\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_unoapi

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA UNO API \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria "Uno API" "iniciado"

## Nada nada nada.. só para aparecer a mensagem de passo..

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO UNO API \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
##key_unoapi=$(openssl rand -hex 16)

## Criando a stack unoapi.yaml
cat > unoapi${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  unoapi${1:+_$1}:
    image: clairton/unoapi-cloud:latest
    entrypoint: yarn cloud

    volumes:
      - unoapi${1:+_$1}_data:/home/u/app

    networks:
      - $nome_rede_interna

    environment:
      ## Url Uno API
      - BASE_URL=https://$url_unoapi

      ## Token Uno Api
      - UNOAPI_AUTH_TOKEN=any

      ## Configurações da Uno API
      - IGNORE_GROUP_MESSAGES=$op_1
      - IGNORE_BROADCAST_STATUSES=$op_2
      - IGNORE_BROADCAST_MESSAGES=$op_3
      - IGNORE_STATUS_MESSAGE=$op_4
      - IGNORE_OWN_MESSAGES=$op_5
      - REJECT_CALLS=
      - REJECT_CALLS_WEBHOOK=
      - SEND_CONNECTION_STATUS=$op_6

      ## Sobre Webhook
      - WEBHOOK_URL=https://$url_chatwoot_uno/webhooks/whatsapp
      - WEBHOOK_HEADER=api_access_token
      - WEBHOOK_TOKEN=$token_chatwoot_uno

      ## Dados do Minio/S3
      - STORAGE_ENDPOINT=https://$url_s3
      - STORAGE_ACCESS_KEY_ID=$S3_ACCESS_KEY
      - STORAGE_SECRET_ACCESS_KEY=$S3_SECRET_KEY
      - STORAGE_BUCKET_NAME=unoapi${1:+_$1}
      - STORAGE_FORCE_PATH_STYLE=true

      ## Dados do RabbitMQ
      - AMQP_URL=amqp://$user_rabbit_mqs:$senha_rabbit_mqs@rabbitmq:5672/unoapi${1:+_$1}

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379

      ## Outras configurações
      - LOG_LEVEL=debug
      - UNO_LOG_LEVEL=debug
      - UNOAPI_RETRY_REQUEST_DELAY=1_000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
      - traefik.enable=true
      - traefik.http.routers.unoapi${1:+_$1}.rule=Host(\`$url_unoapi\`)
      - traefik.http.routers.unoapi${1:+_$1}.entrypoints=websecure
      - traefik.http.routers.unoapi${1:+_$1}.tls.certresolver=letsencryptresolver
      - traefik.http.services.unoapi${1:+_$1}.loadbalancer.server.port=9876
      - traefik.http.routers.unoapi${1:+_$1}.priority=1
      - traefik.http.services.unoapi${1:+_$1}.loadbalancer.passHostHeader=true
      - traefik.http.routers.unoapi${1:+_$1}.service=unoapi${1:+_$1}

## --------------------------- ORION --------------------------- ##

volumes:
  unoapi${1:+_$1}_data:
    external: true
    name: unoapi${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Uno API"
fi
STACK_NAME="unoapi${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c unoapi.yaml unoapi > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Uno API"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_unoapi para verificar se o serviço esta online
wait_stack "unoapi${1:+_$1}"

telemetria "Uno API" "finalizado"

cd dados_vps

cat > dados_unoapi${1:+_$1} <<EOL
[ UNO API ]

Dominio do unoapi: https://$url_unoapi

Auth Token: any

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ UNO API ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_unoapi\e[0m"
echo ""

echo -e "\e[33mPing:\e[97m https://$url_unoapi/ping\e[0m"
echo ""

echo -e "\e[33mAuth Token:\e[97m any\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗ █████╗ ███╗   ██╗     ██████╗ ██████╗ ███╗   ███╗    ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
## ████╗  ██║██╔══██╗████╗  ██║    ██╔════╝██╔═══██╗████╗ ████║    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝
## ██╔██╗ ██║╚█████╔╝██╔██╗ ██║    ██║     ██║   ██║██╔████╔██║    ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗
## ██║╚██╗██║██╔══██╗██║╚██╗██║    ██║     ██║   ██║██║╚██╔╝██║    ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║
## ██║ ╚████║╚█████╔╝██║ ╚████║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║    ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║
## ╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝
##
##            ██████╗  ██████╗      ██████╗ ██╗   ██╗███████╗██████╗  █████╗ ███████╗ █████╗
##            ██╔══██╗██╔═══██╗    ██╔═══██╗██║   ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
##            ██║  ██║██║   ██║    ██║   ██║██║   ██║█████╗  ██████╔╝███████║███████╗███████║
##            ██║  ██║██║   ██║    ██║▄▄ ██║██║   ██║██╔══╝  ██╔═══╝ ██╔══██║╚════██║██╔══██║
##            ██████╔╝╚██████╔╝    ╚██████╔╝╚██████╔╝███████╗██║     ██║  ██║███████║██║  ██║
##            ╚═════╝  ╚═════╝      ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

ferramenta_n8n_quepasa() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_n8n_quepasa

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do N8N
    echo -e "\e[97mPasso$amarelo 1/5\e[0m"
    echo -en "\e[33mDigite o dominio para o N8N (ex: n8n.oriondesign.art.br): \e[0m" && read -r url_editorn8n
    echo ""

    ##Pergunta o Dominio do Webhook
    echo -e "\e[97mPasso$amarelo 2/5\e[0m"
    echo -en "\e[33mDigite o dominio para o Webhook do N8N (ex: webhook.oriondesign.art.br): \e[0m" && read -r url_webhookn8n
    echo ""

    ##Pergunta Dominio do Chatwoot
    echo -e "\e[97mPasso$amarelo 3/5\e[0m"
    echo -en "\e[33mDigite o dominio do Chatwoot (ex: chatwoot.oriondesign.art.br): \e[0m" && read -r dominio_chatwoot
    echo ""

    ##Pergunta Dominio do Quepasa
    echo -e "\e[97mPasso$amarelo 4/5\e[0m"
    echo -en "\e[33mDigite o dominio do Quepasa (ex: quepasa.oriondesign.art.br): \e[0m" && read -r dominio_quepasa
    echo ""

    ##Pergunta Email do Quepasa
    echo -e "\e[97mPasso$amarelo 5/5\e[0m"
    echo -en "\e[33mDigite o email do Quepasa (ex: contato@oriondesign.art.br): \e[0m" && read -r email_quepasa
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_n8n_quepasa

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do N8N
    echo -e "\e[33mDominio do N8N:\e[97m $url_editorn8n\e[0m"
    echo ""

    ## Informação sobre URL do Webhook
    echo -e "\e[33mDominio para o Webhook:\e[97m $url_webhookn8n\e[0m"
    echo ""

    ## Informação sobre URL do Chatwoot
    echo -e "\e[33mDominio do Chatwoot:\e[97m $dominio_chatwoot\e[0m"
    echo ""

    ## Informação sobre URL do Quepasa
    echo -e "\e[33mDominio do Quepasa:\e[97m $dominio_quepasa\e[0m"
    echo ""

    ## Informação Email do Quepasa
    echo -e "\e[33mEmail do Quepasa:\e[97m $email_quepasa\e[0m"
    echo ""

    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_n8n_quepasa

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO N8N \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria "N8N & Quepasa" "iniciado"

## NADA

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES\e[33m[2/5]\e[0m"
echo ""
sleep 1

## Verifica se tem postgres, se sim pega a senha e cria um banco nele, se não instala, pega a senha e cria o banco
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "n8n_quepasa${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "n8n_quepasa${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO N8N \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
encryption_key=$(openssl rand -hex 16)

## Criando a stack n8n_quepasa.yaml
cat > n8n_quepasa${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  n8n_quepasa${1:+_$1}_editor:
    image: oriondesign/n8n-quepasa:latest ## Versão do N8N
    command: start

    volumes:
      - n8n_quepasa${1:+_$1}_data:/home/node/.n8n/nodes

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_quepasa${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Dados do Quepasa
      - C8Q_SINGLETHREAD=false
      - C8Q_QUEPASAINBOXCONTROL=1001
      - C8Q_GETCHATWOOTCONTACTS=1002
      - C8Q_QUEPASACHATCONTROL=1003
      - C8Q_CHATWOOTPROFILEUPDATE=1004
      - C8Q_POSTTOWEBCALLBACK=1005
      - C8Q_POSTTOCHATWOOT=1006
      - C8Q_CHATWOOTTOQUEPASAGREETINGS=1007
      - C8Q_TOCHATWOOTTRANSCRIPT=pi4APHD9F05Dv6FR
      - C8Q_TOCHATWOOTTRANSCRIPTRESUME=true
      - C8Q_CHATWOOTEXTRA=iiEsUj7ybtzEZAFj

      - C8Q_QP_BOTTITLE=$nome_servidor
      - C8Q_QP_DEFAULT_USER=$email_quepasa
      - C8Q_CW_PUBLIC_URL=$dominio_chatwoot
      - C8Q_CW_HOST=https://$dominio_chatwoot
      - C8Q_QP_CONTACT=$email_quepasa
      - C8Q_QUEPASA_HOST=https://$dominio_quepasa
      - C8Q_N8N_HOST=https://$url_editorn8n
      - C8Q_N8N_WEBHOOK=https://$url_webhookn8n

      - C8Q_MSGFOR_UNKNOWN_CONTENT=! "Algum EMOJI" ou "Alguma Reação que o sistema não entende ainda ..."
      - C8Q_MSGFOR_EDITED_CONTENT=⚠️ **Essa mensagem foi editada !**
      - C8Q_MSGFOR_ATTACHERROR_CONTENT=** Falha ao baixar anexo !
      - C8Q_MSGFOR_LOCALIZATION_CONTENT=* Localização *
      - C8Q_MSGFOR_REVOKED_CONTENT=❌ Essa mensagem foi apagada !!!
      - C8Q_MSGFOR_CALL_CONTENT=⚠️ O usuário requisitou uma chamada de voz !
      - C8Q_MSGFOR_REJECT_CALL=Não aceitamos Ligação
      - C8Q_MSGFOR_NO_CSAT=
      - C8Q_QP_DEFAULT_CALL=true

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n_quepasa${1:+_$1}_editor.rule=Host(\`$url_editorn8n\`)
        - traefik.http.routers.n8n_quepasa${1:+_$1}_editor.entrypoints=websecure
        - traefik.http.routers.n8n_quepasa${1:+_$1}_editor.priority=1
        - traefik.http.routers.n8n_quepasa${1:+_$1}_editor.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n_quepasa${1:+_$1}_editor.service=n8n_quepasa${1:+_$1}_editor
        - traefik.http.services.n8n_quepasa${1:+_$1}_editor.loadbalancer.server.port=5678
        - traefik.http.services.n8n_quepasa${1:+_$1}_editor.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

  n8n_quepasa${1:+_$1}_webhook:
    image: oriondesign/n8n-quepasa:latest ## Versão do N8N
    command: webhook

    volumes:
      - n8n_quepasa${1:+_$1}_data:/home/node/.n8n/nodes

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_quepasa${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Dados do Quepasa
      - C8Q_SINGLETHREAD=false
      - C8Q_QUEPASAINBOXCONTROL=1001
      - C8Q_GETCHATWOOTCONTACTS=1002
      - C8Q_QUEPASACHATCONTROL=1003
      - C8Q_CHATWOOTPROFILEUPDATE=1004
      - C8Q_POSTTOWEBCALLBACK=1005
      - C8Q_POSTTOCHATWOOT=1006
      - C8Q_CHATWOOTTOQUEPASAGREETINGS=1007
      - C8Q_TOCHATWOOTTRANSCRIPT=pi4APHD9F05Dv6FR
      - C8Q_TOCHATWOOTTRANSCRIPTRESUME=true
      - C8Q_CHATWOOTEXTRA=iiEsUj7ybtzEZAFj

      - C8Q_QP_BOTTITLE=$nome_servidor
      - C8Q_QP_DEFAULT_USER=$email_quepasa
      - C8Q_CW_PUBLIC_URL=$dominio_chatwoot
      - C8Q_CW_HOST=https://$dominio_chatwoot
      - C8Q_QP_CONTACT=$email_quepasa
      - C8Q_QUEPASA_HOST=https://$dominio_quepasa
      - C8Q_N8N_HOST=https://$url_editorn8n
      - C8Q_N8N_WEBHOOK=https://$url_webhookn8n

      - C8Q_MSGFOR_UNKNOWN_CONTENT=! "Algum EMOJI" ou "Alguma Reação que o sistema não entende ainda ..."
      - C8Q_MSGFOR_EDITED_CONTENT=⚠️ **Essa mensagem foi editada !**
      - C8Q_MSGFOR_ATTACHERROR_CONTENT=** Falha ao baixar anexo !
      - C8Q_MSGFOR_LOCALIZATION_CONTENT=* Localização *
      - C8Q_MSGFOR_REVOKED_CONTENT=❌ Essa mensagem foi apagada !!!
      - C8Q_MSGFOR_CALL_CONTENT=⚠️ O usuário requisitou uma chamada de voz !
      - C8Q_MSGFOR_REJECT_CALL=Não aceitamos Ligação
      - C8Q_MSGFOR_NO_CSAT=
      - C8Q_QP_DEFAULT_CALL=true

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=3
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n_quepasa${1:+_$1}_webhook.rule=(Host(\`$url_webhookn8n\`))
        - traefik.http.routers.n8n_quepasa${1:+_$1}_webhook.entrypoints=websecure
        - traefik.http.routers.n8n_quepasa${1:+_$1}_webhook.priority=1
        - traefik.http.routers.n8n_quepasa${1:+_$1}_webhook.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n_quepasa${1:+_$1}_webhook.service=n8n_quepasa${1:+_$1}_webhook
        - traefik.http.services.n8n_quepasa${1:+_$1}_webhook.loadbalancer.server.port=5678
        - traefik.http.services.n8n_quepasa${1:+_$1}_webhook.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

  n8n_quepasa${1:+_$1}_worker:
    image: oriondesign/n8n-quepasa:latest ## Versão do N8N
    command: worker --concurrency=10

    volumes:
      - n8n_quepasa${1:+_$1}_data:/home/node/.n8n/nodes

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do postgres
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_quepasa${1:+_$1}
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=postgres
      - DB_POSTGRESDB_PASSWORD=$senha_postgres

      ## Dados do Quepasa
      - C8Q_SINGLETHREAD=false
      - C8Q_QUEPASAINBOXCONTROL=1001
      - C8Q_GETCHATWOOTCONTACTS=1002
      - C8Q_QUEPASACHATCONTROL=1003
      - C8Q_CHATWOOTPROFILEUPDATE=1004
      - C8Q_POSTTOWEBCALLBACK=1005
      - C8Q_POSTTOCHATWOOT=1006
      - C8Q_CHATWOOTTOQUEPASAGREETINGS=1007
      - C8Q_TOCHATWOOTTRANSCRIPT=pi4APHD9F05Dv6FR
      - C8Q_TOCHATWOOTTRANSCRIPTRESUME=true
      - C8Q_CHATWOOTEXTRA=iiEsUj7ybtzEZAFj

      - C8Q_QP_BOTTITLE=$nome_servidor
      - C8Q_QP_DEFAULT_USER=$email_quepasa
      - C8Q_CW_PUBLIC_URL=$dominio_chatwoot
      - C8Q_CW_HOST=https://$dominio_chatwoot
      - C8Q_QP_CONTACT=$email_quepasa
      - C8Q_QUEPASA_HOST=https://$dominio_quepasa
      - C8Q_N8N_HOST=https://$url_editorn8n
      - C8Q_N8N_WEBHOOK=https://$url_webhookn8n

      - C8Q_MSGFOR_UNKNOWN_CONTENT=! "Algum EMOJI" ou "Alguma Reação que o sistema não entende ainda ..."
      - C8Q_MSGFOR_EDITED_CONTENT=⚠️ **Essa mensagem foi editada !**
      - C8Q_MSGFOR_ATTACHERROR_CONTENT=** Falha ao baixar anexo !
      - C8Q_MSGFOR_LOCALIZATION_CONTENT=* Localização *
      - C8Q_MSGFOR_REVOKED_CONTENT=❌ Essa mensagem foi apagada !!!
      - C8Q_MSGFOR_CALL_CONTENT=⚠️ O usuário requisitou uma chamada de voz !
      - C8Q_MSGFOR_REJECT_CALL=Não aceitamos Ligação
      - C8Q_MSGFOR_NO_CSAT=
      - C8Q_QP_DEFAULT_CALL=true

      ## Encryption Key
      - N8N_ENCRYPTION_KEY=$encryption_key

      ## Url do N8N
      - N8N_HOST=$url_editorn8n
      - N8N_EDITOR_BASE_URL=https://$url_editorn8n/
      - WEBHOOK_URL=https://$url_webhookn8n/
      - N8N_PROTOCOL=https

      ## Modo do Node
      - NODE_ENV=production

      ## Modo de execução (deletar caso deseje em modo regular)
      - EXECUTIONS_MODE=queue

      ## Dados do Redis
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336

      ## Timezone
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  n8n_quepasa${1:+_$1}_data:
    external: true
    name: n8n_quepasa${1:+_$1}_data

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do N8N Quepasa"
fi
STACK_NAME="n8n_quepasa${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c n8n_quepasa.yaml n8n_quepasa > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do N8N Quepasa"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_n8n para verificar se o serviço esta online
wait_stack "n8n_quepasa${1:+_$1}"

telemetria "N8N & Quepasa" "finalizado"

cd dados_vps

cat > dados_n8n_quepasa${1:+_$1} <<EOL
[ N8N QUEPASA ]

Dominio do N8N: https://$url_editorn8n

Dominio do N8N: https://$url_webhookn8n

Email: Precisa criar no primeiro acesso do N8N

Senha: Precisa criar no primeiro acesso do N8N
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ N8N QUEPASA ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_editorn8n\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa criar no primeiro acesso do N8N\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do N8N\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}


##  ██████╗ ██╗   ██╗███████╗██████╗  █████╗ ███████╗ █████╗
## ██╔═══██╗██║   ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
## ██║   ██║██║   ██║█████╗  ██████╔╝███████║███████╗███████║
## ██║▄▄ ██║██║   ██║██╔══╝  ██╔═══╝ ██╔══██║╚════██║██╔══██║
## ╚██████╔╝╚██████╔╝███████╗██║     ██║  ██║███████║██║  ██║
##  ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

ferramenta_quepasa() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_quepasa

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o Quepasa (ex: quepasa.oriondesign.art.br): \e[0m" && read -r url_quepasa
    echo ""

    ##Pergunta o email para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite o email para o Quepasa (ex: contato@oriondesign.art.br): \e[0m" && read -r email_quepasa
    echo ""

    ##Pergunta o Dominio do Editor N8N Quepasa
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite o dominio do N8N Quepasa (ex: n8n.oriondesign.art.br): \e[0m" && read -r url_n8n
    echo ""

    ##Pergunta o Dominio do webhook do N8N Quepasa
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite o dominio do Webhook N8N Quepasa (ex: webhook.oriondesign.art.br): \e[0m" && read -r url_webhook
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_quepasa

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do quepasa
    echo -e "\e[33mDominio do Quepasa:\e[97m $url_quepasa\e[0m"
    echo ""

    ## Informação sobre email do quepasa
    echo -e "\e[33mEmail do Quepasa:\e[97m $email_quepasa\e[0m"
    echo ""

    ## Informação sobre dominio do n8n
    echo -e "\e[33mDomínio do N8N:\e[97m $url_n8n\e[0m"
    echo ""

    ## Informação sobre webhook do n8n
    echo -e "\e[33mDomínio do Webhook:\e[97m $url_webhook\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO QUEPASA \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Quepasa iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO QUEPASA \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack

key_quepasa=$(openssl rand -hex 16)

cat > quepasa${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  quepasa${1:+_$1}:
    image: deividms/quepasa:latest ## Imagem/versão do Quepasa

    volumes:
      - quepasa${1:+_$1}_volume:/opt/quepasa

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de acesso
      - DOMAIN=$url_quepasa

      ## Email Quepasa
      - EMAIL=$email_quepasa
      - QUEPASA_BASIC_AUTH_USER=$email_quepasa
      - QUEPASA_BASIC_AUTH_PASSWORD=$email_quepasa

      ## Titulo no celular
      - APP_TITLE=OrionDesign ## Mude aqui o nome que vai aparecer no celular.

      ## TimeZone
      - TZ=America/Sao_Paulo

      ## Configurações para o WhatsApp
      - GROUPS=true
      - BROADCASTS=false
      - READRECEIPTS=forcedfalse
      - CALLS=true
      - READUPDATE=false
      - LOGLEVEL=DEBUG

      ## Configurações quepasa
      - QUEPASA_HOST_NAME=Quepasa
      - QUEPASA_MEMORY_LIMIT=4096M
      - WEBSOCKETSSL=true
      - REMOVEDIGIT9=true
      - SIGNING_SECRET=$key_quepasa

      ## Webhook
      #- WEBHOOK_QUEPASA=$url_webhook/webhook/quepasa
      #- WEBHOOK_TESTE_QUEPASA=$url_n8n/webhook-test/quepasa

      ## Portas
      - QUEPASA_EXTERNAL_PORT=31000
      - QUEPASA_INTERNAL_PORT=31000
      - WEBAPIPORT=31000

      ## Outras configurações
      - DEBUGREQUESTS=false
      - SYNOPSISLENGTH=500
      - METRICS_HOST=
      - METRICS_PORT=9392
      - MIGRATIONS=/builder/migrations
      - DEBUGJSONMESSAGES=false
      - HTTPLOGS=false

      ## WHATSMEOW SERVICE
      - WHATSMEOW_LOGLEVEL=WARN
      - WHATSMEOW_DBLOGLEVEL=WARN

      ## Env Mode
      - APP_ENV=production
      - NODE_ENV=production

    deploy:
      mode: replicated
      replicas: 1
      placement:
          constraints:
          - node.role == manager
      resources:
          limits:
              cpus: "2"
              memory: 2096M

      labels:
        - traefik.enable=true
        - traefik.http.routers.quepasa${1:+_$1}.rule=Host(\`$url_quepasa\`)
        - traefik.http.routers.quepasa${1:+_$1}.tls=true
        - traefik.http.routers.quepasa${1:+_$1}.entrypoints=web,websecure
        - traefik.http.routers.quepasa${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.quepasa${1:+_$1}.service=quepasa${1:+_$1}
        - traefik.http.routers.quepasa${1:+_$1}.priority=1
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.SSLRedirect=true
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.STSSeconds=315360000
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.browserXSSFilter=true
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.contentTypeNosniff=true
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.forceSTSHeader=true
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.SSLHost=\${QUEPASA_HOST}
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.STSIncludeSubdomains=true
        - traefik.http.middlewares.quepasa${1:+_$1}.headers.STSPreload=true
        - traefik.http.services.quepasa${1:+_$1}.loadbalancer.server.port=31000
        - traefik.http.services.quepasa${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  quepasa${1:+_$1}_volume:
    external: true
    name: quepasa${1:+_$1}_volume

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL

if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Quepasa"

fi
STACK_NAME="quepasa${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c quepasa.yaml quepasa > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Quepasa"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_quepasa para verificar se o serviço esta online
wait_stack "quepasa${1:+_$1}"

telemetria Quepasa finalizado

cd dados_vps

cat > dados_quepasa${1:+_$1} <<EOL
[ QUEPASA ]

Dominio do quepasa: https://$url_quepasa

Email: $email_quepasa

Usuario: Precisa de criar ao entrar no /setup

Senha: Precisa de criar ao entrar no /setup
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ QUEPASA ]\e[0m"
echo ""
echo -e "\e[33mDominio:\e[97m https://$url_quepasa\e[0m"
echo ""
echo -e "\e[33mEmail:\e[97m $email_quepasa\e[0m"
echo ""
echo -e "\e[33mUrl Setup:\e[97m https://$url_quepasa/setup\e[0m"
echo ""
echo -e "\e[33mUsuario:\e[97m Precisa de criar ao entrar no setup\e[0m"
echo ""
echo -e "\e[33mSenha:\e[97m Precisa de criar ao entrar no setup\e[0m"
echo ""

echo -e "\e[97mObservação:\e[33m Depois que criar sua conta no /setup, digite \e[97mquepasa.off \e[0m"
echo -e "\e[33mpara desativar o /setup do quepasa.\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗  ██████╗  ██████╗██╗   ██╗███████╗███████╗ █████╗ ██╗
## ██╔══██╗██╔═══██╗██╔════╝██║   ██║██╔════╝██╔════╝██╔══██╗██║
## ██║  ██║██║   ██║██║     ██║   ██║███████╗█████╗  ███████║██║
## ██║  ██║██║   ██║██║     ██║   ██║╚════██║██╔══╝  ██╔══██║██║
## ██████╔╝╚██████╔╝╚██████╗╚██████╔╝███████║███████╗██║  ██║███████╗
## ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝

ferramenta_docuseal() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_docuseal

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o dominio para o Docuseal (ex: docuseal.oriondesign.art.br): \e[0m" && read -r url_docuseal
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite a Email SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_docuseal
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_docuseal
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP (ex: @Senha123_): \e[0m" && read -r senha_smtp_docuseal
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_docuseal
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a Porta SMTP (ex: 465): \e[0m" && read -r porta_smtp_docuseal
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_docuseal

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do docuseal
    echo -e "\e[33mDominio do docuseal:\e[97m $url_docuseal\e[0m"
    echo ""

    ## Informação sobre URL do docuseal
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_docuseal\e[0m"
    echo ""

    ## Informação sobre URL do docuseal
    echo -e "\e[33mUser SMTP:\e[97m $user_smtp_docuseal\e[0m"
    echo ""

    ## Informação sobre URL do docuseal
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_docuseal\e[0m"
    echo ""

    ## Informação sobre URL do docuseal
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_docuseal\e[0m"
    echo ""

    ## Informação sobre URL do docuseal
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_docuseal\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_docuseal

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO DOCUSEAL \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Docuseal iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Cansei já de explicar o que isso faz kkkk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "docuseal${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "docuseal${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO DOCUSEAL \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Pegar o dominio do email
dominio_smtp_docuseal="${email_smtp_docuseal}"

key_docuseal=$(openssl rand -hex 16)
key_docuseal2=$(openssl rand -hex 16)


## Criando a stack docuseal.yaml
cat > docuseal${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  docuseal${1:+_$1}:
    image: docuseal/docuseal:latest

    volumes:
      - docuseal${1:+_$1}_data:/data

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de Acesso
      - HOST=$url_docuseal
      - FORCE_SSL=true

      ## Secret Key
      - SECRET_KEY_BASE=$key_docuseal

      ## Dados do Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/docuseal${1:+_$1}

      ## Dados SMTP
      - SMTP_USERNAME=$user_smtp_docuseal
      - SMTP_PASSWORD=$senha_smtp_docuseal
      - SMTP_ADDRESS=$host_smtp_docuseal
      - SMTP_PORT=$porta_smtp_docuseal
      - SMTP_FROM=$email_smtp_docuseal
      - SMTP_DOMAIN=$dominio_smtp_docuseal
      - SMTP_AUTHENTICATION=login

      ## Dados do S3
      ##- AWS_ACCESS_KEY_ID=
      ##- AWS_SECRET_ACCESS_KEY=
      ##- S3_ATTACHMENTS_BUCKET=

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.docuseal${1:+_$1}.rule=Host(\`$url_docuseal\`)
        - traefik.http.services.docuseal${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.docuseal${1:+_$1}.service=docuseal${1:+_$1}
        - traefik.http.routers.docuseal${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.docuseal${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.docuseal${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  docuseal${1:+_$1}_data:
    external: true
    name: docuseal${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do docuseal"
fi
STACK_NAME="docuseal${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c docuseal.yaml docuseal > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do docuseal"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_docuseal para verificar se o serviço esta online
wait_stack "docuseal${1:+_$1}"

telemetria Docuseal finalizado

cd dados_vps

cat > dados_docuseal${1:+_$1} <<EOL
[ DOCUSEAL ]

Dominio do docuseal: https://$url_docuseal

Usuario: Precisa de criar ao fazer o primeiro login

Senha: Precisa de criar ao fazer o primeiro login

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ DOCUSEAL ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_docuseal\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa de criar ao fazer o primeiro login\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar ao fazer o primeiro login\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██████╗  █████╗ ███████╗ █████╗ ███╗   ██╗ █████╗
## ██╔════╝ ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗
## ██║  ███╗██████╔╝███████║█████╗  ███████║██╔██╗ ██║███████║
## ██║   ██║██╔══██╗██╔══██║██╔══╝  ██╔══██║██║╚██╗██║██╔══██║
## ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║██║ ╚████║██║  ██║
##  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝

ferramenta_monitor() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_monitor

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o Grafana (ex: grafana.oriondesign.art.br): \e[0m" && read -r url_grafana
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o Prometheus (ex: prometheus.oriondesign.art.br): \e[0m" && read -r url_prometheus
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o cAdvisor (ex: cadvisor.oriondesign.art.br): \e[0m" && read -r url_cadvisor
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -en "\e[33mDigite o Dominio para o NodeExporter (ex: node.oriondesign.art.br): \e[0m" && read -r url_nodeexporter
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_monitor

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do Grafana:\e[97m $url_grafana\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mDominio do Prometheus:\e[97m $url_prometheus\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mDominio do Cadvisor:\e[97m $url_cadvisor\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mDominio do NodeExporter:\e[97m $url_nodeexporter\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_monitor

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO GRAFANA + PROMETHEUS + CADVISOR \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Grafana iniciado

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• BAIXANDO RECURSOS \e[33m[2/4]\e[0m"
echo ""
sleep 1

mkdir blablabla
cd blablabla

git clone https://github.com/oriondesign2015/SetupOrion.git > /dev/null 2>&1

sudo mv /root/blablabla/SetupOrion/Extras/Grafana/monitor-orion /opt

cd

rm -r blablabla

cd

cd

## Criando arquivo datasource
cat > datasource.yml <<EOL
apiVersion: 1
datasources:
- name: Prometheus
  type: prometheus
  url: https://$url_prometheus
  isDefault: true
  access: proxy
  editable: true
EOL
if [ $? -eq 0 ]; then
    echo "1/4 - [ OK ] - Criando datasource.yml"
else
    echo "1/4 - [ OFF ]"
    echo "Não foi possivel criar o datasource"
fi


cp /root/datasource.yml /opt/monitor-orion/grafana/
if [ $? -eq 0 ]; then
    echo "2/6 - [ OK ]"
else
    echo "2/6 - [ OFF ]"
    echo "Não foi possivel copiar o datasource para o diretório opt"
fi

cp /root/datasource.yml /opt/monitor-orion/grafana/provisioning/datasources/
if [ $? -eq 0 ]; then
    echo "3/6 - [ OK ]"
else
    echo "3/6 - [ OFF ]"
    echo "Não foi possivel copiar o datasource para o diretório opt"
fi

rm /root/datasource.yml
if [ $? -eq 0 ]; then
    echo "4/6 - [ OK ]"
else
    echo "4/6 - [ OFF ]"
    echo "Não foi possivel deletar o datasource para o diretório opt"
fi

cd

## Criando arquivo prometheus yml
cat > prometheus.yml <<EOL
global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s
alerting:
  alertmanagers:
  - static_configs:
    - targets: []
    scheme: http
    timeout: 10s
    api_version: v2
scrape_configs:
- job_name: prometheus
  honor_timestamps: true
  scrape_interval: 15s
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: http
  static_configs:
  - targets: ['$url_prometheus','$url_cadvisor','$url_nodeexporter']

EOL
if [ $? -eq 0 ]; then
    echo "5/6 - [ OK ]"
else
    echo "5/6 - [ OFF ]"
    echo "Não foi possivel criar o prometheus"
fi

mv /root/prometheus.yml /opt/monitor-orion/prometheus/
if [ $? -eq 0 ]; then
    echo "6/6 - [ OK ]"
else
    echo "6/6 - [ OFF ]"
    echo "Não foi possivel copiar o datasource para o diretório opt"
fi

cd
cd
echo ""

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO GRAFANA + PROMETHEUS + CADVISOR \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Aqui de fato vamos iniciar a instalação das ferramentas

## Criando a stack monitor.yaml ou grafana.yaml
cat > monitor.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  prometheus:
    image: prom/prometheus:latest

    volumes:
      - /opt/monitor-orion/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml

    networks:
      - $nome_rede_interna

    ports:
      - "9191:9090"

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.prometheus.rule=Host(\`$url_prometheus\`)
        - traefik.http.services.prometheus.loadbalancer.server.port=9090
        - traefik.http.routers.prometheus.service=prometheus
        - traefik.http.routers.prometheus.tls.certresolver=letsencryptresolver
        - traefik.http.routers.prometheus.entrypoints=websecure
        - traefik.http.routers.prometheus.tls=true

## --------------------------- ORION --------------------------- ##

  grafana:
    image: grafana/grafana:latest

    volumes:
      - /opt/monitor-orion/grafana/grafana.ini:/etc/grafana/grafana.ini
      - /opt/monitor-orion/grafana/provisioning/datasources:/etc/grafana/provisioning/datasources
      - /opt/monitor-orion/grafana/provisioning/dashboards:/etc/grafana/provisioning/dashboards
      - /opt/monitor-orion/grafana/dashboards:/etc/grafana/dashboards

    networks:
      - $nome_rede_interna

    ports:
      - "3111:3000"

    links:
      - prometheus
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.grafana.rule=Host(\`$url_grafana\`)
        - traefik.http.services.grafana.loadbalancer.server.port=3000
        - traefik.http.routers.grafana.service=grafana
        - traefik.http.routers.grafana.tls.certresolver=letsencryptresolver
        - traefik.http.routers.grafana.entrypoints=websecure
        - traefik.http.routers.grafana.tls=true

## --------------------------- ORION --------------------------- ##

  node-exporter:
    image: prom/node-exporter:latest
    restart: unless-stopped

    networks:
      - $nome_rede_interna

    ports:
      - "9100:9100"

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.node-exporter.rule=Host(\`$url_nodeexporter\`)
        - traefik.http.services.node-exporter.loadbalancer.server.port=9100
        - traefik.http.routers.node-exporter.service=node-exporter
        - traefik.http.routers.node-exporter.tls.certresolver=letsencryptresolver
        - traefik.http.routers.node-exporter.entrypoints=websecure
        - traefik.http.routers.node-exporter.tls=true

## --------------------------- ORION --------------------------- ##

  cadvisor:
    image: gcr.io/cadvisor/cadvisor
    restart: unless-stopped

    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:rw
      - /sys:/sys:ro
      - /sys/fs/cgroup:/sys/fs/cgroup
      - /var/lib/docker/:/var/lib/docker:ro

    networks:
      - $nome_rede_interna

    ports:
      - "8181:8080"

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.cadvisor.rule=Host(\`$url_cadvisor\`)
        - traefik.http.services.cadvisor.loadbalancer.server.port=8080
        - traefik.http.routers.cadvisor.service=cadvisor
        - traefik.http.routers.cadvisor.tls.certresolver=letsencryptresolver
        - traefik.http.routers.cadvisor.entrypoints=websecure
        - traefik.http.routers.cadvisor.tls=true

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna:
    name: $nome_rede_interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Monitor"
fi
STACK_NAME="monitor"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c monitor.yaml monitor > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Monitor"
#fi

echo ""
sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_monitor para verificar se o serviço esta online
wait_stack "monitor"

telemetria Grafana finalizado

cd dados_vps

cat > dados_monitor <<EOL
[ MONITOR ]

Dominio Grafana: https://$url_grafana

Dominio Prometheus: https://$url_prometheus

Dominio cAdvisor: https://$url_cadvisor

Dominio NodeExporter: https://$url_nodeexporter

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ GRAFANA + PROMETHEUS + CADVISOR ]\e[0m"
echo ""

echo -e "\e[97mDominio Grafana:\e[33m https://$url_grafana\e[0m"
echo ""

echo -e "\e[97mUsuario Grafana:\e[33m admin\e[0m"
echo ""

echo -e "\e[97mSenha Grafana:\e[33m admin\e[0m"
echo -e "\e[97mDepois do primeiro login, será solicitado que você altere a senha.\e[0m"
echo ""

echo -e "\e[97mDominio Prometheus:\e[33m https://$url_prometheus\e[0m"
echo ""

echo -e "\e[97mDominio cAdvisor:\e[33m https://$url_cadvisor\e[0m"
echo ""

echo -e "\e[97mDominio NodeExporter:\e[33m https://$url_nodeexporter\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗ ██╗███████╗██╗   ██╗ █████╗ ██╗
## ██╔══██╗██║██╔════╝╚██╗ ██╔╝██╔══██╗██║
## ██║  ██║██║█████╗   ╚████╔╝ ███████║██║
## ██║  ██║██║██╔══╝    ╚██╔╝  ██╔══██║██║
## ██████╔╝██║██║        ██║██╗██║  ██║██║
## ╚═════╝ ╚═╝╚═╝        ╚═╝╚═╝╚═╝  ╚═╝╚═╝

ferramenta_dify() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_dify

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Dify AI
    echo -e "\e[97mPasso$amarelo 1/9\e[0m"
    echo -en "\e[33mDigite o dominio para o Dify AI (ex: dify.oriondesign.art.br): \e[0m" && read -r url_dify
    echo ""

    ##Pergunta o Dominio do Dify AI
    echo -e "\e[97mPasso$amarelo 2/9\e[0m"
    echo -en "\e[33mDigite o dominio para o API do Dify AI (ex: api-dify.oriondesign.art.br): \e[0m" && read -r url_dify_api
    echo ""

    ##Pergunta o Dominio do Qdrant
    #read -r ip _ <<<$(hostname -I)
    #echo -e "\e[97mPasso$amarelo 2/10\e[0m"
    #echo -en "\e[33mDigite o dominio do Qdrant (ex: http://$ip  ou http://qdrant.oriondesign.art.br): \e[0m" && read -r url_quedrant
    #echo ""

    ##Pergunta a Api Key do Qdrant
    #key_dify_rand=$(openssl rand -hex 16)
    #echo -e "\e[97mPasso$amarelo 3/10\e[0m"
    #echo -en "\e[33mDigite a Api Key do Qdrant (ex: $key_dify_rand): \e[0m" && read -r apikey_qdrant
    #echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 3/9\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_dify
    echo ""


    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 4/9\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_email_dify
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 5/9\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_dify
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 6/9\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_dify
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 7/9\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_dify
    echo ""

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 8/9\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 9/9\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_dify

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Builder
    echo -e "\e[33mDominio do Dify AI:\e[97m $url_dify\e[0m"
    echo ""

    ## Informação sobre URL do Viewer
    #echo -e "\e[33mDominio do Qdrant:\e[97m $url_quedrant\e[0m"
    #echo ""

    ## Informação sobre a versão da ferramenta
    #echo -e "\e[33mApi Key Qdrant:\e[97m $apikey_qdrant\e[0m"
    #echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail do SMTP:\e[97m $email_dify\e[0m"
    echo ""

    ## Informação sobre UserSMTP
    echo -e "\e[33mUser do SMTP:\e[97m $user_email_dify\e[0m"
    echo ""

    ## Informação sobre Senha do Email
    echo -e "\e[33mSenha do Email:\e[97m $senha_email_dify\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP do Email:\e[97m $smtp_email_dify\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_dify\e[0m"
    echo ""

    ## Informação sobre Access Key
    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""

    ## Informação sobre Secret Key
    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_dify

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO DIFY \e[33m[1/6]\e[0m"
echo ""
sleep 1

telemetria Dify iniciado

cd

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/6]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "dify${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "dify${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/6]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi


## Mensagem de Passo
echo -e "\e[97m• PEGANDO DADOS MINIO \e[33m[4/6]\e[0m"
echo ""
sleep 1

pegar_senha_minio
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Pegando senha do MinIO"
else
    echo "1/2 - [ OFF ] - Pegando senha do MinIO"
    echo "Não foi possivel pegar a senha do minio"
fi
pegar_link_s3
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Pegando Url S3 do MinIO"
else
    echo "2/2 - [ OFF ] - Pegando Url S3 do MinIO"
    echo "Não foi possivel pegar o link do S3"
fi
echo ""

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO DIFY \e[33m[5/6]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
secret_key=$(openssl rand -hex 16)
token_weaviate=$(openssl rand -hex 16)
sandbox_key=$(openssl rand -hex 16)

## Criando a stack dify.yaml
cat > dify${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  dify${1:+_$1}_api:
    image: langgenius/dify-api:0.13.2 ## Versão do Dify

    volumes:
      - dify${1:+_$1}_storage:/app/api/storage

    networks:
      - $nome_rede_interna

    environment:
      ## Modo da execução
      - MODE=api

      ## Logs
      - LOG_LEVEL=INFO

      ## Secret Key
      - SECRET_KEY=$secret_key

      ## Outras Url (vazio = mesmo do APP_WEB_URL)
      - CONSOLE_WEB_URL=https://$url_dify ## Url Dify Web
      - INIT_PASSWORD=
      - CONSOLE_API_URL=https://$url_dify_api ## Url Dify API
      - SERVICE_API_URL=https://$url_dify_api ## Url Dify API
      - FILES_URL=https://$url_dify_api

      ## Url Dify
      - APP_WEB_URL=https://$url_dify ## Url Dify Web

      ## Dados Postgres
      - MIGRATION_ENABLED=true
      - DB_USERNAME=postgres
      - DB_PASSWORD=$senha_postgres
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=dify${1:+_$1}

      ## Dados Redis
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - REDIS_USERNAME=
      - REDIS_PASSWORD=
      - REDIS_USE_SSL=false
      - REDIS_DB=0
      - CELERY_BROKER_URL=redis://redis:6379/1

      ## Liberar acesso a todos os ip
      - WEB_API_CORS_ALLOW_ORIGINS=*
      - CONSOLE_CORS_ALLOW_ORIGINS=*

      ## Dados sobre armazenamento s3
      - STORAGE_TYPE=s3
      - STORAGE_LOCAL_PATH=storage
      - S3_ENDPOINT=https://$url_s3
      - S3_BUCKET_NAME=dify${1:+-$1}
      - S3_ACCESS_KEY=$S3_ACCESS_KEY
      - S3_SECRET_KEY=$S3_SECRET_KEY

      ## Configurações do Sandbox
      - CODE_EXECUTION_ENDPOINT=http://dify${1:+_$1}_sandbox:8194
      - CODE_EXECUTION_API_KEY=$sandbox_key
      - CODE_MAX_NUMBER=9223372036854775807
      - CODE_MIN_NUMBER=-9223372036854775808
      - CODE_MAX_STRING_LENGTH=80000
      - TEMPLATE_TRANSFORM_MAX_LENGTH=80000
      - CODE_MAX_STRING_ARRAY_LENGTH=30
      - CODE_MAX_OBJECT_ARRAY_LENGTH=30
      - CODE_MAX_NUMBER_ARRAY_LENGTH=1000

      ## Dados Weaviate
      - VECTOR_STORE=weaviate
      - WEAVIATE_ENDPOINT=http://dify${1:+_$1}_weaviate:8080
      - WEAVIATE_API_KEY=$token_weaviate
      - WEAVIATE_CLIENT_TIMEOUT=20

      ## Dados do Email
      - MAIL_TYPE=smtp
      - MAIL_DEFAULT_SEND_FROM=$email_dify (eg=no-reply $email_dify)
      - SMTP_SERVER=$smtp_email_dify
      - SMTP_PORT=$porta_smtp_dify
      - SMTP_USERNAME=$user_email_dify
      - SMTP_PASSWORD=$senha_email_dify

      ## Sentry
      - SENTRY_DSN=
      - SENTRY_TRACES_SAMPLE_RATE=1.0
      - SENTRY_PROFILES_SAMPLE_RATE=1.0

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 4096M
      labels:
        - traefik.enable=true
        - traefik.http.routers.dify${1:+_$1}_api.rule=Host(\`$url_dify_api\`)
        - traefik.http.services.dify${1:+_$1}_api.loadbalancer.server.port=5001
        - traefik.http.routers.dify${1:+_$1}_api.service=dify${1:+_$1}_api
        - traefik.http.routers.dify${1:+_$1}_api.tls.certresolver=letsencryptresolver
        - traefik.http.routers.dify${1:+_$1}_api.entrypoints=websecure
        - traefik.http.routers.dify${1:+_$1}_api.tls=true
        - traefik.http.middlewares.corsMiddleware.headers.accessControlAllowMethods=GET,POST,PUT,DELETE,OPTIONS
        - traefik.http.middlewares.corsMiddleware.headers.accessControlAllowHeaders=Content-Type,Authorization

## --------------------------- ORION --------------------------- ##

  dify${1:+_$1}_worker:
    image: langgenius/dify-api:0.13.2 ## Versão do Dify

    volumes:
      - dify${1:+_$1}_storage:/app/api/storage

    networks:
      - $nome_rede_interna

    environment:
      ## Modo da execução
      - MODE=worker

      ## Logs
      - LOG_LEVEL=INFO

      ## Secret Key
      - SECRET_KEY=$secret_key

      ## Outras Url (vazio = mesmo do APP_WEB_URL)
      - CONSOLE_WEB_URL=https://$url_dify ## Url Dify Web
      - INIT_PASSWORD=
      - CONSOLE_API_URL=https://$url_dify_api ## Url Dify API
      - SERVICE_API_URL=https://$url_dify_api ## Url Dify API
      - FILES_URL=https://$url_dify_api

      ## Url Dify
      - APP_WEB_URL=https://$url_dify ## Url Dify Web

      ## Dados Postgres
      - MIGRATION_ENABLED=true
      - DB_USERNAME=postgres
      - DB_PASSWORD=$senha_postgres
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=dify${1:+_$1}

      ## Dados Redis
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - REDIS_USERNAME=
      - REDIS_PASSWORD=
      - REDIS_USE_SSL=false
      - REDIS_DB=0
      - CELERY_BROKER_URL=redis://redis:6379/1

      ## Liberar acesso a todos os ip
      - WEB_API_CORS_ALLOW_ORIGINS=*
      - CONSOLE_CORS_ALLOW_ORIGINS=*

      ## Dados sobre armazenamento s3
      - STORAGE_TYPE=s3
      - STORAGE_LOCAL_PATH=storage
      - S3_ENDPOINT=https://$url_s3
      - S3_BUCKET_NAME=dify${1:+-$1}
      - S3_ACCESS_KEY=$S3_ACCESS_KEY
      - S3_SECRET_KEY=$S3_SECRET_KEY

      ## Configurações do Sandbox
      - CODE_EXECUTION_ENDPOINT=http://dify${1:+_$1}_sandbox:8194
      - CODE_EXECUTION_API_KEY=$sandbox_key
      - CODE_MAX_NUMBER=9223372036854775807
      - CODE_MIN_NUMBER=-9223372036854775808
      - CODE_MAX_STRING_LENGTH=80000
      - TEMPLATE_TRANSFORM_MAX_LENGTH=80000
      - CODE_MAX_STRING_ARRAY_LENGTH=30
      - CODE_MAX_OBJECT_ARRAY_LENGTH=30
      - CODE_MAX_NUMBER_ARRAY_LENGTH=1000

      ## Dados Weaviate
      - VECTOR_STORE=weaviate
      - WEAVIATE_ENDPOINT=http://dify${1:+_$1}_weaviate:8080
      - WEAVIATE_API_KEY=$token_weaviate
      - WEAVIATE_CLIENT_TIMEOUT=20

      ## Dados do Email
      - MAIL_TYPE=smtp
      - MAIL_DEFAULT_SEND_FROM=$email_dify (eg=no-reply $email_dify)
      - SMTP_SERVER=$smtp_email_dify
      - SMTP_PORT=$porta_smtp_dify
      - SMTP_USERNAME=$user_email_dify
      - SMTP_PASSWORD=$senha_email_dify

      ## Sentry
      - SENTRY_DSN=
      - SENTRY_TRACES_SAMPLE_RATE=1.0
      - SENTRY_PROFILES_SAMPLE_RATE=1.0

    depends_on:
      - postgres
      - redis
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 4096M

## --------------------------- ORION --------------------------- ##

  dify${1:+_$1}_web:
    image: langgenius/dify-web:0.13.2 ## Versão do Dify

    networks:
      - $nome_rede_interna

    environment:
      ## Tipo da Edição
      - EDITION=SELF_HOSTED
      - CONSOLE_API_URL=https://$url_dify_api ## Url Dify API

      ## Url Dify
      - APP_API_URL=https://$url_dify_api ## Url Dify API

      ## Sentry
      - SENTRY_DSN=

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 4096M
      labels:
        - traefik.enable=true
        - traefik.http.routers.dify${1:+_$1}_web.rule=Host(\`$url_dify\`)
        - traefik.http.services.dify${1:+_$1}_web.loadbalancer.server.port=3000
        - traefik.http.routers.dify${1:+_$1}_web.service=dify${1:+_$1}_web
        - traefik.http.routers.dify${1:+_$1}_web.tls.certresolver=letsencryptresolver
        - traefik.http.routers.dify${1:+_$1}_web.entrypoints=websecure
        - traefik.http.routers.dify${1:+_$1}_web.tls=true
        - traefik.http.middlewares.corsMiddleware.headers.accessControlAllowMethods=GET,POST,PUT,DELETE,OPTIONS
        - traefik.http.middlewares.corsMiddleware.headers.accessControlAllowHeaders=Content-Type,Authorization

## --------------------------- ORION --------------------------- ##

  dify${1:+_$1}_sandbox:
    image: langgenius/dify-sandbox:0.2.10

    networks:
      - $nome_rede_interna

    environment:
      - API_KEY=$sandbox_key
      - GIN_MODE=release
      - WORKER_TIMEOUT=15

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 4096M

## --------------------------- ORION --------------------------- ##

  dify${1:+_$1}_weaviate:
    image: semitechnologies/weaviate:latest ## Versão do Weaviate

    volumes:
      - dify${1:+_$1}_weaviate:/var/lib/weaviate

    networks:
      - $nome_rede_interna

    environment:
      ## Configurações Gerais
      - QUERY_DEFAULTS_LIMIT=25
      - AUTHENTICATION_ANONYMOUS_ACCESS_ENABLED=false
      - PERSISTENCE_DATA_PATH=/var/lib/weaviate
      - DEFAULT_VECTORIZER_MODULE=none
      - CLUSTER_HOSTNAME=node1

      ## Dados de Autenticação
      - AUTHENTICATION_APIKEY_ENABLED=true
      - AUTHENTICATION_APIKEY_ALLOWED_KEYS=$token_weaviate
      - AUTHENTICATION_APIKEY_USERS=contato@oriondesign.art.br
      - AUTHORIZATION_ADMINLIST_ENABLED=true
      - AUTHORIZATION_ADMINLIST_USERS=contato@oriondesign.art.br

      ## Telemetria
      - DISABLE_TELEMETRY=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 4096M

## --------------------------- ORION --------------------------- ##

volumes:
  dify${1:+_$1}_storage:
    external: true
    name: dify${1:+_$1}_storage
  dify${1:+_$1}_weaviate:
    external: true
    name: dify${1:+_$1}_weaviate

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Dify Ai"
fi
STACK_NAME="dify${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c dify.yaml dify > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do Dify Ai"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[6/6]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_dify para verificar se o serviço esta online
wait_stack "dify${1:+_$1}"

telemetria Dify finalizado

cd dados_vps

cat > dados_dify${1:+_$1} <<EOL
[ DIFY AI ]

Dominio do dify: https://$url_dify

Email: Precisa de criar na primeira vez que entrar no Dify AI

Senha: Precisa de criar na primeira vez que entrar no Dify AI
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ DIFY AI ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_dify\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa de criar na primeira vez que entrar no Dify AI.\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar na primeira vez que entrar no Dify AI.\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██╗     ██╗      █████╗ ███╗   ███╗ █████╗
## ██╔═══██╗██║     ██║     ██╔══██╗████╗ ████║██╔══██╗
## ██║   ██║██║     ██║     ███████║██╔████╔██║███████║
## ██║   ██║██║     ██║     ██╔══██║██║╚██╔╝██║██╔══██║
## ╚██████╔╝███████╗███████╗██║  ██║██║ ╚═╝ ██║██║  ██║
##  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝

ferramenta_ollama() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_ollama

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o WebUI Ollama (ex: ollama.oriondesign.art.br): \e[0m" && read -r url_ollama
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite o dominio para a API Ollama (ex: apiollama.oriondesign.art.br): \e[0m" && read -r url_apiollama
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_ollama

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o WebUI Ollama:\e[97m $url_ollama\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mDominio para a API do Ollama:\e[97m $url_apiollama\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_ollama

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO OLLAMA \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Ollama iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO OLLAMA \e[33m[3/4]\e[0m"
echo ""
sleep 1

WEBUI_SECRET_KEY=$(openssl rand -hex 16)

## Criando a stack ollama.yaml
cat > ollama${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  ollama${1:+_$1}:
    image: ollama/ollama:latest

    volumes:
      - ollama${1:+_$1}_data:/root/.ollama

    networks:
      - $nome_rede_interna

    #ports:
    #  - 11434:11434

    environment:
      - OLLAMA_HOST=0.0.0.0

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=1
        - traefik.http.routers.ollama${1:+_$1}.rule=Host(\`$url_apiollama\`)
        - traefik.http.routers.ollama${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.ollama${1:+_$1}.priority=1
        - traefik.http.routers.ollama${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.ollama${1:+_$1}.service=ollama${1:+_$1}
        - traefik.http.services.ollama${1:+_$1}.loadbalancer.server.port=11434
        - traefik.http.services.ollama${1:+_$1}.loadbalancer.passHostHeader=1

## --------------------------- ORION --------------------------- ##

  openwebui${1:+_$1}:
    image: ghcr.io/open-webui/open-webui:main

    volumes:
      - open${1:+_$1}_webui:/app/backend/data

    networks:
      - $nome_rede_interna

    #ports:
    #  - 8085:8080

    environment:
      - OLLAMA_BASE_URL=https://$url_apiollama
      - WEBUI_SECRET_KEY=$WEBUI_SECRET_KEY

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.openwebui${1:+_$1}.rule=Host(\`$url_ollama\`)
        - traefik.http.routers.openwebui${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.openwebui${1:+_$1}.priority=1
        - traefik.http.routers.openwebui${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.openwebui${1:+_$1}.service=openwebui${1:+_$1}
        - traefik.http.services.openwebui${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.services.openwebui${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  ollama${1:+_$1}_data:
    external: true
    name: ollama${1:+_$1}_data
  open${1:+_$1}_webui:
    external: true
    name: open${1:+_$1}_webui

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Ollama"
fi
STACK_NAME="ollama${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c ollama.yaml ollama > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Ollama"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_nocodb para verificar se o serviço esta online
wait_stack "ollama${1:+_$1}"

cd dados_vps

cat > dados_ollama${1:+_$1} <<EOL
[ OLLAMA ]

Dominio do Open WebUI: https://$url_ollama

Dominio da API Ollama: https://$url_apiollama

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ OLLAMA ]\e[0m"
echo ""

echo -e "\e[33mOpen WebUI:\e[97m https://$url_ollama\e[0m"
echo ""

echo -e "\e[33mOllama API:\e[97m https://$url_apiollama\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  █████╗ ███████╗███████╗██╗███╗   ██╗███████╗
## ██╔══██╗██╔════╝██╔════╝██║████╗  ██║██╔════╝
## ███████║█████╗  █████╗  ██║██╔██╗ ██║█████╗
## ██╔══██║██╔══╝  ██╔══╝  ██║██║╚██╗██║██╔══╝
## ██║  ██║██║     ██║     ██║██║ ╚████║███████╗
## ╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝

ferramenta_affine() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_affine

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/7\e[0m"
    echo -en "\e[33mDigite o dominio para o Affine (ex: affine.oriondesign.art.br): \e[0m" && read -r url_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/7\e[0m"
    echo -en "\e[33mDigite o Email de Admin (ex: contato@oriondesign.art.br): \e[0m" && read -r email_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/7\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite a Senha de Admin (ex: @Senha123_): \e[0m" && read -r senha_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/7\e[0m"
    echo -en "\e[33mDigite a Email SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 5/7\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP (ex: @Senha123_): \e[0m" && read -r senha_smtp_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 6/7\e[0m"
    echo -en "\e[33mDigite o Host SMTP (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_affine
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 7/7\e[0m"
    echo -en "\e[33mDigite a Porta SMTP (ex: 465): \e[0m" && read -r porta_smtp_affine
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_affine

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do affine
    echo -e "\e[33mDominio do Affine:\e[97m $url_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mEmail de Admin:\e[97m $email_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mSenha de Admin:\e[97m $senha_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_affine\e[0m"
    echo ""

    ## Informação sobre URL do affine
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_affine\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_affine

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO AFFINE \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Affine iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "affine${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "affine${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO AFFINE \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando a stack affine.yaml
cat > affine${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  affine${1:+_$1}:
    image: ghcr.io/toeverything/affine-graphql:stable-39476d1
    command:
      ['sh', '-c', 'node ./scripts/self-host-predeploy && node ./dist/index.js']

    volumes:
      - affine${1:+_$1}_config:/root/.affine/config:rw
      - affine${1:+_$1}_storage:/root/.affine/storage:rw

    networks:
      - $nome_rede_interna

    #ports:
    #  - 3010:3010
    #  - 5555:5555

    logging:
      driver: 'json-file'
      options:
        max-size: '1000m'
    restart: on-failure:5

    environment:
      ## Dados de acesso
      - AFFINE_ADMIN_EMAIL=$email_affine
      - AFFINE_ADMIN_PASSWORD=$senha_affine
      - AFFINE_SERVER_HOST=$url_affine

      ## Dados do SMTP
      - MAILER_USER=$email_smtp_affine
      - MAILER_PASSWORD=$senha_smtp_affine
      - MAILER_HOST=$host_smtp_affine
      - MAILER_PORT=$porta_smtp_affine

      ## Dados do Postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=$senha_postgres
      - POSTGRES_DB=affine${1:+_$1}
      - DATABASE_URL=postgres://postgres:$senha_postgres@postgres:5432/affine${1:+_$1}?sslmode=disable
      - PGDATA=/var/lib/postgresql/data/pgdata

      ## Outras configurações
      - NODE_OPTIONS="--import=./scripts/register.js"
      - AFFINE_CONFIG_PATH=/root/.affine/config
      - REDIS_SERVER_HOST=redis
      - NODE_ENV=production

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.affine${1:+_$1}.rule=Host(\`$url_affine\`)
        - traefik.http.services.affine${1:+_$1}.loadbalancer.server.port=3010
        - traefik.http.routers.affine${1:+_$1}.service=affine${1:+_$1}
        - traefik.http.routers.affine${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.affine${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.affine${1:+_$1}.tls=true
        - traefik.frontend.headers.STSPreload=true
        - traefik.frontend.headers.STSSeconds=31536000

## --------------------------- ORION --------------------------- ##

volumes:
  affine${1:+_$1}_config:
    external: true
    name: affine${1:+_$1}_config
  affine${1:+_$1}_storage:
    external: true
    name: affine${1:+_$1}_storage

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Affine"
fi
STACK_NAME="affine${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c affine.yaml affine > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Affine"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "affine" para verificar se o serviço esta online
wait_stack "affine${1:+_$1}"

telemetria Affine finalizado

cd dados_vps

cat > dados_affine${1:+_$1} <<EOL
[ AFFINE ]

Dominio do Affine: https://$url_affine

Usuario: $email_affine

Senha: $senha_affine

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ AFFINE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_affine\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $email_affine\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $senha_affine\e[0m"
echo ""

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗ ██╗██████╗ ███████╗ ██████╗████████╗██╗   ██╗███████╗
## ██╔══██╗██║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔════╝
## ██║  ██║██║██████╔╝█████╗  ██║        ██║   ██║   ██║███████╗
## ██║  ██║██║██╔══██╗██╔══╝  ██║        ██║   ██║   ██║╚════██║
## ██████╔╝██║██║  ██║███████╗╚██████╗   ██║   ╚██████╔╝███████║
## ╚═════╝ ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚══════╝

ferramenta_directus() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_directus

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/9\e[0m"
    echo -en "\e[33mDigite o dominio para o Directus (ex: directus.oriondesign.art.br): \e[0m" && read -r url_directus
    echo ""

     ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/9\e[0m"
    echo -en "\e[33mDigite a Email de Admin (ex: contato@oriondesign.art.br): \e[0m" && read -r email_directus
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/9\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite a Senha SMTP (ex: @Senha123_): \e[0m" && read -r senha_directus
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/9\e[0m"
    echo -en "\e[33mDigite a Email SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_directus
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 5/9\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP (ex: @Senha123_): \e[0m" && read -r senha_smtp_directus
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 6/9\e[0m"
    echo -en "\e[33mDigite o Host SMTP (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_directus
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 7/9\e[0m"
    echo -en "\e[33mDigite a Porta SMTP (ex: 465): \e[0m" && read -r porta_smtp_directus
    echo ""

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 8/9\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 9/9\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    pegar_senha_minio
    if [ $? -eq 0 ]; then
        echo "1/2 - [ OK ] - Pegando senha do MinIO"
    else
        echo "1/2 - [ OFF ] - Pegando senha do MinIO"
        echo "Não foi possivel pegar a senha do minio"
    fi
    pegar_link_s3
    if [ $? -eq 0 ]; then
        echo "2/2 - [ OK ] - Pegando Url S3 do MinIO"
    else
        echo "2/2 - [ OFF ] - Pegando Url S3 do MinIO"
        echo "Não foi possivel pegar o link do S3"
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_directus

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do directus
    echo -e "\e[33mDominio do Directus:\e[97m $url_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mEmail de Admin:\e[97m $email_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mSenha de Admin:\e[97m $senha_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_directus\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""

    ## Informação sobre URL do directus
    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_directus" -eq 465 ]; then
    ssl_smtp_directus=true
    else
    ssl_smtp_directus=false
    fi

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_directus

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO DIRECTUS \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Directus iniciado
## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "directus${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "directus${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi
## Mensagem de Passo
echo -e "\e[97m• INSTALANDO DIRECTUS \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Gerar Secret Key
key_directus=$(openssl rand -hex 16)
key_directus2=$(openssl rand -hex 16)

## Criando a stack directus.yaml
cat > directus${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  directus${1:+_$1}:
    image: directus/directus:latest

    volumes:
      - directus${1:+_$1}_uploads:/directus/uploads
      - directus${1:+_$1}_data:/directus/database

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de acesso
      - ADMIN_EMAIL=$email_directus
      - ADMIN_PASSWORD=$senha_directus
      - PUBLIC_URL=https://$url_directus

      ## Dados SMTP
      - EMAIL_SMTP_USER=$email_smtp_directus
      - EMAIL_SMTP_PASSWORD=$senha_smtp_directus
      - EMAIL_SMTP_HOST=$host_smtp_directus
      - EMAIL_SMTP_PORT=$porta_smtp_directus
      - EMAIL_SMTP_SECURE=$ssl_smtp_directus

      ## Dados MinIO
      - STORAGE_s3_KEY=$S3_ACCESS_KEY
      - STORAGE_s3_SECRET=$S3_SECRET_KEY
      - STORAGE_s3_BUCKET=directus${1:+-$1}
      - STORAGE_s3_REGION=eu-south
      - STORAGE_s3_ENDPOINT=$url_s3

      ## Redis
      - REDIS=redis://redis:6379/4

      ## Secret Keys & Env
      - KEY=$key_directus
      - SECRET=$key_directus2
      - APP_ENV=production

      ## Dados Postgres
      - DB_CLIENT=postgres
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=directus${1:+_$1}
      - DB_USER=postgres
      - DB_PASSWORD=$senha_postgres
      - DB_CONNECTION_STRING=postgresql://postgres:$senha_postgres@postgres:5432/directus${1:+_$1}
      - DB_PREFIX=drcts_

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.directus${1:+_$1}.rule=Host(\`$url_directus\`)
        - traefik.http.services.directus${1:+_$1}.loadbalancer.server.port=8055
        - traefik.http.routers.directus${1:+_$1}.service=directus${1:+_$1}
        - traefik.http.routers.directus${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.directus${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.directus${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  directus${1:+_$1}_uploads:
    external: true
    name: directus${1:+_$1}_uploads
  directus${1:+_$1}_data:
    external: true
    name: directus${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    attachable: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do directus"
fi
STACK_NAME="directus${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c directus.yaml directus > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do directus"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_tack "directus" para verificar se o serviço esta online
wait_stack "directus${1:+_$1}"

telemetria Directus finalizado

cd dados_vps

cat > dados_directus${1:+_$1} <<EOL
[ DIRECTUS ]

Dominio do directus: https://$url_directus

Usuario: $email_directus

Senha: $senha_directus

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ DIRECTUS ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_directus\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $email_directus\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $senha_directus\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗   ██╗ █████╗ ██╗   ██╗██╗  ████████╗██╗    ██╗ █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗
## ██║   ██║██╔══██╗██║   ██║██║  ╚══██╔══╝██║    ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║
## ██║   ██║███████║██║   ██║██║     ██║   ██║ █╗ ██║███████║██████╔╝██║  ██║█████╗  ██╔██╗ ██║
## ╚██╗ ██╔╝██╔══██║██║   ██║██║     ██║   ██║███╗██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██║╚██╗██║
##  ╚████╔╝ ██║  ██║╚██████╔╝███████╗██║   ╚███╔███╔╝██║  ██║██║  ██║██████╔╝███████╗██║ ╚████║
##   ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝

ferramenta_vaultwarden() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_vaultwarden

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/5\e[0m"
    echo -en "\e[33mDigite o Dominio para o VaultWarden (ex: vaultwarden.oriondesign.art.br): \e[0m" && read -r url_vaultwarden
    echo ""

    ## Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 2/5\e[0m"
    echo -en "\e[33mDigite um Email para o SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_vaultwarden
    echo ""

    ## Pergunta a Senha SMTP
    echo -e "\e[97mPasso$amarelo 3/5\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do email (ex: @Senha123_): \e[0m" && read -r senha_vaultwarden
    echo ""

    ## Pergunta o Host SMTP
    echo -e "\e[97mPasso$amarelo 4/5\e[0m"
    echo -en "\e[33mDigite o Host SMTP do email (ex: smtp.hostinger.com): \e[0m" && read -r host_vaultwarden
    echo ""

    ## Pergunta a Porta SMTP
    echo -e "\e[97mPasso$amarelo 5/5\e[0m"
    echo -en "\e[33mDigite a Porta SMTP do email (ex: 465): \e[0m" && read -r porta_vaultwarden
    echo ""

    if [ "$porta_vaultwarden" -eq 465 ] || [ "$porta_vaultwarden" -eq 25 ]; then
        ssl_vaultwarden=force_tls
    else
        ssl_vaultwarden=starttls
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_vaultwarden

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio:\e[97m $url_vaultwarden\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail SMTP:\e[97m $email_vaultwarden\e[0m"
    echo ""

    ## Informação sobre Senha
    echo -e "\e[33mSenha SMTP:\e[97m $senha_vaultwarden\e[0m"
    echo ""

    ## Informação sobre Host
    echo -e "\e[33mHost SMTP:\e[97m $host_vaultwarden\e[0m"
    echo ""

    ## Informação sobre Porta
    echo -e "\e[33mPorta SMTP:\e[97m $porta_vaultwarden\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_vaultwarden

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO VAULTWARDEN \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria VaultWarden iniciado

## Nada nada nada.. só para aparecer a mensagem de passo.

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO VAULTWARDEN \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack vaultwarden.yaml
cat > vaultwarden${1:+_$1}.yaml <<-EOF
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  vaultwarden${1:+_$1}:
    image: vaultwarden/server:latest

    volumes:
      - vaultwarden${1:+_$1}_data:/data

    networks:
      - $nome_rede_interna

    #ports:
    #  - 1973:80

    environment:
      ## Dominio do Dashboard
      - DOMAIN=https://$url_vaultwarden

      ## Permitir novos registros
      - SIGNUPS_ALLOWED=true

      ## Dados do SMTP
      - SMTP_FROM=$email_vaultwarden
      - SMTP_USERNAME=$email_vaultwarden
      - SMTP_PASSWORD=$senha_vaultwarden
      - SMTP_HOST=$host_vaultwarden
      - SMTP_PORT=$porta_vaultwarden
      - SMTP_SECURITY=$ssl_vaultwarden

      ## Configuração do Websocket
      - WEBSOCKET_ENABLED=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
        - node.role == manager
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.vaultwarden${1:+_$1}.rule=Host(\`$url_vaultwarden\`)"
        - "traefik.http.routers.vaultwarden${1:+_$1}.service=vaultwarden${1:+_$1}"
        - "traefik.http.routers.vaultwarden${1:+_$1}.entrypoints=websecure"
        - "traefik.http.services.vaultwarden${1:+_$1}.loadbalancer.server.port=80"
        - "traefik.http.routers.vaultwarden${1:+_$1}.tls=true"
        - "traefik.http.routers.vaultwarden${1:+_$1}.tls.certresolver=letsencryptresolver"
        - "traefik.http.services.vaultwarden${1:+_$1}.loadbalancer.passhostheader=true"
        - "traefik.http.routers.vaultwarden${1:+_$1}.middlewares=compresstraefik"
        - "traefik.http.middlewares.compresstraefik.compress=true"
        - "traefik.docker.network=$nome_rede_interna"

## --------------------------- ORION --------------------------- ##

volumes:
  vaultwarden${1:+_$1}_data:
    external: true
    name: vaultwarden${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOF
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do vaultwarden"
fi
STACK_NAME="vaultwarden${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c vaultwarden.yaml vaultwarden > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do vaultwarden"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_vaultwarden para verificar se o serviço esta online
wait_stack "vaultwarden${1:+_$1}"

telemetria VaultWarden finalizado

cd dados_vps

cat > dados_vaultwarden${1:+_$1} <<EOL
[ VAULTWARDEN ]

Dominio do vaultwarden: https://$url_vaultwarden

Email: Precisa de criar dentro do vaultwarden

Senha: Precisa de criar dentro do vaultwarden
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ VAULTWARDEN ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_vaultwarden\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa de criar dentro do VaultWarden\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar dentro do VaultWarden\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗███████╗██╗  ██╗████████╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗
## ████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗
## ██╔██╗ ██║█████╗   ╚███╔╝    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║
## ██║╚██╗██║██╔══╝   ██╔██╗    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║
## ██║ ╚████║███████╗██╔╝ ██╗   ██║   ╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝
## ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝

ferramenta_nextcloud() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_nextcloud

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o NextCloud (ex: nextcloud.oriondesign.art.br): \e[0m" && read -r url_nextcloud
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite o Usuario para o NextCloud (ex: orion): \e[0m" && read -r user_nextcloud
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "$amarelo--> Minimo 8 caracteres. Use Letras MAIUSCULAS e minusculas, numero e um caractere especial @ ou _"
    echo -en "\e[33mDigite o Senha o Usuario (ex: @Senha123_): \e[0m" && read -r pass_nextcloud
    echo ""



    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_nextcloud

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do nextcloud
    echo -e "\e[33mDominio do NextCloud:\e[97m $url_nextcloud\e[0m"
    echo ""

    ## Informação sobre URL do nextcloud
    echo -e "\e[33mUsuario do NextCloud:\e[97m $user_nextcloud\e[0m"
    echo ""

    ## Informação sobre URL do nextcloud
    echo -e "\e[33mSenha do NextCloud:\e[97m $pass_nextcloud\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO NEXTCLOUD \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria NextCloud iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "nextcloud${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "nextcloud${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO NEXTCLOUD \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando a stack nextcloud.yaml
cat > nextcloud${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  nextcloud${1:+_$1}:
    image: nextcloud:latest

    volumes:
      - nextcloud${1:+_$1}_data:/var/www/html

    networks:
      - $nome_rede_interna

    #ports:
    #  - 8282:80

    environment:
      ## Dados de acesso:
      - NEXTCLOUD_ADMIN_USER=$user_nextcloud
      - NEXTCLOUD_ADMIN_PASSWORD=$pass_nextcloud

      ## Dados do Postgres
      - POSTGRES_HOST=postgres
      - POSTGRES_DB=nextcloud${1:+_$1}
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=$senha_postgres

      ## Dados do Redis
      - REDIS_HOST=redis

      ## Configurações para HTTPS
      - OVERWRITEPROTOCOL=https
      - TRUSTED_PROXIES=127.0.0.1

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.nextcloud${1:+_$1}.rule=Host(\`$url_nextcloud\`)
        - traefik.http.services.nextcloud${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.nextcloud${1:+_$1}.service=nextcloud${1:+_$1}
        - traefik.http.routers.nextcloud${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.nextcloud${1:+_$1}.entrypoints=web,websecure
        - traefik.http.routers.nextcloud${1:+_$1}.tls=true
        - traefik.http.routers.nextcloud${1:+_$1}.middlewares=nextcloud_redirectregex
        - traefik.http.middlewares.nextcloud${1:+_$1}_redirectregex.redirectregex.permanent=true
        - traefik.http.middlewares.nextcloud${1:+_$1}_redirectregex.redirectregex.regex=https://(.*)/.well-known/(?:card|cal)dav
        - traefik.http.middlewares.nextcloud${1:+_$1}_redirectregex.redirectregex.replacement=https://$$1/remote.php/dav

## --------------------------- ORION --------------------------- ##

  nextcloud${1:+_$1}_cron:
    image: nextcloud:latest
    entrypoint: /cron.sh

    volumes:
      - nextcloud${1:+_$1}_data:/var/www/html

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

volumes:
  nextcloud${1:+_$1}_data:
    external: true
    name: nextcloud${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do nextcloud"
fi
STACK_NAME="nextcloud${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c nextcloud.yaml nextcloud > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do nextcloud"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1


## Usa o serviço wait_nextcloud para verificar se o serviço esta online
wait_stack "nextcloud${1:+_$1}"

telemetria NextCloud finalizado

cd dados_vps

# Caminho do arquivo onde a substituição será feita

arquivo_next_cloud="/var/lib/docker/volumes/nextcloud${1:+_$1}_data/_data/config/config.php"

# Comando sed para substituir a linha, utilizando a variável
sed -i "s/0 => 'localhost'/0 => '$url_nextcloud'/" "$arquivo_next_cloud"
sleep 5
## Só por garantia
sed -i "s/0 => 'localhost'/0 => '$url_nextcloud'/" "$arquivo_next_cloud"
sleep 5
sed -i "/'maintenance' => false,/a \  'overwriteprotocol' => 'https',\n  'trusted_proxies' => ['127.0.0.1']," "$arquivo_next_cloud"
sleep 5

cat > dados_nextcloud${1:+_$1} <<EOL
[ NEXTCLOUD ]

Dominio do NextCloud: https://$url_nextcloud

Usuario: $user_nextcloud

Senha: $pass_nextcloud
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ NEXTCLOUD ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_nextcloud\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_nextcloud\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_nextcloud\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗████████╗██████╗  █████╗ ██████╗ ██╗
## ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║
## ███████╗   ██║   ██████╔╝███████║██████╔╝██║
## ╚════██║   ██║   ██╔══██╗██╔══██║██╔═══╝ ██║
## ███████║   ██║   ██║  ██║██║  ██║██║     ██║
## ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_strapi() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_strapi

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Strapi (ex: strapi.oriondesign.art.br): \e[0m" && read -r url_strapi
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_strapi

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o strapi:\e[97m $url_strapi\e[0m"
    echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_strapi

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO STRAPI \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Strapi iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO STRAPI \e[33m[2/3]\e[0m"
echo ""
sleep 1

jwt_secret=$(openssl rand -hex 16)

admin_jwt=$(openssl rand -hex 16)

app_key=$(openssl rand -hex 16)

senha_mysql=$(openssl rand -hex 16)

## Criando a stack strapi.yaml
cat > strapi${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  strapi${1:+_$1}_app:
    image: strapi/strapi

    volumes:
      - strapi${1:+_$1}_config:/srv/app/config
      - strapi${1:+_$1}_src:/srv/app/src
      - strapi${1:+_$1}_public_uploads:/srv/app/public/uploads
      - strapi${1:+_$1}_data:/srv/app

    networks:
      - $nome_rede_interna

    environment:
      ## Dados MySQL
      - DATABASE_CLIENT=mysql
      - DATABASE_HOST=strapi${1:+_$1}_db
      - DATABASE_NAME=strapi
      - DATABASE_PORT=3306
      - DATABASE_USERNAME=root
      - DATABASE_PASSWORD=$senha_mysql

      ## Secret Keys
      - JWT_SECRET=$jwt_secret
      - ADMIN_JWT_SECRET=$admin_jwt
      - APP_KEYS=$app_key

      ## Outros dados
      - NODE_ENV=production
      - STRAPI_TELEMETRY_DISABLED=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.strapi${1:+_$1}.rule=Host(\`$url_strapi\`)
        - traefik.http.routers.strapi${1:+_$1}.entrypoints=web,websecure
        - traefik.http.routers.strapi${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.strapi${1:+_$1}.service=strapi${1:+_$1}
        - traefik.http.services.strapi${1:+_$1}.loadbalancer.server.port=1337
        - traefik.http.services.strapi${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

  strapi${1:+_$1}_db:
    image: percona/percona-server:8.0
    command:
      [
        "--character-set-server=utf8mb4",
        "--collation-server=utf8mb4_general_ci",
        "--sql-mode=",
        "--default-authentication-plugin=mysql_native_password",
        "--max-allowed-packet=512MB"
      ]

    volumes:
      - strapi${1:+_$1}_db:/var/lib/mysql

    networks:
      - $nome_rede_interna

    environment:
      - MYSQL_ROOT_PASSWORD=$senha_mysql
      - MYSQL_DATABASE=strapi
      - TZ=America/Sao_Paulo

    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  strapi${1:+_$1}_config:
    external: true
    name: strapi${1:+_$1}_config
  strapi${1:+_$1}_src:
    external: true
    name: strapi${1:+_$1}_src
  strapi${1:+_$1}_public_uploads:
    external: true
    name: strapi${1:+_$1}_public_uploads
  strapi${1:+_$1}_data:
    external: true
    name: strapi${1:+_$1}_data
  strapi${1:+_$1}_db:
    external: true
    name: strapi${1:+_$1}_db

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Strapi"
fi
STACK_NAME="strapi${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c strapi.yaml strapi #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do Strapi"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "strapi" para verificar se o serviço esta online
wait_stack "strapi${1:+_$1}"

wait_30_sec

telemetria Strapi finalizado

cd dados_vps

cat > dados_strapi${1:+_$1} <<EOL
[ STRAPI ]

Dominio do Strapi: https://$url_strapi

Usuario: Precisa criar no primeiro acesso do Strapi

Senha: Precisa criar no primeiro acesso do Strapi
EOL

cd
cd

## Espera 30 segundos
wait_30_sec
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ STRAPI ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_strapi\e[0m"
echo ""

echo -e "\e[33mSetup Inicial:\e[97m https://$url_strapi/admin\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do strapi\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do strapi\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██████╗ ██╗  ██╗██████╗     ███╗   ███╗██╗   ██╗     █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
## ██╔══██╗██║  ██║██╔══██╗    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
## ██████╔╝███████║██████╔╝    ██╔████╔██║ ╚████╔╝     ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
## ██╔═══╝ ██╔══██║██╔═══╝     ██║╚██╔╝██║  ╚██╔╝      ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
## ██║     ██║  ██║██║         ██║ ╚═╝ ██║   ██║       ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
## ╚═╝     ╚═╝  ╚═╝╚═╝         ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝

ferramenta_phpmyadmin() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_phpmyadmin

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o PhpMyAdmin (ex: phpmyadmin.oriondesign.art.br): \e[0m" && read -r url_phpmyadmin
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite o Host MySQL (ex: mysql ou 1.111.111.11:3306): \e[0m" && read -r host_phpmyadmin
    echo ""

    ##Pergunta o Dominio para a ferramenta
    #echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    #echo -en "\e[33mDigite o Usuario MySQL  (ex: oriondesign): \e[0m" && read -r user_phpmyadmin
    #echo ""

    ##Pergunta o Dominio para a ferramenta
    #echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    #echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    #echo -en "\e[33mDigite a Senha MySQL (ex: @Senha123_): \e[0m" && read -r pass_phpmyadmin
    #echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_phpmyadmin

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ##Informação do Dominio
    echo -e "\e[33mDominio para o PhpMyAdmin:\e[97m $url_phpmyadmin\e[0m"
    echo ""

    ##Informação do Dominio
    echo -e "\e[33mHost MySQL:\e[97m $host_phpmyadmin\e[0m"
    echo ""

    ###Informação do Dominio
    #echo -e "\e[33mUsuario MySQL:\e[97m $user_phpmyadmin\e[0m"
    #echo ""

    ###Informação do Dominio
    #echo -e "\e[33mSenha MYSQL:\e[97m $pass_phpmyadmin\e[0m"
    #echo ""

     ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_phpmyadmin

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO PHPMYADMIN \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria PhpMyAdmin iniciado

## NADA

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO PHPMYADMIN \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack phpmyadmin.yaml
cat > phpmyadmin${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  phpmyadmin${1:+_$1}:
    image: phpmyadmin/phpmyadmin:latest
    command: ["apache2-foreground"]

    networks:
      - $nome_rede_interna

    environment:
      ## Dados do MySQL
      - PMA_HOSTS=$host_phpmyadmin
      - PMA_PORT=3306

      ## Dado de acesso
      #- PMA_USER=
      #- PMA_PASSWORD=
      - PMA_ABSOLUTE_URI=https://$url_phpmyadmin

      ## Limite de Upload
      - UPLOAD_LIMIT=10M

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 2048M
      labels:
        - traefik.enable=true
        - traefik.http.routers.phpmyadmin${1:+_$1}.rule=Host(\`$url_phpmyadmin\`)
        - traefik.http.routers.phpmyadmin${1:+_$1}.entrypoints=web,websecure
        - traefik.http.routers.phpmyadmin${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.phpmyadmin${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.phpmyadmin${1:+_$1}.service=phpmyadmin${1:+_$1}

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do phpmyadmin"
fi
STACK_NAME="phpmyadmin${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c phpmyadmin.yaml phpmyadmin #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do phpmyadmin"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "phpmyadmin" para verificar se o serviço esta online
wait_stack "phpmyadmin${1:+_$1}"

telemetria PhpMyAdmin finalizado

cd
cd dados_vps

cat > dados_phpmyadmin${1:+_$1} <<EOL
[ PHPMYADMIN ]

Dominio do phpmyadmin: https://$url_phpmyadmin

Usuario: Os mesmos do seu MySQL

Senha: Os mesmos do seu MySQL
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ PHPMYADMIN ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_phpmyadmin\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Os mesmos do seu MySQL\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Os mesmos do seu MySQL\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗   ██╗██████╗  █████╗ ██████╗  █████╗ ███████╗███████╗
## ██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
## ███████╗██║   ██║██████╔╝███████║██████╔╝███████║███████╗█████╗
## ╚════██║██║   ██║██╔═══╝ ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝
## ███████║╚██████╔╝██║     ██║  ██║██████╔╝██║  ██║███████║███████╗
## ╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

ferramenta_supabase() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_supabase

## Mostra mensagem para preencher informações
preencha_as_info


generate_jwt_tokens() {
    # Verificar a disponibilidade dos comandos necessários e instalá-los se necessário
    if ! command -v openssl &> /dev/null; then
        echo "O comando 'openssl' não está disponível. Tentando instalar..."
        if [[ "$(uname)" == "Darwin" ]]; then
            # macOS
            brew install openssl
        elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
            # Linux
            if [[ -f /etc/redhat-release ]]; then
                # Red Hat, CentOS, Fedora
                sudo yum install -y openssl
            elif [[ -f /etc/debian_version ]]; then
                # Debian, Ubuntu
                sudo apt-get install -y openssl
            else
                echo "Não foi possível identificar a distribuição Linux. Por favor, instale o OpenSSL manualmente."
                return 1
            fi
        else
            echo "Sistema operacional não suportado. Por favor, instale o OpenSSL manualmente."
            return 1
        fi
    fi

    if ! command -v jq &> /dev/null; then
        echo "O comando 'jq' não está disponível. Tentando instalar..."
        if [[ "$(uname)" == "Darwin" ]]; then
            # macOS
            brew install jq
        elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
            # Linux
            if [[ -f /etc/redhat-release ]]; then
                # Red Hat, CentOS, Fedora
                sudo yum install -y jq
            elif [[ -f /etc/debian_version ]]; then
                # Debian, Ubuntu
                sudo apt-get install -y jq
            else
                echo "Não foi possível identificar a distribuição Linux. Por favor, instale o jq manualmente."
                return 1
            fi
        else
            echo "Sistema operacional não suportado. Por favor, instale o jq manualmente."
            return 1
        fi
    fi

# Definir os payloads dos JWTs
    payload_service_key=$(echo '{
      "role": "service_role",
      "iss": "supabase",
      "iat": 1715050800,
      "exp": 1872817200
    }' | jq .)


    payload_anon_key=$(echo '{
      "role": "anon",
      "iss": "supabase",
      "iat": 1715050800,
      "exp": 1872817200
    }' | jq .)

    # Gerar uma chave secreta aleatória e segura
    secret=$(openssl rand -hex 20)

    # Codificar o header em base64url
    header=$(echo -n '{"alg":"HS256","typ":"JWT"}' | openssl base64 | tr -d '=' | tr '+/' '-_' | tr -d '\n')

    # Codificar os payloads em base64url
    payload_service_key_base64=$(echo -n "$payload_service_key" | openssl base64 | tr -d '=' | tr '+/' '-_' | tr -d '\n')
    payload_anon_key_base64=$(echo -n "$payload_anon_key" | openssl base64 | tr -d '=' | tr '+/' '-_' | tr -d '\n')

    # Criar as assinaturas dos tokens usando a mesma chave secreta
    signature_service_key=$(echo -n "$header.$payload_service_key_base64" | openssl dgst -sha256 -hmac "$secret" -binary | openssl base64 | tr -d '=' | tr '+/' '-_' | tr -d '\n')
    signature_anon_key=$(echo -n "$header.$payload_anon_key_base64" | openssl dgst -sha256 -hmac "$secret" -binary | openssl base64 | tr -d '=' | tr '+/' '-_' | tr -d '\n')

    # Combinar as partes dos tokens
    token_service_key="$header.$payload_service_key_base64.$signature_service_key"
    token_anon_key="$header.$payload_anon_key_base64.$signature_anon_key"

    # Retornar os valores gerados como uma string separada por espaços
    echo "$secret $token_service_key $token_anon_key"
}

# Chamar a função e armazenar o retorno em uma variável
result=$(generate_jwt_tokens)

# Verificar se o resultado está vazio
if [[ -z "$result" ]]; then
    echo "A função retornou um resultado vazio. Verifique a configuração do ambiente e as dependências."
    exit 1
fi

# Extrair os valores individuais usando o comando 'read'
read secret token_service_key token_anon_key <<< "$result"


## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Builder
    echo -e "\e[97mPasso$amarelo 1/5\e[0m"
    echo -en "\e[33mDigite o Dominio para o Supabase (ex: supabase.oriondesign.art.br): \e[0m" && read -r url_supabase
    echo ""

    ##Pergunta o Dominio do Viewer
    echo -e "\e[97mPasso$amarelo 2/5\e[0m"
    echo -en "\e[33mDigite o Usuario para o Supabase (ex: OrionDesign): \e[0m" && read -r user_supabase
    echo ""

    ##Pergunta a versão da ferramenta
    echo -e "\e[97mPasso$amarelo 3/5\e[0m"
    echo -e "$amarelo--> Sem NENHUM caracteres especiais, tais como: @\!#$ entre outros"
    echo -en "\e[33mDigite a Senha do usuario para o Supabase (ex: Senha123_): \e[0m" && read -r pass_supabase
    echo ""

    ###Pergunta o Email SMTP
    #echo -e "\e[97mPasso$amarelo 4/10\e[0m"
    #echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_supabase
    #echo ""

    ##Pergunta o usuário do Email SMTP
    #echo -e "\e[97mPasso$amarelo 5/10\e[0m"
    #echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    #echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_email_supabase
    #echo ""

    ## Pergunta a senha do SMTP
    #echo -e "\e[97mPasso$amarelo 6/10\e[0m"
    #echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    #echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_supabase
    #echo ""

    ## Pergunta o Host SMTP do email
    #echo -e "\e[97mPasso$amarelo 7/10\e[0m"
    #echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_supabase
    #echo ""

    ## Pergunta a porta SMTP do email
    #echo -e "\e[97mPasso$amarelo 8/10\e[0m"
    #echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_supabase
    #echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    #if [ "$porta_smtp_supabase" -eq 465 ]; then
    #smtp_secure_supabase=true
    #else
    #smtp_secure_supabase=false
    #fi

    ## Gera a JWT_Key
    JWT_Key="$secret"

    ## Gera a ANON_KEY
    ANON_KEY="$token_anon_key"

    ## Gera o SERVICE_KEY
    SERVICE_KEY="$token_service_key"

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 4/5\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 5/5\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_supabase

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Builder
    echo -e "\e[33mDominio do Supabase:\e[97m $url_supabase\e[0m"
    echo ""

    ## Informação sobre URL do Viewer
    echo -e "\e[33mUsuario:\e[97m $user_supabase\e[0m"
    echo ""

    ## Informação sobre a versão da ferramenta
    echo -e "\e[33mSenha:\e[97m $pass_supabase\e[0m"
    echo ""

    ## Informação sobre Email
    #echo -e "\e[33mEmail do SMTP:\e[97m $email_supabase\e[0m"
    #echo ""

    ## Informação sobre Email
    #echo -e "\e[33mUsuário do SMTP:\e[97m $usuario_email_supabase\e[0m"
    #echo ""

    ## Informação sobre Senha do Email
    #echo -e "\e[33mSenha do Email:\e[97m $senha_email_supabase\e[0m"
    #echo ""

    ## Informação sobre Host SMTP
    #echo -e "\e[33mHost SMTP do Email:\e[97m $smtp_email_supabase\e[0m"
    #echo ""

    ## Informação sobre Porta SMTP
    #echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_supabase\e[0m"
    #echo ""

    ## Informação sobre Secure SMTP
    #echo -e "\e[33mSecure SMTP do Email:\e[97m $smtp_secure_supabase\e[0m"
    #echo ""

    ## Informação sobre JWT_Key
    echo -e "\e[33mJWT_Key:\e[97m $JWT_Key\e[0m"
    echo ""

    ## Informação sobre ANON_KEY
    echo -e "\e[33mAnon Key:\e[97m $ANON_KEY\e[0m"
    echo ""

    ## Informação sobre SERVICE_KEY
    echo -e "\e[33mService Key:\e[97m $SERVICE_KEY\e[0m"
    echo ""

    ## Informação sobre Access Key
    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""

    ## Informação sobre Secret Key
    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_supabase

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO SUPABASE \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Supabase iniciado

cd
mkdir temp
cd temp
git clone --depth 1 https://github.com/oriondesign2015/SetupOrion > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Baixando Repositório do Supabase"
else
    echo "1/3 - [ OFF ] - Baixando Repositório do Supabase"
    echo "Não foi possivel Baixar."
fi

mv SetupOrion/Extras/Supabase /root/supabase${1:+_$1}

cd

rm -r temp

sudo mkdir -p /root/supabase${1:+_$1}/docker/volumes/db/data
if [ $? -eq 0 ]; then
    echo "2/3 - [ OK ] - Criando diretório 1"
else
    echo "2/3 - [ OFF ] - Criando diretório 1"
    echo "Não foi criar o diretório"
fi

#sudo mkdir -p /var/lib/postgresql/data
#if [ $? -eq 0 ]; then
#    echo "1/4 - [ OK ] - Criando diretório 2"
#else
#    echo "1/4 - [ OFF ] - Criando diretório 2"
#    echo "Não foi criar o diretório"
#fi

sudo mkdir -p /root/supabase${1:+_$1}/docker/volumes/storage
if [ $? -eq 0 ]; then
    echo "3/3 - [ OK ] - Criando diretório 2"
else
    echo "3/3 - [ OFF ] - Criando diretório 2"
    echo "Não foi criar o diretório"
fi

cat > kong.yml <<EOL
_format_version: '2.1'
_transform: true

###
### O Consumers / Users
###
consumers:
  - username: DASHBOARD
  - username: anon
    keyauth_credentials:
      - key: \$SUPABASE_ANON_KEY
  - username: service_role
    keyauth_credentials:
      - key: \$SUPABASE_SERVICE_KEY

###
### R Access Control List
###
acls:
  - consumer: anon
    group: anon
  - consumer: service_role
    group: admin

###
### I Dashboard credentials
###
basicauth_credentials:
  - consumer: DASHBOARD
    username: \$DASHBOARD_USERNAME
    password: \$DASHBOARD_PASSWORD

###
### O API Routes
###
services:
  ## Open Auth routes
  - name: auth-v1-open
    url: http://auth${1:+_$1}:9999/verify
    routes:
      - name: auth-v1-open
        strip_path: true
        paths:
          - /auth/v1/verify
    plugins:
      - name: cors
  - name: auth-v1-open-callback
    url: http://auth${1:+_$1}:9999/callback
    routes:
      - name: auth-v1-open-callback
        strip_path: true
        paths:
          - /auth/v1/callback
    plugins:
      - name: cors
  - name: auth-v1-open-authorize
    url: http://auth${1:+_$1}:9999/authorize
    routes:
      - name: auth-v1-open-authorize
        strip_path: true
        paths:
          - /auth/v1/authorize
    plugins:
      - name: cors

  ## Secure Auth routes
  - name: auth-v1
    _comment: 'GoTrue: /auth/v1/* -> http://auth${1:+_$1}:9999/*'
    url: http://auth${1:+_$1}:9999/
    routes:
      - name: auth-v1-all
        strip_path: true
        paths:
          - /auth/v1/
    plugins:
      - name: cors
      - name: key-auth
        config:
          hide_credentials: false
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin
            - anon

  ## N Secure REST routes
  - name: rest-v1
    _comment: 'PostgREST: /rest/v1/* -> http://rest${1:+_$1}:3000/*'
    url: http://rest${1:+_$1}:3000/
    routes:
      - name: rest-v1-all
        strip_path: true
        paths:
          - /rest/v1/
    plugins:
      - name: cors
      - name: key-auth
        config:
          hide_credentials: true
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin
            - anon

  ## Secure GraphQL routes
  - name: graphql-v1
    _comment: 'PostgREST: /graphql/v1/* -> http://rest${1:+_$1}:3000/rpc/graphql'
    url: http://rest${1:+_$1}:3000/rpc/graphql
    routes:
      - name: graphql-v1-all
        strip_path: true
        paths:
          - /graphql/v1
    plugins:
      - name: cors
      - name: key-auth
        config:
          hide_credentials: true
      - name: request-transformer
        config:
          add:
            headers:
              - Content-Profile:graphql_public
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin
            - anon

  ## Secure Realtime routes
  - name: realtime-v1-ws
    _comment: 'Realtime: /realtime/v1/* -> ws://realtime${1:+_$1}:4000/socket/*'
    url: http://realtime${1:+_$1}-dev.supabase-realtime:4000/socket
    protocol: ws
    routes:
      - name: realtime-v1-ws
        strip_path: true
        paths:
          - /realtime/v1/
    plugins:
      - name: cors
      - name: key-auth
        config:
          hide_credentials: false
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin
            - anon
  - name: realtime-v1-rest
    _comment: 'Realtime: /realtime/v1/* -> ws://realtime${1:+_$1}:4000/socket/*'
    url: http://realtime${1:+_$1}-dev.supabase-realtime:4000/api
    protocol: http
    routes:
      - name: realtime-v1-rest
        strip_path: true
        paths:
          - /realtime/v1/api
    plugins:
      - name: cors
      - name: key-auth
        config:
          hide_credentials: false
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin
            - anon
  ## Storage routes: the storage server manages its own auth
  - name: storage-v1
    _comment: 'Storage: /storage/v1/* -> http://storage${1:+_$1}:5000/*'
    url: http://storage${1:+_$1}:5000/
    routes:
      - name: storage-v1-all
        strip_path: true
        paths:
          - /storage/v1/
    plugins:
      - name: cors

  ## Edge Functions routes
  - name: functions-v1
    _comment: 'Edge Functions: /functions/v1/* -> http://functions${1:+_$1}:9000/*'
    url: http://functions${1:+_$1}:9000/
    routes:
      - name: functions-v1-all
        strip_path: true
        paths:
          - /functions/v1/
    plugins:
      - name: cors

  ## Analytics routes
  - name: analytics-v1
    _comment: 'Analytics: /analytics/v1/* -> http://logflare${1:+_$1}:4000/*'
    url: http://analytics${1:+_$1}:4000/
    routes:
      - name: analytics-v1-all
        strip_path: true
        paths:
          - /analytics/v1/

  ## Secure Database routes
  - name: meta
    _comment: 'pg-meta: /pg/* -> http://pg-meta${1:+_$1}:8080/*'
    url: http://meta${1:+_$1}:8080/
    routes:
      - name: meta-all
        strip_path: true
        paths:
          - /pg/
    plugins:
      - name: key-auth
        config:
          hide_credentials: false
      - name: acl
        config:
          hide_groups_header: true
          allow:
            - admin

  ## Protected Dashboard - catch all remaining routes
  - name: dashboard
    _comment: 'Studio: /* -> http://studio${1:+_$1}:3000/*'
    url: http://studio${1:+_$1}:3000/
    routes:
      - name: dashboard-all
        strip_path: true
        paths:
          - /
    plugins:
      - name: cors
      - name: basic-auth
        config:
          hide_credentials: true
EOL

rm /root/supabase${1:+_$1}/docker/volumes/api/kong.yml

mv kong.yml /root/supabase${1:+_$1}/docker/volumes/api/kong.yml

echo ""

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO DADOS DO MINIO \e[33m[2/4]\e[0m"
echo ""
sleep 1

pegar_senha_minio
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Pegando Senha do MinIO"
else
    echo "1/2 - [ OFF ] - Pegando Senha do MinIO"
    echo "Não foi possivel pegar a senha do minio"
fi
pegar_link_s3
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Pegando URL do S3"
else
    echo "2/2 - [ OFF ] - Pegando URL do S3"
    echo "Não foi possivel pegar o link do S3"
fi

echo ""
## Mensagem de Passo
echo -e "\e[97m• INSTALANDO SUPABASE \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando key Aleatórias
Senha_Postgres=$(openssl rand -hex 16)

Logflare_key=$(openssl rand -hex 16)

SECRET_KEY_BASE=$(openssl rand -hex 32)

VAULT_ENC_KEY=$(openssl rand -hex 32)

## Criando a stack supabase.yaml
cat > supabase${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  studio${1:+_$1}:
    image: supabase/studio:20241014-c083b3b ## Versão do Supabase Studio

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Definindo o Hostname
      - HOSTNAME=0.0.0.0

    ## Configurações de Logs
      - DEBUG=next:*
      - NEXT_PUBLIC_ENABLE_LOGS=true
      - NEXT_ANALYTICS_BACKEND_PROVIDER=postgres

    ## Configuração de Branding
      - DEFAULT_ORGANIZATION_NAME=OrionDesign
      - DEFAULT_PROJECT_NAME=SetupOrion

    ## Configuração do Banco de Dados PostgreSQL
      - POSTGRES_PASSWORD=$Senha_Postgres
      - STUDIO_PG_META_URL=http://meta${1:+_$1}:8080

    ## Configuração do Supabase
      - SUPABASE_URL=http://kong${1:+_$1}:8000
      - SUPABASE_PUBLIC_URL=https://$url_supabase

    ## Integração com Logflare
      - LOGFLARE_API_KEY=$Logflare_key
      - LOGFLARE_URL=http://analytics${1:+_$1}:4000

    ## Configurações de Autenticação
      - SUPABASE_ANON_KEY=$ANON_KEY
      - SUPABASE_SERVICE_KEY=$SERVICE_KEY
      - AUTH_JWT_SECRET=$JWT_Key

    ## Configuração do OpenAI (opcional)
      # - OPENAI_API_KEY=

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  kong${1:+_$1}:
    image: kong:2.8.1 ## Versão do Supabase Kong
    entrypoint: bash -c 'eval "echo \"\$\$(cat ~/temp.yml)\"" > ~/kong.yml && /docker-entrypoint.sh kong docker-start'

    volumes:
       - /root/supabase${1:+_$1}/docker/volumes/api/kong.yml:/home/kong/temp.yml:ro

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração de usuário e senha do Dashboard
      - DASHBOARD_USERNAME=$user_supabase
      - DASHBOARD_PASSWORD=$pass_supabase

    ## Configurações de Autenticação
      - JWT_SECRET=$JWT_Key
      - SUPABASE_ANON_KEY=$ANON_KEY
      - SUPABASE_SERVICE_KEY=$SERVICE_KEY

    ## Configuração do Banco de Dados
      - KONG_DATABASE=off
      - KONG_DECLARATIVE_CONFIG=/home/kong/kong.yml

    ## Configuração de DNS
      - KONG_DNS_ORDER=LAST,A,CNAME

    ## Configuração de Plugins
      - KONG_PLUGINS=request-transformer,cors,key-auth,acl,basic-auth

    ## Configurações de Buffers do NGINX
      - KONG_NGINX_PROXY_PROXY_BUFFER_SIZE=160k
      - KONG_NGINX_PROXY_PROXY_BUFFERS=64 160k

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.kong${1:+_$1}.rule=Host(\`$url_supabase\`) && PathPrefix(\`/\`) ## Url do Supabase
        - traefik.http.services.kong${1:+_$1}.loadbalancer.server.port=8000
        - traefik.http.routers.kong${1:+_$1}.service=kong${1:+_$1}
        - traefik.http.routers.kong${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.kong${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.kong${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

  auth${1:+_$1}:
    image: supabase/gotrue:v2.158.1 ## Versão do Supabase Auth

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração Geral da API Auth
      - GOTRUE_API_HOST=0.0.0.0
      - GOTRUE_API_PORT=9999
      - API_EXTERNAL_URL=https://$url_supabase

    ## Configuração do Banco de Dados
      - GOTRUE_DB_DRIVER=postgres
      - GOTRUE_DB_DATABASE_URL=postgres://supabase_auth_admin:$Senha_Postgres@db${1:+_$1}:5432/postgres ## Troque a senha do postgres

    ## Configurações de URL e Permissões
      - GOTRUE_SITE_URL=https://$url_supabase
      - GOTRUE_URI_ALLOW_LIST=
      - GOTRUE_DISABLE_SIGNUP=false

    ## Configurações de JWT
      - GOTRUE_JWT_ADMIN_ROLES=service_role
      - GOTRUE_JWT_AUD=authenticated
      - GOTRUE_JWT_DEFAULT_GROUP_NAME=authenticated
      - GOTRUE_JWT_EXP=31536000
      - GOTRUE_JWT_SECRET=$JWT_Key

    ## Configuração de Email
      - GOTRUE_EXTERNAL_EMAIL_ENABLED=false
      - GOTRUE_EXTERNAL_ANONYMOUS_USERS_ENABLED=false
      #- GOTRUE_MAILER_AUTOCONFIRM=true # Envia emails automaticamente para confirmar cadastros
      #- GOTRUE_SMTP_ADMIN_EMAIL=email@dominio.com # Email administrador SMTP
      #- GOTRUE_SMTP_HOST=smtp.dominio.com # Host SMTP
      #- GOTRUE_SMTP_PORT=587 # Porta SMTP
      #- GOTRUE_SMTP_USER=email@dominio.com # Usuário SMTP
      #- GOTRUE_SMTP_PASS=senha # Senha SMTP
      #- GOTRUE_SMTP_SENDER_NAME=email@dominio.com # Nome do remetente SMTP

    ## Configurações de URL para Emails
      - GOTRUE_MAILER_URLPATHS_INVITE=/auth/v1/verify
      - GOTRUE_MAILER_URLPATHS_CONFIRMATION=/auth/v1/verify
      - GOTRUE_MAILER_URLPATHS_RECOVERY=/auth/v1/verify
      - GOTRUE_MAILER_URLPATHS_EMAIL_CHANGE=/auth/v1/verify

    ## Configurações de SMS
      - GOTRUE_EXTERNAL_PHONE_ENABLED=false
      - GOTRUE_SMS_AUTOCONFIRM=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  rest${1:+_$1}:
    image: postgrest/postgrest:v12.2.0 ## Versão do Supabase Rest
    command: "postgrest"

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do Banco de Dados
      - PGRST_DB_URI=postgres://authenticator:$Senha_Postgres@db${1:+_$1}:5432/postgres
      - PGRST_DB_SCHEMAS=public,storage,graphql_public
      - PGRST_DB_ANON_ROLE=anon

    ## Configurações de JWT (JSON Web Tokens)
      - PGRST_JWT_SECRET=$JWT_Key
      - PGRST_APP_SETTINGS_JWT_SECRET=$JWT_Key
      - PGRST_APP_SETTINGS_JWT_EXP=31536000

    ## Outras Configurações
      - PGRST_DB_USE_LEGACY_GUCS="false"

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  realtime${1:+_$1}:
    image: supabase/realtime:v2.30.34 ## Versão do Supabase Realtime

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração da API Realtime
      - PORT=4000
      - API_JWT_SECRET=$JWT_Key
      - SECRET_KEY_BASE=$SECRET_KEY_BASE
      - APP_NAME=realtime

    ## Configuração do Banco de Dados
      - DB_HOST=db${1:+_$1}
      - DB_PORT=5432
      - DB_USER=supabase_admin
      - DB_PASSWORD=$Senha_Postgres
      - DB_NAME=postgres
      - DB_AFTER_CONNECT_QUERY='SET search_path TO _realtime'
      - DB_ENC_KEY=supabaserealtime

    ## Configuração de Conexão e Rede
      - ERL_AFLAGS=-proto_dist inet_tcp
      - DNS_NODES="''"
      - RLIMIT_NOFILE=10000

    ## Configuração do Ambiente
      - SEED_SELF_HOST=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  storage${1:+_$1}:
    image: supabase/storage-api:v1.11.13 ## Versão do Supabase Storage

    volumes:
      - /root/supabase${1:+_$1}/docker/volumes/storage:/var/lib/storage:z

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do PostgREST e JWT
      - ANON_KEY=$ANON_KEY
      - SERVICE_KEY=$SERVICE_KEY
      - POSTGREST_URL=http://rest${1:+_$1}:3000
      - PGRST_JWT_SECRET=$JWT_Key
      - DATABASE_URL=postgres://supabase_storage_admin:$Senha_Postgres@db${1:+_$1}:5432/postgres

    ## Configuração de Armazenamento de Arquivos MinIO
      - FILE_SIZE_LIMIT=52428800
      - STORAGE_BACKEND=s3
      - GLOBAL_S3_BUCKET=supabase${1:+-$1} ## Nome da bucket do MinIO
      - GLOBAL_S3_ENDPOINT=https://$url_s3 ## URL S3 do MinIO
      - GLOBAL_S3_PROTOCOL=https
      - GLOBAL_S3_FORCE_PATH_STYLE=true
      - AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY ## Access Key
      - AWS_SECRET_ACCESS_KEY=$S3_SECRET_KEY ## Secret Key
      - AWS_DEFAULT_REGION=eu-south ## Região MinIO
      - FILE_STORAGE_BACKEND_PATH=/var/lib/storage

    ## Configuração de Imagens
      - ENABLE_IMAGE_TRANSFORMATION="true"
      - IMGPROXY_URL=http://imgproxy${1:+_$1}:5001

    ## Configuração de Identificação e Região
      - TENANT_ID=stub
      - REGION=eu-south ## Região

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  imgproxy${1:+_$1}:
    image: darthsim/imgproxy:v3.8.0 ## Versão do Supabase Imgproxy

    volumes:
      - /root/supabase${1:+_$1}/docker/volumes/storage:/var/lib/storage:z

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do IMGPROXY
      - IMGPROXY_BIND=:5001
      - IMGPROXY_LOCAL_FILESYSTEM_ROOT=/
      - IMGPROXY_USE_ETAG="true"
      - IMGPROXY_ENABLE_WEBP_DETECTION=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  meta${1:+_$1}:
    image: supabase/postgres-meta:v0.84.2 ## Versão do Meta

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do PG_META
      - PG_META_PORT=8080
      - PG_META_DB_HOST=db${1:+_$1}
      - PG_META_DB_PORT=5432
      - PG_META_DB_NAME=postgres
      - PG_META_DB_USER=supabase_admin
      - PG_META_DB_PASSWORD=$Senha_Postgres

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  functions${1:+_$1}:
    image: supabase/edge-runtime:v1.59.0 ## Versão do Supabase Functions
    command:
      - start
      - --main-service
      - /home/deno/functions/main

    volumes:
      - /root/supabase${1:+_$1}/docker/volumes/functions:/home/deno/functions:Z

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração de JWT e Supabase
      - VERIFY_JWT="false"
      - JWT_SECRET=$JWT_Key
      - SUPABASE_URL=http://kong${1:+_$1}:8000
      - SUPABASE_ANON_KEY=$ANON_KEY
      - SUPABASE_SERVICE_ROLE_KEY=$SERVICE_KEY
      - SUPABASE_DB_URL=postgresql://postgres:$Senha_Postgres@db${1:+_$1}:5432/postgres

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  analytics${1:+_$1}:
    image: supabase/logflare:1.4.0 ## Versão do Supabase Analytics

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração de Banco de Dados
      - DB_USERNAME=supabase_admin
      - DB_DATABASE=_supabase
      - DB_HOSTNAME=db${1:+_$1}
      - DB_PORT=5432
      - DB_PASSWORD=$Senha_Postgres
      - DB_SCHEMA=_analytics

    ## Configuração do Postgres Backend
      - POSTGRES_BACKEND_URL=postgresql://supabase_admin:$Senha_Postgres@db${1:+_$1}:5432/_supabase
      - POSTGRES_BACKEND_SCHEMA=_analytics

    ## Configuração do Logflare
      - LOGFLARE_NODE_HOST=127.0.0.1
      - LOGFLARE_API_KEY=$Logflare_key
      - LOGFLARE_SINGLE_TENANT=true
      - LOGFLARE_SUPABASE_MODE=true
      - LOGFLARE_MIN_CLUSTER_SIZE=1
      - LOGFLARE_FEATURE_FLAG_OVERRIDE=multibackend=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  db${1:+_$1}:
    image: supabase/postgres:15.1.1.78 ## Versão do Supabase Db
    command:
      - postgres
      - '-c'
      - config_file=/etc/postgresql/postgresql.conf
      - '-c'
      - log_min_messages=fatal

    volumes:
      - /root/supabase${1:+_$1}/docker/volumes/db/realtime.sql:/docker-entrypoint-initdb.d/migrations/99-realtime.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/webhooks.sql:/docker-entrypoint-initdb.d/init-scripts/98-webhooks.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/roles.sql:/docker-entrypoint-initdb.d/init-scripts/99-roles.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/jwt.sql:/docker-entrypoint-initdb.d/init-scripts/99-jwt.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/data:/var/lib/postgresql/data:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/_supabase.sql:/docker-entrypoint-initdb.d/migrations/97-_supabase.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/logs.sql:/docker-entrypoint-initdb.d/migrations/99-logs.sql:Z
      - /root/supabase${1:+_$1}/docker/volumes/db/pooler.sql:/docker-entrypoint-initdb.d/migrations/99-pooler.sql:Z
      - supabase${1:+_$1}_db_config:/etc/postgresql-custom

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do PostgreSQL
      - POSTGRES_HOST=/var/run/postgresql
      - PGPORT=5432
      - POSTGRES_PORT=5432
      - POSTGRES_PASSWORD=$Senha_Postgres
      - POSTGRES_DB=postgres
      - PGDATABASE=postgres

    ## Configuração de JWT
      - JWT_SECRET=$JWT_Key
      - JWT_EXP=31536000  ## O padrão é 3600

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  vector${1:+_$1}:
    image: timberio/vector:0.28.1-alpine ## Versão do Supabase Vector
    command:
      - '--config'
      - etc/vector/vector.yml

    volumes:
    - /root/supabase${1:+_$1}/docker/volumes/logs/vector.yml:/etc/vector/vector.yml:ro
    - /var/run/docker.sock:/var/run/docker.sock:ro

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do Logflare
      - LOGFLARE_API_KEY=$Logflare_key

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  supavisor${1:+_$1}:
    image: supabase/supavisor:1.1.56 ## Versão do Supabase Supavisor
    command:
      - /bin/sh
      - -c
      - /app/bin/migrate && /app/bin/supavisor eval "\$\$(cat /etc/pooler/pooler.exs)" && /app/bin/server


    volumes:
      -  /root/supabase${1:+_$1}/docker/volumes/pooler/pooler.exs:/etc/pooler/pooler.exs:ro

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
    ## Configuração do Banco de Dados
      - POSTGRES_PORT=5432
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=$Senha_Postgres
      - DATABASE_URL=ecto://postgres:$Senha_Postgres@db${1:+_$1}:5432/_supabase
      - CLUSTER_POSTGRES=true

    ## Configuração de JWT
      - API_JWT_SECRET=$JWT_Key
      - METRICS_JWT_SECRET=$JWT_Key

    ## Configuração de Segurança
      - SECRET_KEY_BASE=$SECRET_KEY_BASE
      - VAULT_ENC_KEY=your-encryption-key-32-chars-min
      ## O valor a cima era para ser: $VAULT_ENC_KEY
      ## Mas por algum motivo não funciona kkkk

    ## Configuração de Regionalização
      - REGION=local

    ## Configuração de Erlang
      - ERL_AFLAGS=-proto_dist inet_tcp

    ## Configuração do Pooler
      - POOLER_TENANT_ID=1
      - POOLER_DEFAULT_POOL_SIZE=20
      - POOLER_MAX_CLIENT_CONN=100
      - POOLER_POOL_MODE=transaction

    ## Configuração de Porta
      - PORT=4000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

volumes:
  supabase${1:+_$1}_db_config:
    external: true
    name: supabase${1:+_$1}_db_config

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do supabase"
fi
STACK_NAME="supabase${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c supabase.yaml supabase > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do supabase"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "supabase" para verificar se o serviço esta online
wait_stack "supabase${1:+_$1}"

telemetria Supabase finalizado

cd dados_vps

cat > dados_supabase${1:+_$1} <<EOL
[ SUPABASE ]

Dominio do Supabase: https://$url_supabase

Usuario: $user_supabase

Senha: $pass_supabase

JWT Key: $JWT_Key

Anon Key: $ANON_KEY

Service Key: $SERVICE_KEY
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ SUPABASE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_supabase\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_supabase\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_supabase\e[0m"
echo ""

echo -e "\e[33mAnon key:\e[97m $ANON_KEY\e[0m"
echo ""

echo -e "\e[33mService key:\e[97m $SERVICE_KEY\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ██╗████████╗███████╗██╗   ██╗
## ████╗  ██║╚══██╔══╝██╔════╝╚██╗ ██╔╝
## ██╔██╗ ██║   ██║   █████╗   ╚████╔╝
## ██║╚██╗██║   ██║   ██╔══╝    ╚██╔╝
## ██║ ╚████║   ██║   ██║        ██║
## ╚═╝  ╚═══╝   ╚═╝   ╚═╝        ╚═╝

ferramenta_ntfy() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_ntfy

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o Dominio para o Ntfy (ex: ntfy.oriondesign.art.br): \e[0m" && read -r url_ntfy
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite o Usuario (ex: oriondesign): \e[0m" && read -r user_ntfy
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -en "\e[33mDigite a Senha (ex: @Senha123_): \e[0m" && read -r pass_ntfy
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_ntfy

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da Ntfy:\e[97m $url_ntfy\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mUsuario do Ntfy:\e[97m $user_ntfy\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mSenha do Ntfy:\e[97m $pass_ntfy\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_ntfy

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO NTFY \e[33m[1/3]\e[0m"
echo ""
sleep 1

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO O NTFY \e[33m[2/3]\e[0m"
echo ""
sleep 1

telemetria Ntfy iniciado

## Gerando Hash
hashed_senha=$(htpasswd -nb $user_ntfy $pass_ntfy | sed -e s/\\$/\\$\\$/g)

## Gerando Base64
authentication=$(echo -n "$user_ntfy:$pass_ntfy" | base64)

## Criando a stack ntfy.yaml
cat > ntfy${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  ntfy${1:+_$1}:
    image: binwiederhier/ntfy:latest
    command:
      - serve

    volumes:
      - ntfy${1:+_$1}_cache:/var/cache/ntfy
      - ntfy${1:+_$1}_etc:/etc/ntfy

    networks:
      - $nome_rede_interna

    environment:
      - TZ=UTC

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.ntfy${1:+_$1}.rule=Host(\`$url_ntfy\`)
        - traefik.http.services.ntfy${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.ntfy${1:+_$1}.service=ntfy${1:+_$1}
        - traefik.http.routers.ntfy${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.ntfy${1:+_$1}.entrypoints=websecure
        - traefik.http.middlewares.ntfy${1:+_$1}-auth.basicauth.users=$hashed_senha
        - traefik.http.routers.ntfy${1:+_$1}.middlewares=ntfy-auth
        - traefik.http.routers.ntfy${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  ntfy${1:+_$1}_cache:
    external: true
    name: ntfy${1:+_$1}_cache
  ntfy${1:+_$1}_etc:
    external: true
    name: ntfy${1:+_$1}_etc

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Ntfy"
fi
STACK_NAME="ntfy${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c ntfy.yaml ntfy > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da Ntfy"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_ntfy para verificar se o serviço esta online
wait_stack "ntfy${1:+_$1}"

telemetria Ntfy finalizado

cd dados_vps

cat > dados_ntfy${1:+_$1} <<EOL
[ NTFY ]

Link do Ntfy: https://$url_ntfy

Usuario: $user_ntfy

Senha: $pass_ntfy

Authorization: Basic $authentication
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ NTFY ]\e[0m"
echo ""

echo -e "\e[97mLink do Ntfy:\e[33m https://$url_ntfy\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m $user_ntfy\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m $pass_ntfy\e[0m"
echo ""

echo -e "\e[97mAuthorization:\e[33m Basic $authentication\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗      ██████╗ ██╗    ██╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗
## ██║     ██╔═══██╗██║    ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗
## ██║     ██║   ██║██║ █╗ ██║██║     ██║   ██║██║  ██║█████╗  ██████╔╝
## ██║     ██║   ██║██║███╗██║██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗
## ███████╗╚██████╔╝╚███╔███╔╝╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║
## ╚══════╝ ╚═════╝  ╚══╝╚══╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝

ferramenta_lowcoder() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_lowcoder

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/8\e[0m"
    echo -en "\e[33mDigite o Dominio para o Lowcoder (ex: lowcoder.oriondesign.art.br): \e[0m" && read -r url_lowcoder
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 2/8\e[0m"
    echo -en "\e[33mDigite o User do MongoDB (ex: oriondesign): \e[0m" && read -r user_mongodb_lowcoder
    echo ""

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 3/8\e[0m"
    echo -en "\e[33mDigite a senha do MongoDB (ex: @Senha123_): \e[0m" && read -r pass_mongodb_lowcoder
    echo ""

    ## Pergunta o email SMTP
    echo -e "\e[97mPasso$amarelo 4/8\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_lowcoder
    echo ""

    ## Pergunta o Ususario SMTP
    echo -e "\e[97mPasso$amarelo 5/8\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuario para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_lowcoder
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 6/8\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_smtp_lowcoder
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 7/8\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_lowcoder
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 8/8\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_lowcoder
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_lowcoder

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da lowcoder:\e[97m $url_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mUsuario do MongoDB:\e[97m $user_mongodb_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mSenha do MongoDB:\e[97m $pass_mongodb_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mUser SMTP:\e[97m $user_smtp_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_lowcoder\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_lowcoder\e[0m"
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_lowcoder" -eq 465 ]; then
    smtp_secure_lowcoder_ssl=true
    smtp_secure_lowcoder_startls=false
    else
    smtp_secure_lowcoder_ssl=false
    smtp_secure_lowcoder_startls=true
    fi

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_lowcoder

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO LOWCODER \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria LowCoder iniciado

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[2/4]\e[0m"
echo ""

    verificar_container_redis
    if [ $? -eq 0 ]; then
        echo ""
    else
        ferramenta_redis
    fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO O LOWCODER \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Gerando Encryption
encryption_key_lowcoder1=$(openssl rand -hex 16)
encryption_key_lowcoder2=$(openssl rand -hex 16)
encryption_key_lowcoder3=$(openssl rand -hex 32)

## Pegando ip da vps
read -r ip _ <<<$(hostname -I)

## Criando a stack lowcoder.yaml
cat > lowcoder${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  lowcoder${1:+_$1}_api:
    image: lowcoderorg/lowcoder-ce-api-service:latest

    networks:
      - $nome_rede_interna

    environment:
      - LOWCODER_PUID=9001
      - LOWCODER_PGID=9001

      ## Dados MongoDB
      - LOWCODER_MONGODB_URL=mongodb://$user_mongodb_lowcoder:$pass_mongodb_lowcoder@$ip:27017/lowcoder${1:+_$1}?authSource=admin&readPreference=primary&ssl=false&directConnection=true

      ## Dados Redis
      - LOWCODER_REDIS_URL=redis://redis:6379

      ## Dominio
      - LOWCODER_NODE_SERVICE_URL=http://lowcoder${1:+_$1}_node:6060

      ## Configurações
      - LOWCODER_MAX_QUERY_TIMEOUT=120
      - LOWCODER_EMAIL_AUTH_ENABLED=true
      - LOWCODER_EMAIL_SIGNUP_ENABLED=true ## true = permitir criar novas contas
      - LOWCODER_CREATE_WORKSPACE_ON_SIGNUP=true ## true = permitir criar novos workspaces
      - LOWCODER_WORKSPACE_MODE=SAAS

      ## Encryption
      - LOWCODER_DB_ENCRYPTION_PASSWORD=$encryption_key_lowcoder1 ## hash Encryption
      - LOWCODER_DB_ENCRYPTION_SALT=$encryption_key_lowcoder2 ## hash Encryption
      - LOWCODER_API_KEY_SECRET=$encryption_key_lowcoder3 # hash Encryption

      ## Outras configurações
      - LOWCODER_CORS_DOMAINS=*
      - LOWCODER_MAX_ORGS_PER_USER=100
      - LOWCODER_MAX_MEMBERS_PER_ORG=1000
      - LOWCODER_MAX_GROUPS_PER_ORG=100
      - LOWCODER_MAX_APPS_PER_ORG=1000
      - LOWCODER_MAX_DEVELOPERS=50

      ## Dados SMTP
      - LOWCODER_ADMIN_SMTP_HOST=$host_smtp_lowcoder
      - LOWCODER_ADMIN_SMTP_PORT=$porta_smtp_lowcoder
      - LOWCODER_ADMIN_SMTP_USERNAME=$user_smtp_lowcoder
      - LOWCODER_ADMIN_SMTP_PASSWORD=$senha_smtp_lowcoder
      - LOWCODER_ADMIN_SMTP_AUTH=true
      - LOWCODER_ADMIN_SMTP_SSL_ENABLED=$smtp_secure_lowcoder_ssl
      - LOWCODER_ADMIN_SMTP_STARTTLS_ENABLED=$smtp_secure_lowcoder_startls
      - LOWCODER_ADMIN_SMTP_STARTTLS_REQUIRED=$smtp_secure_lowcoder_startls
      - LOWCODER_EMAIL_NOTIFICATIONS_SENDER=$email_smtp_lowcoder

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

  lowcoder${1:+_$1}_node:
    image: lowcoderorg/lowcoder-ce-node-service:latest

    networks:
      - $nome_rede_interna

    environment:
      - LOWCODER_PUID=9001
      - LOWCODER_PGID=9001
      - LOWCODER_API_SERVICE_URL=http://lowcoder${1:+_$1}_api:8080

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

  lowcoder${1:+_$1}_frontend:
    image: lowcoderorg/lowcoder-ce-frontend:latest

    volumes:
     - lowcoder${1:+_$1}_assets:/lowcoder/assets

    networks:
      - $nome_rede_interna

    environment:
      - LOWCODER_PUID=9001
      - LOWCODER_PGID=9001
      - LOWCODER_MAX_REQUEST_SIZE=20m
      - LOWCODER_MAX_QUERY_TIMEOUT=120
      - LOWCODER_API_SERVICE_URL=http://lowcoder${1:+_$1}_api:8080
      - LOWCODER_NODE_SERVICE_URL=http://lowcoder${1:+_$1}_node:6060

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.lowcoder${1:+_$1}.rule=Host(\`$url_lowcoder\`) && PathPrefix(\`/\`)
        - traefik.http.services.lowcoder${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.lowcoder${1:+_$1}.service=lowcoder${1:+_$1}
        - traefik.http.routers.lowcoder${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.lowcoder${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.lowcoder${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  lowcoder${1:+_$1}_assets:
    external: true
    name: lowcoder${1:+_$1}_assets

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da Lowcoder"
fi
STACK_NAME="lowcoder${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c lowcoder.yaml lowcoder > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da lowcoder"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "lowcoder" para verificar se o serviço esta online
wait_stack "lowcoder${1:+_$1}"

telemetria LowCoder finalizado

cd dados_vps

cat > dados_lowcoder${1:+_$1} <<EOL
[ LOWCODER ]

Link do Lowcoder: https://$url_lowcoder

Usuario: Precisa de criar dentro do LowCoder

Senha: Precisa de criar dentro do LowCoder

API_KEY: $encryption_key_lowcoder3
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ LOWCODER ]\e[0m"
echo ""

echo -e "\e[97mLink do Lowcoder:\e[33m https://$url_lowcoder\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m Precisa de criar dentro do LowCoder\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m Precisa de criar dentro do LowCoder\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗██╗      ██████╗ ██╗    ██╗
## ██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ██╔═══██╗██║    ██║
## ██║     ███████║██╔██╗ ██║██║  ███╗█████╗  ██║     ██║   ██║██║ █╗ ██║
## ██║     ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     ██║   ██║██║███╗██║
## ███████╗██║  ██║██║ ╚████║╚██████╔╝██║     ███████╗╚██████╔╝╚███╔███╔╝
## ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝

ferramenta_langflow() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_langflow

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Builder
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o Dominio para LangFlow (ex: langflow.oriondesign.art.br): \e[0m" && read -r url_langflow
    echo ""

    ##Pergunta o Usuario para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -e "$amarelo--> Minimo 5 caracteres. Evite os caracteres especiais: \!#$ e/ou espaço"
    echo -en "\e[33mDigite um usuario para o LangFlow (ex: admin): \e[0m" && read -r user_langflow
    echo ""

    ##Pergunta a Senha para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -e "$amarelo--> Evite os caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma senha para o usuario do LangFlow (ex: @Senha123_): \e[0m" && read -r pass_langflow
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_langflow

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Builder
    echo -e "\e[33mDominio do Langflow:\e[97m $url_langflow\e[0m"
    echo ""

    ## Informação sobre URL do Builder
    echo -e "\e[33mUsuario:\e[97m $user_langflow\e[0m"
    echo ""

    ## Informação sobre URL do Builder
    echo -e "\e[33mSenha:\e[97m $pass_langflow\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_langflow

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO LANGFLOW \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Langflow iniciado

## Nada nada nada.. só para aparecer a mensagem de passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "langflow${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "langflow${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO LANGFLOW \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
#key_langflow=$(openssl rand -hex 16)
#key_langflow=$(openssl rand -hex 16 | sed 's/\(..\)/\1/g' | sed 's/\(....\)\(....\)\(....\)\(....\)\(....\)/\1-\2-\3-\4-\5/')
#key_langflow=$(curl -s https://www.uuidgenerator.net/api/version1)
key_langflow=$(python3 -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())')

## Criando a stack langflow.yaml
cat > langflow${1:+_$1}.yaml <<EOL
version: "3.8"
services:

## --------------------------- ORION --------------------------- ##

  langflow${1:+_$1}:
    image: langflowai/langflow:v1.0.19.post2

    volumes:
      - langflow${1:+_$1}_data:/app/langflow

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - LANGFLOW_AUTO_LOGIN=false
      - LANGFLOW_SUPERUSER=$user_langflow
      - LANGFLOW_SUPERUSER_PASSWORD=$pass_langflow
      - LANGFLOW_HOST=0.0.0.0
      - BACKEND_URL=https://$url_langflow

      ## Secret Key
      ## Gere em: https://www.uuidgenerator.net/api/version1
      - LANGFLOW_SECRET_KEY=$key_langflow

      ## Permitir novas incrições
      - LANGFLOW_NEW_USER_IS_ACTIVE=false ## false = Precisa autorizar novas inscrições

      ## Dados do Postgres
      - LANGFLOW_DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/langflow${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.langflow${1:+_$1}.rule=Host(\`$url_langflow\`) ## Url da aplicação
        - traefik.http.services.langflow${1:+_$1}.loadBalancer.server.port=7860
        - traefik.http.routers.langflow${1:+_$1}.service=langflow${1:+_$1}
        - traefik.http.routers.langflow${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.langflow${1:+_$1}.tls.certresolver=letsencryptresolver

## --------------------------- ORION --------------------------- ##

volumes:
  langflow${1:+_$1}_data:
    external: true
    name: langflow${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do langflow"
fi
STACK_NAME="langflow${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c langflow.yaml langflow > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do langflow"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "langflow" para verificar se o serviço esta online
wait_stack "langflow${1:+_$1}"

telemetria Langflow finalizado

cd dados_vps

cat > dados_langflow${1:+_$1} <<EOL
[ LANGFLOW ]

Dominio do langflow: https://$url_langflow

Usuario: $user_langflow

Senha: $pass_langflow
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ LANGFLOW ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_langflow\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_langflow\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_langflow\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██████╗ ███████╗███╗   ██╗    ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗
## ██╔═══██╗██╔══██╗██╔════╝████╗  ██║    ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝
## ██║   ██║██████╔╝█████╗  ██╔██╗ ██║    ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║
## ██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║    ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║
## ╚██████╔╝██║     ███████╗██║ ╚████║    ██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║
##  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝

ferramenta_openproject() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_openproject

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o OpenProject (ex: openproject.oriondesign.art.br): \e[0m" && read -r url_openproject
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_openproject

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do openproject
    echo -e "\e[33mDominio do OpenProject:\e[97m $url_openproject\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_minio

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO OPENPROJECT \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria OpenProject iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "openproject${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "openproject${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO OPENPROJECT \e[33m[4/5]\e[0m"
echo ""
sleep 1

key_openproject=$(openssl rand -hex 16)

## Criando a stack
cat > openproject${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  openproject${1:+_$1}:
    image: openproject/openproject:14.1.1

    volumes:
      - openproject${1:+_$1}_pgdata:/var/openproject/pgdata
      - openproject${1:+_$1}_assets:/var/openproject/assets

    networks:
      - $nome_rede_interna

    environment:
      ## Secret Key
      - OPENPROJECT_SECRET_KEY_BASE=$key_openproject

      ## Dominio:
      - OPENPROJECT_HOST__NAME=$url_openproject
      - OPENPROJECT_HTTPS=true

      ## Dados do Redis
      - OPENPROJECT_RAILS__CACHE__STORE=redis
      - OPENPROJECT_CACHE_REDIS_URL=redis://redis:6379

      ## Dados do Postgres
      - DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/openproject${1:+_$1}

      ## Configurações
      - OPENPROJECT_DEFAULT__LANGUAGE=pt-BR

      ## Dados SMTP
      ## Deixei comentado pois a environment da senha não esta funcionando como o esperado
      #- OPENPROJECT_EMAIL__DELIVERY__METHOD=smtp
      #- OPENPROJECT_MAIL__FROM=email@dominio.com
      #- OPENPROJECT_SMTP__USER__NAME=Usuario_do_Email
      #- OPENPROJECT_SMTP__DOMAIN=dominio.com
      #- OPENPROJECT_SMTP__PASSWORD=Senha_do_Email
      #- OPENPROJECT_SMTP__ADDRESS=smtp.dominio.com
      #- OPENPROJECT_SMTP__PORT=587
      #- OPENPROJECT_SMTP__ENABLE__STARTTLS__AUTO=true
      #- OPENPROJECT_SMTP__AUTHENTICATION=plain
      #- OPENPROJECT_SMTP__OPENSSL__VERIFY__MODE=peer

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=1
        - traefik.http.routers.openproject${1:+_$1}.rule=Host(\`$url_openproject\`)
        - traefik.http.routers.openproject${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.openproject${1:+_$1}.priority=1
        - traefik.http.routers.openproject${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.openproject${1:+_$1}.service=openproject${1:+_$1}
        - traefik.http.services.openproject${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.services.openproject${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  openproject${1:+_$1}_pgdata:
    external: true
    name: openproject${1:+_$1}_pgdata
  openproject${1:+_$1}_assets:
    external: true
    name: openproject${1:+_$1}_assets

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do OpenProject"
fi
STACK_NAME="openproject${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c openproject.yaml openproject > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do openproject"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "openproject" para verificar se o serviço esta online
wait_stack "openproject${1:+_$1}"

wait_30_sec

telemetria OpenProject finalizado

cd dados_vps

cat > dados_openproject${1:+_$1} <<EOL
[ OPENPROJECT ]

Dominio do openproject: https://$url_openproject

Usuario: admin

Senha: admin
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ OPENPROJECT ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_openproject\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m admin\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m admin\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ███████╗███████╗██████╗
##  ╚══███╔╝██╔════╝██╔══██╗
##    ███╔╝ █████╗  ██████╔╝
##   ███╔╝  ██╔══╝  ██╔═══╝
##  ███████╗███████╗██║
##  ╚══════╝╚══════╝╚═╝

ferramenta_zep() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_zep

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o Dominio para o Zep (ex: zep.oriondesign.art.br): \e[0m" && read -r url_zep
    echo ""

    ## Pergunta o nome do Usuario do Motor
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mApiKey OpenAI: \e[0m" && read -r apikey_openai_zep
    echo ""

    ## Criando uma Encryption Key Aleatória
    encryption_key_zep=$(openssl rand -hex 16)

    ## Pergunta o nome do Senha do Motor
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -en "\e[33mApiKey para o ZEP (ex: $encryption_key_zep): \e[0m" && read -r apikey_zep
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_zep

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre o dominio
    echo -e "\e[33mDominio do Zep:\e[97m $url_zep\e[0m"
    echo ""

    ## Informação sobre o usuario
    echo -e "\e[33mApiKey da OpenAI:\e[97m $apikey_openai_zep\e[0m"
    echo ""

    ## Informação sobre a senha
    echo -e "\e[33mApiKey do Zep:\e[97m $apikey_zep\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_zep

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO ZEP \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Zep iniciado

cd
mkdir temp
cd temp

git clone --depth 1 https://github.com/oriondesign2015/setuporion > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Baixando Repositório do Zep"
else
    echo "1/1 - [ OFF ] - Baixando Repositório do Zep"
    echo "Não foi possivel Baixar."
fi

mv setuporion/Extras/Zep /root/zep${1:+_$1}

cd
cd
rm -r temp
cd
echo ""

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES VECTOR \e[33m[2/4]\e[0m"
echo ""
sleep 1

dados
verificar_container_pgvector
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - PgVector já instalado"
    pegar_senha_pgvector > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do PgVector"
    criar_banco_pgvector_da_stack "zep${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_pgvector
    pegar_senha_pgvector > /dev/null 2>&1
    criar_banco_pgvector_da_stack "zep${1:+_$1}"
fi

sleep 5

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO ZEP \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack zep.yaml
cat > zep${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  zep${1:+_$1}_nlp:
    image: ghcr.io/getzep/zep-nlp-server:latest

    networks:
      - $nome_rede_interna

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager

## --------------------------- ORION --------------------------- ##

  zep${1:+_$1}_app:
    image: ghcr.io/getzep/zep:latest

    volumes:
      - /root/zep${1:+_$1}/config.yaml:/app/config.yaml

    networks:
      - $nome_rede_interna

    environment:
      ## Dados Postgres
      - ZEP_STORE_TYPE=postgres
      - ZEP_STORE_POSTGRES_DSN=postgres://postgres:$senha_pgvector@pgvector:5432/zep${1:+_$1}?sslmode=disable

      ## Dados de acesso:
      - ZEP_AUTH_SECRET=$apikey_zep

      ## Dados OpenAI
      - ZEP_OPENAI_API_KEY=$apikey_openai_zep

      ## Dados NLP
      - ZEP_NLP_SERVER_URL=http://zep${1:+_$1}_nlp:5557

      ## Configurações de extração
      - ZEP_EXTRACTORS_DOCUMENTS_EMBEDDINGS_SERVICE=openai
      - ZEP_EXTRACTORS_DOCUMENTS_EMBEDDINGS_DIMENSIONS=1536
      - ZEP_EXTRACTORS_MESSAGES_EMBEDDINGS_SERVICE=openai
      - ZEP_EXTRACTORS_MESSAGES_EMBEDDINGS_DIMENSIONS=1536
      - ZEP_EXTRACTORS_MESSAGES_SUMMARIZER_EMBEDDINGS_SERVICE=openai
      - ZEP_EXTRACTORS_MESSAGES_SUMMARIZER_EMBEDDINGS_DIMENSIONS=1536

      ## Configuração Graphiti
      - ZEP_GRAPHITI_URL=http://zep${1:+_$1}_graphiti:8003

      ## Degub:
      - ZEP_LOG_LEVEL=debug

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.zep${1:+_$1}.rule=Host(\`$url_zep\`)
        - traefik.http.routers.zep${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.zep${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.zep${1:+_$1}.loadbalancer.server.port=8000
        - traefik.http.services.zep${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.routers.zep${1:+_$1}.service=zep${1:+_$1}

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Zep"
fi
STACK_NAME="zep${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c zep.yaml zep #> /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do zep"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""

## Usa o serviço wait_zep para verificar se o serviço esta online
wait_stack "zep${1:+_$1}"

telemetria Zep finalizado

wait_30_sec

cd dados_vps

cat > dados_zep${1:+_$1} <<EOL
[ ZEP ]

Dominio do Zep: https://$url_zep/admin

ApiKey da OpenAI: $apikey_openai_zep

ApiKey do Zep: $apikey_zep
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ ZEP ]\e[0m"
echo ""

echo -e "\e[97mDominio:\e[33m https://$url_zep/admin\e[0m"
echo ""

echo -e "\e[97mApiKey do Zep:\e[33m $apikey_zep\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗  ██╗██╗   ██╗███╗   ███╗██╗  ██╗██╗   ██╗██████╗
## ██║  ██║██║   ██║████╗ ████║██║  ██║██║   ██║██╔══██╗
## ███████║██║   ██║██╔████╔██║███████║██║   ██║██████╔╝
## ██╔══██║██║   ██║██║╚██╔╝██║██╔══██║██║   ██║██╔══██╗
## ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║╚██████╔╝██████╔╝
## ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝

ferramenta_humhub() {

# Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_humhub

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ## Pergunta o Dominio da ferramenta
    echo -e "\e[97mPasso$amarelo 1/10\e[0m"
    echo -en "\e[33mDigite o Dominio para o HumHub (ex: humhub.oriondesign.art.br): \e[0m" && read -r url_humhub
    echo ""

    ## Pergunta o usuario da ferramenta
    echo -e "\e[97mPasso$amarelo 2/10\e[0m"
    echo -e "$amarelo--> AutoConfig é uma função que pula as etapas de configurações pós instalação"
    echo -en "\e[33mUsar o AutoConfig do HumHub (exemplo: 0 para não ou 1 para sim): \e[0m" && read -r autoconfig_humhub_valor
    echo ""

    if [ "$autoconfig_humhub_valor" -eq 1 ]; then
      autoconfig_humhub="- HUMHUB_AUTO_INSTALL=1"
    elif [ "$autoconfig_humhub_valor" -eq 0 ]; then
      autoconfig_humhub="#- HUMHUB_AUTO_INSTALL=0"
    else
      echo "Erro ao receber resposta do AutoConfig. Resposta precisa ser 0 ou 1"
      echo "Definindo para 0"
      autoconfig_humhub_valor="0"
      autoconfig_humhub="#- HUMHUB_AUTO_INSTALL=0"
    fi

    ## Pergunta o usuario da ferramenta
    echo -e "\e[97mPasso$amarelo 3/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ e/ou espaços"
    echo -en "\e[33mDigite um Usuario Admin (ex: OrionDesign): \e[0m" && read -r user_humhub
    echo ""

    ## Pergunta o email da ferramenta
    echo -e "\e[97mPasso$amarelo 4/10\e[0m"
    echo -en "\e[33mDigite o Email do Admin: (ex: contato@oriondesign.art.br): \e[0m" && read -r email_humhub
    echo ""

    ## Pergunta o senha da ferramenta
    echo -e "\e[97mPasso$amarelo 5/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma Senha para o Admin (ex: @Senha123_): \e[0m" && read -r pass_humhub
    echo ""

    ## Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 6/10\e[0m"
    echo -en "\e[33mDigite um Email para o SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_humhub
    echo ""

    ## Pergunta o User SMTP
    echo -e "\e[97mPasso$amarelo 7/10\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuario do SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_humhub
    echo ""

    ## Pergunta a Senha SMTP
    echo -e "\e[97mPasso$amarelo 8/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do email (ex: @Senha123_): \e[0m" && read -r senha_smtp_humhub
    echo ""

    ## Pergunta o Host SMTP
    echo -e "\e[97mPasso$amarelo 9/10\e[0m"
    echo -en "\e[33mDigite o Host SMTP do email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_humhub
    echo ""

    ## Pergunta a Porta SMTP
    echo -e "\e[97mPasso$amarelo 10/10\e[0m"
    echo -en "\e[33mDigite a Porta SMTP do email (ex: 465): \e[0m" && read -r porta_smtp_humhub
    echo ""

    if [ "$porta_smtp_humhub" -eq 465 ] || [ "$porta_smtp_humhub" -eq 25 ]; then
        porta_smtp_humhub_conv=1
    else
        porta_smtp_humhub_conv=0
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_humhub

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio do HumHub:\e[97m $url_humhub\e[0m"
    echo ""

    echo -e "\e[33mUsar AutoConfig:\e[97m $autoconfig_humhub\e[0m"
    echo ""

    ## Informação sobre Usuario Admin
    echo -e "\e[33mUsuario Admin:\e[97m $user_humhub\e[0m"
    echo ""

    ## Informação sobre Email Admin
    echo -e "\e[33mEmail do Admin:\e[97m $email_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mSenha do Admin:\e[97m $pass_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mUsuario SMTP:\e[97m $user_smtp_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_humhub\e[0m"
    echo ""

    ## Informação sobre Senha Admin
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_humhub\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_humhub

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO HUMHUB \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria HumHub iniciado

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/5]\e[0m"
echo ""
sleep 1

dados

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "humhub${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "humhub${1:+_$1}"
    fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO HUMHUB \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando a stack
cat > humhub${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  humhub${1:+_$1}:
    image: mriedmann/humhub:latest

    volumes:
      - humhub${1:+_$1}_data:/var/www/localhost/htdocs/protected/modules
      - humhub${1:+_$1}_uploads:/var/www/localhost/htdocs/uploads
      - humhub${1:+_$1}_assets:/var/www/localhost/htdocs/assets
      - humhub${1:+_$1}_themes:/var/www/localhost/htdocs/themes

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de acesso
      - HUMHUB_ADMIN_USERNAME=$user_humhub
      - HUMHUB_ADMIN_PASSWORD=$pass_humhub
      - HUMHUB_EMAIL=$email_humhub
      - HUMHUB_EMAIL_NAME=$user_humhub
      - HUMHUB_ADMIN_EMAIL=$email_humhub

      ## Dados SMTP
      - HUMHUB_MAILER_TRANSPORT_TYPE=smtp
      - HUMHUB_MAILER_SYSTEM_EMAIL_ADDRESS=$email_smtp_humhub
      - HUMHUB_MAILER_USERNAME=$user_smtp_humhub
      - HUMHUB_MAILER_PASSWORD=$senha_smtp_humhub
      - HUMHUB_MAILER_SYSTEM_EMAIL_NAME=Suporte
      - HUMHUB_MAILER_HOSTNAME=$host_smtp_humhub
      - HUMHUB_MAILER_PORT=$porta_smtp_humhub
      - HUMHUB_MAILER_ALLOW_SELF_SIGNED_CERTS=$porta_smtp_humhub_conv ## 0 = TLS | 1 = SSL

      ## Dados do MySQL
      - HUMHUB_DB_HOST=mysql
      - HUMHUB_DB_USER=root
      - HUMHUB_DB_PASSWORD=$senha_mysql
      - HUMHUB_DB_NAME=humhub${1:+_$1}
      $autoconfig_humhub

      ## Dados Redis
      - HUMHUB_REDIS_HOSTNAME=redis
      - HUMHUB_REDIS_PORT=6379
      - HUMHUB_CACHE_EXPIRE_TIME=3600
      - HUMHUB_CACHE_CLASS=yii\redis\Cache
      - HUMHUB_QUEUE_CLASS=humhub\modules\queue\driver\Redis

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.humhub${1:+_$1}.rule=Host(\`$url_humhub\`)
        - traefik.http.routers.humhub${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.humhub${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.humhub${1:+_$1}.service=humhub${1:+_$1}
        - traefik.http.services.humhub${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.services.humhub${1:+_$1}.loadbalancer.passHostHeader=true

## --------------------------- ORION --------------------------- ##

volumes:
  humhub${1:+_$1}_data:
    external: true
    name: humhub${1:+_$1}_data
  humhub${1:+_$1}_uploads:
    external: true
    name: humhub${1:+_$1}_uploads
  humhub${1:+_$1}_themes:
    external: true
    name: humhub${1:+_$1}_themes
  humhub${1:+_$1}_assets:
    external: true
    name: humhub${1:+_$1}_assets

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do HumHub"
fi
STACK_NAME="humhub${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c humhub.yaml humhub > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do humhub"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_calcom para verificar se o serviço esta online
wait_stack "humhub${1:+_$1}"

telemetria HumHub finalizado

cd dados_vps

cat > dados_humhub${1:+_$1} <<EOL
[ HUMHUB ]

Dominio do humhub: $url_humhub

Usuario: $user_humhub

Email: $email_humhub

Senha: $pass_humhub

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ HUMHUB ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_humhub\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_humhub\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_humhub\e[0m"
echo ""

echo -e "\e[33mHost MySQL:\e[97m mysql\e[0m"
echo ""

echo -e "\e[33mUsuario MySQL:\e[97m root\e[0m"
echo ""

echo -e "\e[33mSenha MySQL:\e[97m $senha_mysql\e[0m"
echo ""

echo -e "\e[33mBase de dados MySQL:\e[97m humhub\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ ██╗     ███████╗
## ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗██║     ██╔════╝
##  ╚████╔╝ ██║   ██║██║   ██║██████╔╝██║     ███████╗
##   ╚██╔╝  ██║   ██║██║   ██║██╔══██╗██║     ╚════██║
##    ██║   ╚██████╔╝╚██████╔╝██║  ██║███████╗███████║
##    ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝

ferramenta_yourls() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_yourls

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o Yourls (ex: yourls.oriondesign.art.br): \e[0m" && read -r url_yourls
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite o Usuario (ex: oriondesign): \e[0m" && read -r user_yourls
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -en "\e[33mDigite a Senha do usuario (ex: @Senha123_): \e[0m" && read -r pass_yourls
    echo ""
    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_yourls

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do yourls
    echo -e "\e[33mDominio do Yourls:\e[97m $url_yourls\e[0m"
    echo ""

    ## Informação sobre URL do yourls
    echo -e "\e[33mUsuario:\e[97m $user_yourls\e[0m"
    echo ""

    ## Informação sobre URL do yourls
    echo -e "\e[33mSenha:\e[97m $pass_yourls\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_yourls

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO YOURLS \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Yourls iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "yourls${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "yourls${1:+_$1}"
    fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO YOURLS \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack yourls.yaml
cat > yourls${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  yourls${1:+_$1}:
    image: yourls:latest

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - YOURLS_SITE=https://$url_yourls ## Url da Aplicação
      - YOURLS_USER=$user_yourls
      - YOURLS_PASS=$pass_yourls

      ## Dados do Mysql
      - YOURLS_DB_HOST=mysql
      - YOURLS_DB_NAME=yourls${1:+_$1}
      - YOURLS_DB_USER=root
      - YOURLS_DB_PASS=$senha_mysql

    deploy:
      mode: replicated
      replicas: 1
      resources:
        limits:
          cpus: "0.5"
          memory: 512M
      labels:
        - traefik.enable=true
        - traefik.http.routers.yourls${1:+_$1}.rule=Host(\`$url_yourls\`) ## Url da aplicação
        - traefik.http.routers.yourls${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.yourls${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.yourls${1:+_$1}.service=yourls${1:+_$1}
        - traefik.http.services.yourls${1:+_$1}.loadbalancer.server.port=80

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Yourls"
fi
STACK_NAME="yourls${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c yourls.yaml yourls > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do yourls"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "yourls" para verificar se o serviço esta online
wait_stack "yourls${1:+_$1}"

telemetria Yourls finalizado

cd dados_vps

cat > dados_yourls${1:+_$1} <<EOL
[ YOURLS ]

Dominio do Yourls: https://$url_yourls/admin

Usuario: $user_yourls

Senha: $pass_yourls

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ YOURLS ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_yourls/admin\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Yourls\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Yourls\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ████████╗██╗    ██╗███████╗███╗   ██╗████████╗██╗   ██╗ ██████╗██████╗ ███╗   ███╗
## ╚══██╔══╝██║    ██║██╔════╝████╗  ██║╚══██╔══╝╚██╗ ██╔╝██╔════╝██╔══██╗████╗ ████║
##    ██║   ██║ █╗ ██║█████╗  ██╔██╗ ██║   ██║    ╚████╔╝ ██║     ██████╔╝██╔████╔██║
##    ██║   ██║███╗██║██╔══╝  ██║╚██╗██║   ██║     ╚██╔╝  ██║     ██╔══██╗██║╚██╔╝██║
##    ██║   ╚███╔███╔╝███████╗██║ ╚████║   ██║      ██║   ╚██████╗██║  ██║██║ ╚═╝ ██║
##    ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝      ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝


ferramenta_twentycrm() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_twentycrm

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o dominio para o TwentyCRM (ex: twentycrm.oriondesign.art.br): \e[0m" && read -r url_twentycrm
    echo ""

    ## Pergunta o email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_twentycrm
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r user_smtp_twentycrm
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r pass_smtp_twentycrm
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_twentycrm
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_twentycrm

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_twentycrm

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mDominio do TwentyCRM:\e[97m $url_twentycrm\e[0m"
    echo ""

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_twentycrm\e[0m"
    echo ""

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mUsuario do SMTP:\e[97m $user_smtp_twentycrm\e[0m"
    echo ""

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mSenha do Email SMTP:\e[97m $pass_smtp_twentycrm\e[0m"
    echo ""

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_twentycrm\e[0m"
    echo ""

    ## Informação sobre URL do twentycrm
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_twentycrm\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_twentycrm

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO TWENTYCRM \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria TwentyCRM iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO TWENTYCRM \e[33m[2/3]\e[0m"
echo ""
sleep 1

senha_postgres_twentycrm=$(openssl rand -hex 16)
Key_aleatoria_twentycrm_1=$(openssl rand -hex 16)
Key_aleatoria_twentycrm_2=$(openssl rand -hex 16)
Key_aleatoria_twentycrm_3=$(openssl rand -hex 16)
Key_aleatoria_twentycrm_4=$(openssl rand -hex 16)

## Criando a stack
cat > twentycrm${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  twentycrm${1:+_$1}_server:
    image: twentycrm/twenty:latest

    volumes:
      - twentycrm_data:/app/packages/twenty-server/.local-storage
      - twentycrm_docker:/app/docker-data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - PORT=3000
      - PG_DATABASE_URL=postgres://postgres:$senha_postgres_twentycrm@db:5432/default
      - SERVER_URL=http://$url_twentycrm  # Substituído diretamente
      - FRONT_BASE_URL=http://$url_twentycrm  # Mesma URL do SERVER_URL
      - REDIS_URL=redis://redis:6379  # Já configurado
      - ENABLE_DB_MIGRATIONS=true
      - SIGN_IN_PREFILLED=true
      - STORAGE_TYPE=local
      - APP_SECRET=$Key_aleatoria_twentycrm_1

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 4192M
      labels:
        - traefik.enable=true
        - traefik.http.routers.twentycrm${1:+_$1}.rule=Host(\`$url_twentycrm\`) ## Url da aplicação
        - traefik.http.services.twentycrm${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.twentycrm${1:+_$1}.service=twentycrm${1:+_$1}
        - traefik.http.routers.twentycrm${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.twentycrm${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.twentycrm${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

  twentycrm${1:+_$1}_worker:
    image: twentycrm/twenty:latest
    command: ["yarn", "worker:prod"]

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - PORT=3000
      - PG_DATABASE_URL=postgres://postgres:$senha_postgres_twentycrm@db:5432/default
      - SERVER_URL=http://$url_twentycrm  # Substituído diretamente
      - FRONT_BASE_URL=http://$url_twentycrm  # Mesma URL do SERVER_URL
      - REDIS_URL=redis://redis:6379  # Já configurado
      - ENABLE_DB_MIGRATIONS=true
      - SIGN_IN_PREFILLED=true
      - STORAGE_TYPE=local
      - APP_SECRET=$Key_aleatoria_twentycrm_1

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

  twentycrm${1:+_$1}_db:
    image: twentycrm/twenty-postgres:latest

    volumes:
      - twentycrm_db_data:/home/postgres/pgdata

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - PGUSER_SUPERUSER=postgres
      - PGPASSWORD_SUPERUSER=$senha_postgres_twentycrm
      - ALLOW_NOSSL=true
      - SPILO_PROVIDER=local

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  twentycrm_data:
    external: true
    name: twentycrm_data
  twentycrm_docker:
    external: true
    name: twentycrm_docker
  twentycrm_db_data:
    external: true
    name: twentycrm_db_data

networks:
  $nome_rede_interna: ## Nome da sua rede interna
    name: $nome_rede_interna ## Nome da sua rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do twentycrm"
fi
STACK_NAME="twentycrm${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c twentycrm.yaml twentycrm > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do twentycrm"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "twentycrm" para verificar se o serviço esta online
wait_stack "twentycrm${1:+_$1}"

telemetria TwentyCRM finalizado

cd dados_vps

cat > dados_twentycrm${1:+_$1} <<EOL
[ TWENTYCRM ]

Dominio do TwentyCRM: https://$url_twentycrm

Usuario: Precisa criar no primeiro acesso do TwentyCRM

Senha: Precisa criar no primeiro acesso do TwentyCRM
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ TWENTYCRM ]\e[0m"
echo ""

echo -e "\e[33mDominio do TwentyCRM:\e[97m https://$url_twentycrm\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do TwentyCRM\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do TwentyCRM\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███╗   ███╗ █████╗ ████████╗████████╗███████╗██████╗ ███╗   ███╗ ██████╗ ███████╗████████╗
## ████╗ ████║██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██╔═══██╗██╔════╝╚══██╔══╝
## ██╔████╔██║███████║   ██║      ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║███████╗   ██║
## ██║╚██╔╝██║██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║╚════██║   ██║
## ██║ ╚═╝ ██║██║  ██║   ██║      ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝███████║   ██║
## ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝   ╚═╝


ferramenta_mattermost() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_mattermost

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Mattermost (ex: mattermost.oriondesign.art.br): \e[0m" && read -r url_mattermost
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_mattermost

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do mattermost
    echo -e "\e[33mDominio do Mattermost:\e[97m $url_mattermost\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_mattermost

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MATTERMOST \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Mattermost iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Cansei já de explicar o que isso faz kkkk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "mattermost${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "mattermost${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MATTERMOST \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack mattermost.yaml
cat > mattermost${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  mattermost${1:+_$1}:
    image: mattermost/mattermost-team-edition:latest

    volumes:
      - mattermost${1:+_$1}_data:/mattermost/data
      - mattermost${1:+_$1}_config:/mattermost/config
      - mattermost${1:+_$1}_logs:/mattermost/logs
      - mattermost${1:+_$1}_plugins:/mattermost/plugins
      - mattermost${1:+_$1}_client_plugins:/mattermost/client/plugins

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de acesso
      - MM_SERVICESETTINGS_SITEURL=https://$url_mattermost

      ## Dados do Postgres
      - MM_SQLSETTINGS_DRIVERNAME=postgres
      - MM_SQLSETTINGS_DATASOURCE=postgres://postgres:$senha_postgres@postgres:5432/mattermost${1:+_$1}?sslmode=disable&connect_timeout=10

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.mattermost${1:+_$1}.rule=Host(\`$url_mattermost\`)
        - traefik.http.routers.mattermost${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.mattermost${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.mattermost${1:+_$1}.service=mattermost${1:+_$1}
        - traefik.http.services.mattermost${1:+_$1}.loadbalancer.server.port=8065
        - traefik.http.services.mattermost${1:+_$1}.loadbalancer.passhostheader=true
        - traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https
        - traefik.http.routers.mattermost${1:+_$1}.middlewares=sslheader@docker

## --------------------------- ORION --------------------------- ##

volumes:
  mattermost${1:+_$1}_data:
    external: true
    name: mattermost${1:+_$1}_data
  mattermost${1:+_$1}_config:
    external: true
    name: mattermost${1:+_$1}_config
  mattermost${1:+_$1}_logs:
    external: true
    name: mattermost${1:+_$1}_logs
  mattermost${1:+_$1}_plugins:
    external: true
    name: mattermost${1:+_$1}_plugins
  mattermost${1:+_$1}_client_plugins:
    external: true
    name: mattermost${1:+_$1}_client_plugins

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do mattermost"
fi
STACK_NAME="mattermost${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c mattermost.yaml mattermost > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do mattermost"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "mattermost" para verificar se o serviço esta online
wait_stack "mattermost${1:+_$1}"

telemetria Mattermost finalizado

cd dados_vps

cat > dados_mattermost${1:+_$1} <<EOL
[ MATTERMOST ]

Dominio do Mattermost: https://$url_mattermost

Usuario: Precisa criar no primeiro acesso do Mattermost

Senha: Precisa criar no primeiro acesso do Mattermost
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MATTERMOST ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_mattermost\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Mattermost\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Mattermost\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##   ██████╗ ██╗   ██╗████████╗██╗     ██╗███╗   ██╗███████╗
##  ██╔═══██╗██║   ██║╚══██╔══╝██║     ██║████╗  ██║██╔════╝
##  ██║   ██║██║   ██║   ██║   ██║     ██║██╔██╗ ██║█████╗
##  ██║   ██║██║   ██║   ██║   ██║     ██║██║╚██╗██║██╔══╝
##  ╚██████╔╝╚██████╔╝   ██║   ███████╗██║██║ ╚████║███████╗
##   ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝

ferramenta_outline() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_outline

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o dominio para o Outline (ex: outline.oriondesign.art.br): \e[0m" && read -r url_outline
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -e "$amarelo--> Caso não tiver crie em: https://console.cloud.google.com/apis/credentials"
    echo -en "\e[33mDigite o seu ID do Cliente Google (ex: XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com): \e[0m" && read -r id_google_outline
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -e "$amarelo--> Caso não tiver crie em: https://console.cloud.google.com/apis/credentials"
    echo -en "\e[33mDigite a sua Chave Secreta do Cliente Google (ex: XXXXXX-XXXXXXXXXXXXXXXXXXXXXXXX-XXX): \e[0m" && read -r key_google_outline
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -e "$amarelo--> Caso não tiver crie em: https://console.cloud.google.com/apis/credentials"
    echo -en "\e[33mDigite a sua API Key do Google (ex: XXXXXXXXXXX-XXXXXXXXXXXXX-XXXXXXXXXXXXX): \e[0m" && read -r api_google_outline
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_outline

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do outline
    echo -e "\e[33mDominio do Outline:\e[97m $url_outline\e[0m"
    echo ""

    ## Informação sobre URL do outline
    echo -e "\e[33mID do Cliente Google:\e[97m $id_google_outline\e[0m"
    echo ""

    ## Informação sobre URL do outline
    echo -e "\e[33mChave Secreta do Cliente Google:\e[97m $key_google_outline\e[0m"
    echo ""

    ## Informação sobre URL do outline
    echo -e "\e[33mAPI Key do Google:\e[97m $api_google_outline\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_outline

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO OUTLINE \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Outline iniciado
## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Cansei já de explicar o que isso faz kkkk
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "outline${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "outline${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO outline \e[33m[4/5]\e[0m"
echo ""
sleep 1

Key_aleatoria_outline_1=$(openssl rand -hex 16)
Key_aleatoria_outline_2=$(openssl rand -hex 16)

## Criando a stack outline.yaml
cat > outline${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  outline${1:+_$1}:
    image: outlinewiki/outline:0.75.0

    volumes:
      - outline${1:+_$1}_data:/var/lib/outline/data

    networks:
      - $nome_rede_interna

    environment:
      ## Dados de acesso
      - URL=https://$url_outline
      - FORCE_HTTPS=true

      ## Desativar novos cadastros
      - LIMITS_INVITATION_REQUIRED=false

      # IDIOMA PADRÃO
      - DEFAULT_LANGUAGE=pt_BR

      ## Secrets Keys
      - SECRET_KEY=$Key_aleatoria_outline_1
      - UTILS_SECRET=$Key_aleatoria_outline_2

      ## Dados Postgres
      - DATABASE_URL=postgres://postgres:$senha_postgres@postgres:5432/outline${1:+_$1}
      - DATABASE_URL_TEST=postgres://postgres:$senha_postgres@postgres:5432/outline${1:+_$1}_test
      - PGSSLMODE=disable

      ## Dados Redis
      - REDIS_URL=redis://redis:6379/3

      ## Dados sobre Armazenamento
      - FILE_STORAGE=local
      - FILE_STORAGE_LOCAL_ROOT_DIR=/var/lib/outline/data
      - FILE_STORAGE_UPLOAD_MAX_SIZE=26214400
      - FILE_STORAGE_IMPORT_MAX_SIZE=18874368
      - FILE_STORAGE_WORKSPACE_IMPORT_MAX_SIZE=18874368

      # LOGIN COM O GOOGLE
      - GOOGLE_CLIENT_ID=$id_google_outline
      - GOOGLE_CLIENT_SECRET=$key_google_outline
      - NEXT_PUBLIC_GOOGLE_API_KEY=$api_google_outline

      ## Dados do SMTP
      #- SMTP_FROM_EMAIL=email@dominio.com ## Email SMTP
      #- SMTP_REPLY_EMAIL=email@dominio.com ## Email SMTP
      #- SMTP_USERNAME=email@dominio.com ## Usuario SMTP
      #- SMTP_PASSWORD=@Senha123_ ## Senha SMTP
      #- SMTP_HOST=smtp.provedor.com ## Host SMTP
      #- SMTP_PORT=587 ## Porta SMTP
      #- SMTP_SECURE=false ## Se a porta for 465 ou 25 = true || Qualquer outra = false

      ## Outras configurações
      - RATE_LIMITER_ENABLED=true
      - RATE_LIMITER_REQUESTS=1000
      - RATE_LIMITER_DURATION_WINDOW=60
      - ENABLE_UPDATES=false
      - WEB_CONCURRENCY=6
      - DEBUG=http
      - LOG_LEVEL=info

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.outline${1:+_$1}.rule=Host(\`$url_outline\`)
        - traefik.http.routers.outline${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.outline${1:+_$1}.tls=true
        - traefik.http.routers.outline${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.outline${1:+_$1}.service=outline${1:+_$1}
        - traefik.http.services.outline${1:+_$1}.loadbalancer.server.port=3000

## --------------------------- ORION --------------------------- ##

volumes:
  outline${1:+_$1}_data:
    external: true
    name: outline${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Outline"
fi
STACK_NAME="outline${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c outline.yaml outline > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do outline"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "outline" para verificar se o serviço esta online
wait_stack "outline${1:+_$1}"

telemetria Outline finalizado

cd dados_vps

cat > dados_outline${1:+_$1} <<EOL
[ OUTLINE ]

Dominio do Outline: https://$url_outline

Usuario: Login é feito com o Google

Senha: Login é feito com o Google

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ OUTLINE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_outline\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Login é feito com o Google\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Login é feito com o Google\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗ ██████╗  ██████╗ █████╗ ██╗     ██████╗  ██████╗  █████╗ ██████╗ ██████╗
## ██╔════╝██╔═══██╗██╔════╝██╔══██╗██║     ██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗
## █████╗  ██║   ██║██║     ███████║██║     ██████╔╝██║   ██║███████║██████╔╝██║  ██║
## ██╔══╝  ██║   ██║██║     ██╔══██║██║     ██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║
## ██║     ╚██████╔╝╚██████╗██║  ██║███████╗██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝
## ╚═╝      ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝

ferramenta_focalboard() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_focalboard

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o FocalBoard (ex: focalboard.oriondesign.art.br): \e[0m" && read -r url_focalboard
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_focalboard

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do focalboard
    echo -e "\e[33mDominio do FocalBoard:\e[97m $url_focalboard\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_focalboard

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO FOCALBOARD \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Focalboard iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO FOCALBOARD \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack focalboard.yaml
cat > focalboard${1:+_$1}.yaml <<EOL
version: "3.8"
services:

## --------------------------- ORION --------------------------- ##

  focalboard${1:+_$1}:
    image: mattermost/focalboard:latest

    volumes:
      - focalboard${1:+_$1}_data:/opt/focalboard/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - VIRTUAL_HOST=$url_focalboard ## Url da Aplicação
      - VIRTUAL_PORT=8000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.focalboard${1:+_$1}.rule=Host(\`$url_focalboard\`) ## Url da Aplicação
        - traefik.http.services.focalboard${1:+_$1}.loadBalancer.server.port=8000
        - traefik.http.routers.focalboard${1:+_$1}.service=focalboard${1:+_$1}
        - traefik.http.routers.focalboard${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.focalboard${1:+_$1}.tls.certresolver=letsencryptresolver

## --------------------------- ORION --------------------------- ##

volumes:
  focalboard${1:+_$1}_data:
    external: true
    name: focalboard${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do focalboard"
fi
STACK_NAME="focalboard${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c focalboard.yaml focalboard > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do focalboard"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_focalboard para verificar se o serviço esta online
wait_stack "focalboard${1:+_$1}"

telemetria Focalboard finalizado

cd dados_vps

cat > dados_focalboard${1:+_$1} <<EOL
[ FOCALBOARD ]

Dominio do FocalBoard: https://$url_focalboard

Usuario: Precisa criar no primeiro acesso do FocalBoard

Senha: Precisa criar no primeiro acesso do FocalBoard
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ FOCALBOARD ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_focalboard\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do FocalBoard\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do FocalBoard\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  ██████╗ ██╗     ██████╗ ██╗
## ██╔════╝ ██║     ██╔══██╗██║
## ██║  ███╗██║     ██████╔╝██║
## ██║   ██║██║     ██╔═══╝ ██║
## ╚██████╔╝███████╗██║     ██║
##  ╚═════╝ ╚══════╝╚═╝     ╚═╝

ferramenta_glpi() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_glpi

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o GLPI (ex: glpi.oriondesign.art.br): \e[0m" && read -r url_glpi
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_glpi

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do glpi
    echo -e "\e[33mDominio do GLPI:\e[97m $url_glpi\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_glpi

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO GLPI \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria GLPI iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "glpi${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "glpi${1:+_$1}"
    fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO GLPI \e[33m[3/4]\e[0m"
echo ""
sleep 1

## Criando a stack glpi.yaml
cat > glpi${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  glpi${1:+_$1}:
    image: diouxx/glpi:latest

    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - glpi${1:+_$1}_glpi:/var/www/html/glpi

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - TIMEZONE=America/Sao_Paulo

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.glpi${1:+_$1}.rule=Host(\`$url_glpi\`)
        - traefik.http.services.glpi${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.glpi${1:+_$1}.service=glpi${1:+_$1}
        - traefik.http.routers.glpi${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.glpi${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.glpi${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  glpi${1:+_$1}_glpi:
    external: true
    name: glpi${1:+_$1}_glpi

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do GLPI"
fi
STACK_NAME="glpi${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c glpi.yaml glpi > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do glpi"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "glpi" para verificar se o serviço esta online
wait_stack "glpi${1:+_$1}"

telemetria GLPI finalizado

cd dados_vps

cat > dados_glpi${1:+_$1} <<EOL
[ GLPI ]

Dominio do GLPI: https://$url_glpi

Usuario: glpi

Senha: glpi
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ GLPI ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_glpi\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m glpi\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m glpi\e[0m"
echo ""

echo -e "\e[33mEndereço do servidor SQL:\e[97m mysql\e[0m"
echo ""

echo -e "\e[33mUsuário SQL:\e[97m root\e[0m"
echo ""

echo -e "\e[33mSenha SQL:\e[97m $senha_mysql\e[0m"
echo ""

echo -e "\e[33mBanco de dados:\e[97m glpi\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

##  █████╗ ███╗   ██╗██╗   ██╗████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ██╗     ██╗     ███╗   ███╗
## ██╔══██╗████╗  ██║╚██╗ ██╔╝╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██║     ██║     ████╗ ████║
## ███████║██╔██╗ ██║ ╚████╔╝    ██║   ███████║██║██╔██╗ ██║██║  ███╗    ██║     ██║     ██╔████╔██║
## ██╔══██║██║╚██╗██║  ╚██╔╝     ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ██║     ██║     ██║╚██╔╝██║
## ██║  ██║██║ ╚████║   ██║      ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████╗███████╗██║ ╚═╝ ██║
## ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚══════╝╚═╝     ╚═╝

ferramenta_anythingllm() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_anythingllm

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o Anything LLM (ex: anythingllm.oriondesign.art.br): \e[0m" && read -r url_anythingllm
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    read -r ip _ <<<$(hostname -I)
    echo -en "\e[33mDigite o dominio do Qdrant (ex: http://$ip:6333  ou http://qdrant.oriondesign.art.br:6333): \e[0m" && read -r qdrant_anythingllm
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    key_dify_rand=$(openssl rand -hex 16)
    echo -en "\e[33mDigite a Api Key do Qdrant (ex: $key_dify_rand): \e[0m" && read -r api_qdrant_anythingllm
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_anythingllm

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do anythingllm
    echo -e "\e[33mDominio do Anything LLM:\e[97m $url_anythingllm\e[0m"
    echo ""

    echo -e "\e[33mDominio do Qdrant:\e[97m $qdrant_anythingllm\e[0m"
    echo ""

    echo -e "\e[33mApi Key do Qdrant:\e[97m $api_qdrant_anythingllm\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_anythingllm

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO ANYTHING LLM \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria AnythingLLM iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO ANYTHING LLM \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack anythingllm.yaml
cat > anythingllm${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  anythingllm${1:+_$1}:
    image: mintplexlabs/anythingllm:latest

    volumes:
      - anythingllm${1:+_$1}_storage:/app/server/storage
      - anythingllm${1:+_$1}_hotdir:/app/collector/hotdir
      - anythingllm${1:+_$1}_outputs:/app/collector/outputs

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - SERVER_PORT=3001
      - STORAGE_DIR=/app/server/storage
      - UID=1000
      - GID=1000

      ## Dados Qdrant
      - VECTOR_DB=qdrant
      - QDRANT_ENDPOINT=$qdrant_anythingllm
      - QDRANT_API_KEY=$api_qdrant_anythingllm

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.anythingllm${1:+_$1}.rule=Host(\`$url_anythingllm\`)
        - traefik.http.services.anythingllm${1:+_$1}.loadbalancer.server.port=3001
        - traefik.http.routers.anythingllm${1:+_$1}.service=anythingllm${1:+_$1}
        - traefik.http.routers.anythingllm${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.anythingllm${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.anythingllm${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  anythingllm${1:+_$1}_storage:
    external: true
    name: anythingllm${1:+_$1}_storage
  anythingllm${1:+_$1}_hotdir:
    external: true
    name: anythingllm${1:+_$1}_hotdir
  anythingllm${1:+_$1}_outputs:
    external: true
    name: anythingllm${1:+_$1}_outputs

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do anythingllm"
fi
STACK_NAME="anythingllm${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c anythingllm.yaml anythingllm > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do anythingllm"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "anythingllm" para verificar se o serviço esta online
wait_stack "anythingllm${1:+_$1}"

telemetria AnythingLLM finalizado

cd dados_vps

cat > dados_anythingllm <<EOL
[ ANYTHING LLM ]

Dominio do Anything LLM: https://$url_anythingllm

Usuario: Precisa criar no primeiro acesso do Anything LLM

Senha: Precisa criar no primeiro acesso do Anything LLM

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ ANYTHING LLM ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_anythingllm\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Anything LLM\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Anything LLM\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗██╗  ██╗ ██████╗ █████╗ ██╗     ██╗██████╗ ██████╗  █████╗ ██╗    ██╗
## ██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔══██╗██║    ██║
## █████╗   ╚███╔╝ ██║     ███████║██║     ██║██║  ██║██████╔╝███████║██║ █╗ ██║
## ██╔══╝   ██╔██╗ ██║     ██╔══██║██║     ██║██║  ██║██╔══██╗██╔══██║██║███╗██║
## ███████╗██╔╝ ██╗╚██████╗██║  ██║███████╗██║██████╔╝██║  ██║██║  ██║╚███╔███╔╝
## ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝

ferramenta_excalidraw() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_excalidraw

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Excalidraw (ex: excalidraw.oriondesign.art.br): \e[0m" && read -r url_excalidraw
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_excalidraw

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do excalidraw
    echo -e "\e[33mDominio do Excalidraw:\e[97m $url_excalidraw\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_excalidraw

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO EXCALIDRAW \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Excalidraw iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO EXCALIDRAW \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack
cat > excalidraw${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  excalidraw${1:+_$1}:
    image: excalidraw/excalidraw:latest

    volumes:
      - excalidraw${1:+_$1}_data:/data

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - EXCALIDRAW_PORT=80
      - NODE_ENV=development

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.excalidraw${1:+_$1}.rule=Host(\`$url_excalidraw\`)
        - traefik.http.services.excalidraw.${1:+_$1}loadbalancer.server.port=80
        - traefik.http.routers.excalidraw${1:+_$1}.service=excalidraw${1:+_$1}
        - traefik.http.routers.excalidraw${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.excalidraw${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.excalidraw${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##


volumes:
  excalidraw${1:+_$1}_data:
    external: true
    name: excalidraw${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do excalidraw"
fi
STACK_NAME="excalidraw${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c excalidraw.yaml excalidraw > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do excalidraw"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "excalidraw" para verificar se o serviço esta online
wait_stack "excalidraw${1:+_$1}"

telemetria Excalidraw finalizado

cd dados_vps

cat > dados_excalidraw${1:+_$1} <<EOL
[ EXCALIDRAW ]

Dominio do Excalidraw: https://$url_excalidraw

Usuario: Precisa criar no primeiro acesso do Excalidraw

Senha: Precisa criar no primeiro acesso do Excalidraw
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ EXCALIDRAW ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_excalidraw\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Excalidraw\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Excalidraw\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## ███████╗ █████╗ ███████╗██╗   ██╗██╗
## ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝██║
## █████╗  ███████║███████╗ ╚████╔╝ ██║
## ██╔══╝  ██╔══██║╚════██║  ╚██╔╝  ╚═╝
## ███████╗██║  ██║███████║   ██║   ██╗
## ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝
##
##  █████╗ ██████╗ ██████╗  ██████╗ ██╗███╗   ██╗████████╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
## ██╔══██╗██╔══██╗██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
## ███████║██████╔╝██████╔╝██║   ██║██║██╔██╗ ██║   ██║   ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗
## ██╔══██║██╔═══╝ ██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║   ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
## ██║  ██║██║     ██║     ╚██████╔╝██║██║ ╚████║   ██║   ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║
## ╚═╝  ╚═╝╚═╝     ╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝

ferramenta_easyappointments() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_easyappointments

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Easy!Appointments (ex: easyappointments.oriondesign.art.br): \e[0m" && read -r url_easyappointments
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_easyappointments

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do easyappointments
    echo -e "\e[33mDominio do Easy!Appointments:\e[97m $url_easyappointments\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_easyappointments

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO EASY!APPOINTMENTS \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Easy!Appointments iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/4]\e[0m"
echo ""
sleep 1

dados

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "easyapointments${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
        echo ""
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "easyapointments${1:+_$1}"
    fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO EASY!APPOINTMENTS \e[33m[3/4]\e[0m"
echo ""
sleep 1


# Cria o arquivo com o conteúdo desejado
cat > apache-custom.conf << EOL
ServerName $url_easyappointments
EOL

# Cria o diretório, se ainda não existir
mkdir -p /root/easyappointments${1:+_$1} > /dev/null 2>&1

# Move o arquivo para o diretório de destino
sudo mv apache-custom.conf /root/easyappointments${1:+_$1}/apache-custom.conf

## Criando a stack
cat > easyappointments${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  easyapointments${1:+_$1}:
    image: alextselegidis/easyappointments:latest

    volumes:
      - easyapointments${1:+_$1}_data:/var/www/html
      - /root/easyappointments${1:+_$1}/apache-custom.conf:/etc/apache2/conf-enabled/custom.conf:ro

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - BASE_URL=https://$url_easyappointments
      - APACHE_SERVER_NAME=$url_easyappointments

      ## Dados do banco de dados
      - DB_HOST=mysql
      - DB_NAME=easyapointments${1:+_$1}
      - DB_USERNAME=root
      - DB_PASSWORD=$senha_mysql

      ## Dados Google Calendar
      - GOOGLE_SYNC_FEATURE=false
      - GOOGLE_PRODUCT_NAME=
      - GOOGLE_CLIENT_ID=
      - GOOGLE_CLIENT_SECRET=
      - GOOGLE_API_KEY=

      ## Modo de Debug
      - DEBUG_MODE=TRUE

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.easyapointments${1:+_$1}.rule=Host(\`$url_easyappointments\`)
        - traefik.http.services.easyapointments${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.easyapointments${1:+_$1}.service=easyapointments${1:+_$1}
        - traefik.http.routers.easyapointments${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.easyapointments${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.easyapointments${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  easyapointments${1:+_$1}_data:
    external: true
    name: easyapointments${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Easy!Appointments"
fi
STACK_NAME="easyappointments${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c easyappointments.yaml easyappointments > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do easyappointments"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "easyappointments" para verificar se o serviço esta online
wait_stack "easyappointments${1:+_$1}"

telemetria Easy!Appointments finalizado

cd dados_vps

cat > dados_easyappointments${1:+_$1} <<EOL
[ EASY!APPOINTMENTS ]

Dominio do Easy!Appointments: https://$url_easyappointments

Usuario: Precisa criar no primeiro acesso do Easy!Appointments

Senha: Precisa criar no primeiro acesso do Easy!Appointments
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ EASY!APPOINTMENTS ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_easyappointments\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do Easy!Appointments\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Easy!Appointments\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ██████╗  ██████╗  ██████╗██╗   ██╗███╗   ███╗███████╗███╗   ██╗███████╗ ██████╗
## ██╔══██╗██╔═══██╗██╔════╝██║   ██║████╗ ████║██╔════╝████╗  ██║██╔════╝██╔═══██╗
## ██║  ██║██║   ██║██║     ██║   ██║██╔████╔██║█████╗  ██╔██╗ ██║███████╗██║   ██║
## ██║  ██║██║   ██║██║     ██║   ██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║╚════██║██║   ██║
## ██████╔╝╚██████╔╝╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██║ ╚████║███████║╚██████╔╝
## ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝ ╚═════╝

ferramenta_documenso() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_documenso

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio do Builder
    echo -e "\e[97mPasso$amarelo 1/8\e[0m"
    echo -en "\e[33mDigite o Dominio para o Builder do Documenso (ex: documenso.oriondesign.art.br): \e[0m" && read -r url_documenso
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 2/8\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_documenso
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/8\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_email_documenso
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/8\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_documenso
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/8\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_documenso
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/8\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_documenso
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_documenso" -eq 465 ]; then
    smtp_secure_documenso=true
    else
    smtp_secure_documenso=false
    fi

    ## Pergunta qual é o Access Key do minio
    echo -e "\e[97mPasso$amarelo 7/8\e[0m"
    echo -en "\e[33mAccess Key Minio: \e[0m" && read -r S3_ACCESS_KEY
    echo ""

    ## Pergunta qual é a Secret Key do minio
    echo -e "\e[97mPasso$amarelo 8/8\e[0m"
    echo -en "\e[33mSecret Key Minio: \e[0m" && read -r S3_SECRET_KEY
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_documenso

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do Builder
    echo -e "\e[33mDominio do Documenso:\e[97m $url_documenso\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mEmail do SMTP:\e[97m $email_documenso\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mUsuário do SMTP:\e[97m $usuario_email_documenso\e[0m"
    echo ""

    ## Informação sobre Senha do Email
    echo -e "\e[33mSenha do Email:\e[97m $senha_email_documenso\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP do Email:\e[97m $smtp_email_documenso\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_documenso\e[0m"
    echo ""

    ## Informação sobre Secure SMTP
    echo -e "\e[33mSecure SMTP do Email:\e[97m $smtp_secure_documenso\e[0m"
    echo ""

    ## Informação sobre Access Key
    echo -e "\e[33mAccess Key Minio:\e[97m $S3_ACCESS_KEY\e[0m"
    echo ""

    ## Informação sobre Secret Key
    echo -e "\e[33mSecret Key Minio:\e[97m $S3_SECRET_KEY\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_documenso

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done


## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO DOCUMENSO \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria Documenso iniciado

## Nada nada nada.. só para aparecer a mensagem de passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "documenso${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "documenso${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• PEGANDO DADOS DO MINIO \e[33m[3/5]\e[0m"
echo ""
sleep 1

pegar_senha_minio
if [ $? -eq 0 ]; then
    echo "1/2 - [ OK ] - Pegando Senha do MinIO"
else
    echo "1/2 - [ OFF ] - Pegando Senha do MinIO"
    echo "Não foi possivel pegar a senha do minio"
fi
pegar_link_s3
if [ $? -eq 0 ]; then
    echo "2/2 - [ OK ] - Pegando URL do S3"
else
    echo "2/2 - [ OFF ] - Pegando URL do S3"
    echo "Não foi possivel pegar o link do S3"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO DOCUMENSO \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Criando key Aleatória
key_documenso1=$(openssl rand -hex 16)
key_documenso2=$(openssl rand -hex 16)
key_documenso3=$(openssl rand -hex 16)

## Criando a stack documenso.yaml
cat > documenso${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  documenso${1:+_$1}:
    image: documenso/documenso:latest

    volumes:
      - documenso${1:+_$1}_cert:/opt/documenso/cert.p12

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de Acesso
      - PORT=3000
      - NEXTAUTH_URL=https://$url_documenso
      - NEXT_PUBLIC_WEBAPP_URL=https://$url_documenso
      - NEXT_PUBLIC_MARKETING_URL=https://oriondesign.art.br

      ## Secret Keys
      - NEXTAUTH_SECRET=$key_documenso1
      - NEXT_PRIVATE_ENCRYPTION_KEY=$key_documenso2
      - NEXT_PRIVATE_ENCRYPTION_SECONDARY_KEY=$key_documenso3

      ## Dados do Google Cloud
      #- NEXT_PRIVATE_GOOGLE_CLIENT_ID=
      #- NEXT_PRIVATE_GOOGLE_CLIENT_SECRET=

      ## Dados Postgres
      - NEXT_PRIVATE_DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/documenso${1:+_$1}
      - NEXT_PRIVATE_DIRECT_DATABASE_URL=postgresql://postgres:$senha_postgres@postgres:5432/documenso${1:+_$1}

      ## Configurações MinIO
      - NEXT_PUBLIC_UPLOAD_TRANSPORT=s3
      - NEXT_PRIVATE_UPLOAD_ENDPOINT=https://$url_s3
      - NEXT_PRIVATE_UPLOAD_FORCE_PATH_STYLE=true
      - NEXT_PRIVATE_UPLOAD_REGION=eu-south
      - NEXT_PRIVATE_UPLOAD_BUCKET=documenso${1:+-$1}
      - NEXT_PRIVATE_UPLOAD_ACCESS_KEY_ID=$S3_ACCESS_KEY
      - NEXT_PRIVATE_UPLOAD_SECRET_ACCESS_KEY=$S3_SECRET_KEY

      ## Dados de SMTP
      - NEXT_PRIVATE_SMTP_TRANSPORT=smtp-auth
      - NEXT_PRIVATE_SMTP_FROM_ADDRESS=$email_documenso
      - NEXT_PRIVATE_SMTP_USERNAME=$usuario_email_documenso
      - NEXT_PRIVATE_SMTP_PASSWORD=$senha_email_documenso
      - NEXT_PRIVATE_SMTP_HOST=$smtp_email_documenso
      - NEXT_PRIVATE_SMTP_PORT=$porta_smtp_documenso
      - NEXT_PRIVATE_SMTP_SECURE=$smtp_secure_documenso
      - NEXT_PRIVATE_SMTP_FROM_NAME=Suporte

      ## Configurações
      - NEXT_PUBLIC_DOCUMENT_SIZE_UPLOAD_LIMIT=10
      - NEXT_PUBLIC_DISABLE_SIGNUP=false
      - NEXT_PRIVATE_SIGNING_LOCAL_FILE_PATH=/opt/documenso/cert.p12

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.documenso${1:+_$1}.rule=Host(\`$url_documenso\`)
        - traefik.http.services.documenso${1:+_$1}.loadbalancer.server.port=3000
        - traefik.http.routers.documenso${1:+_$1}.service=documenso${1:+_$1}
        - traefik.http.routers.documenso${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.documenso${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.documenso${1:+_$1}.tls=true


## --------------------------- ORION --------------------------- ##

volumes:
  documenso${1:+_$1}_cert:
    external: true
    name: documenso${1:+_$1}_cert

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do documenso"
fi
STACK_NAME="documenso${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c documenso.yaml documenso > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack do documenso"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "documenso" para verificar se o serviço esta online
wait_stack "documenso${1:+_$1}"

telemetria Documenso finalizado

cd dados_vps

cat > dados_documenso${1:+_$1} <<EOL
[ DOCUMENSO ]

Dominio do Documenso: https://$url_documenso

Email: Precisa criar no primeiro acesso do Documenso

Senha: Precisa criar no primeiro acesso do Documenso
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ DOCUMENSO ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_documenso\e[0m"
echo ""

echo -e "\e[33mEmail:\e[97m Precisa criar no primeiro acesso do Documenso\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do Documenso\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ███╗   ███╗ ██████╗  ██████╗ ██████╗ ██╗     ███████╗
## ████╗ ████║██╔═══██╗██╔═══██╗██╔══██╗██║     ██╔════╝
## ██╔████╔██║██║   ██║██║   ██║██║  ██║██║     █████╗
## ██║╚██╔╝██║██║   ██║██║   ██║██║  ██║██║     ██╔══╝
## ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██████╔╝███████╗███████╗
## ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝

ferramenta_moodle() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_moodle

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/10\e[0m"
    echo -en "\e[33mDigite o dominio para o Moodle (ex: moodle.oriondesign.art.br): \e[0m" && read -r url_moodle
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/10\e[0m"
    echo -en "\e[33mDigite o nome para o projeto (ex: OrionDesign): \e[0m" && read -r project_name_moodle
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/10\e[0m"
    echo -en "\e[33mDigite um Nome de Usuario (ex: oriondesign): \e[0m" && read -r user_moodle
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite uma Senha para o Usuario (ex: @Senha123_): \e[0m" && read -r pass_moodle
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 5/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$"
    echo -en "\e[33mDigite um Email para o Usuario (ex: contato@oriondesign.art.br): \e[0m" && read -r mail_moodle
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 6/10\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_moodle
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 7/10\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_smtp_moodle
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 8/10\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_smtp_moodle
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 9/10\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_moodle
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 10/10\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_moodle
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_typebot" -eq 465 ]; then
    smtp_secure_smtp_moodle=ssl
    else
    smtp_secure_smtp_moodle=tls
    fi


    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_moodle

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do moodle
    echo -e "\e[33mDominio do Moodle:\e[97m $url_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mNome do Projeto:\e[97m $project_name_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mUsuario:\e[97m $user_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mSenha:\e[97m $pass_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mEmail:\e[97m $mail_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mUsuario SMTP:\e[97m $usuario_smtp_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mHost SMTP\e[97m $host_smtp_moodle\e[0m"
    echo ""

    ## Informação sobre URL do moodle
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_moodle\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_moodle

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO MOODLE \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Moodle iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO MOODLE \e[33m[2/3]\e[0m"
echo ""
sleep 1

senha_marinadb=$(openssl rand -hex 16)
## Criando a stack
cat > moodle${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  moodle${1:+_$1}_app:
    image: bitnami/moodle:latest

    volumes:
      - moodle${1:+_$1}_app_apache_conf:/opt/bitnami/apache/conf
      - moodle${1:+_$1}_app_apache:/bitnami/apache/conf

    networks:
       - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados do projeto
      - MOODLE_SITE_NAME=$project_name_moodle

      ## Dados de acesso
      - MOODLE_HOST=$url_moodle
      - MOODLE_USERNAME=$user_moodle
      - MOODLE_PASSWORD=$pass_moodle
      - MOODLE_EMAIL=$mail_moodle

      ## Dados SMTP
      - MOODLE_SMTP_USER=$usuario_smtp_moodle
      - MOODLE_SMTP_PASSWORD=$senha_smtp_moodle
      - MOODLE_SMTP_HOST=$host_smtp_moodle
      - MOODLE_SMTP_PORT_NUMBER=$porta_smtp_moodle
      - MOODLE_SMTP_PROTOCOL=$smtp_secure_smtp_moodle ## 587 = tls ou plain | 465 = ssl

      ## Idioma
      - MOODLE_LANG=pt

      ## Dados MarinaDB
      - MOODLE_DATABASE_HOST=moodle${1:+_$1}_mariadb
      - MOODLE_DATABASE_PORT_NUMBER=3306
      - MOODLE_DATABASE_USER=orion_moodle
      - MOODLE_DATABASE_PASSWORD=$senha_marinadb
      - MOODLE_DATABASE_NAME=orionbase_moodle
      - ALLOW_EMPTY_PASSWORD=no

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.moodle${1:+_$1}.rule=Host(\`$url_moodle\`)
        - traefik.http.services.moodle${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.routers.moodle${1:+_$1}.service=moodle
        - traefik.http.routers.moodle${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.moodle${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.moodle${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

  moodle${1:+_$1}_mariadb:
    image: bitnami/mariadb:latest

    volumes:
      - moodle${1:+_$1}_mariadb_data:/bitnami/mariadb

    networks:
       - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados MarinaDB
      - MARIADB_USER=orion_moodle
      - MARIADB_ROOT_PASSWORD=$senha_marinadb
      - MARIADB_DATABASE=orionbase_moodle
      - MARIADB_PASSWORD=$senha_marinadb
      - MARIADB_CHARACTER_SET=utf8mb4
      - MARIADB_COLLATE=utf8mb4_unicode_ci
      - ALLOW_EMPTY_PASSWORD=no

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  moodle${1:+_$1}_app_apache_conf:
    external: true
    name: moodle${1:+_$1}_app_apache_conf
  moodle${1:+_$1}_app_apache:
    external: true
    name: moodle${1:+_$1}_app_apache
  moodle${1:+_$1}_mariadb_data:
    external: true
    name: moodle${1:+_$1}_mariadb_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do Moodle"
fi
STACK_NAME="moodle${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c moodle.yaml moodle > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do moodle"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "moodle" para verificar se o serviço esta online
wait_stack "moodle${1:+_$1}"
sleep 120

telemetria Moodle finalizado

cd dados_vps

cat > dados_moodle${1:+_$1} <<EOL
[ MOODLE ]

Dominio do moodle: https://$url_moodle

Usuario: $user_moodle

Senha: $pass_moodle

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ MOODLE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_moodle\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_moodle\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_moodle\e[0m"
echo ""

echo -e "\e[97mObservação:\e[33m Esta é uma ferramenta que pode demorar para iniciar na primeira vez\e[0m"
echo -e "\e[33mrecomendo aguardar alguns instantes antes de tentar abrir para não prejudicar\e[0m"
echo -e "\e[33ma sua instalação que já foi realizado.\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ████████╗ ██████╗  ██████╗ ██╗          ██╗███████╗████████╗
## ╚══██╔══╝██╔═══██╗██╔═══██╗██║          ██║██╔════╝╚══██╔══╝
##    ██║   ██║   ██║██║   ██║██║          ██║█████╗     ██║
##    ██║   ██║   ██║██║   ██║██║     ██   ██║██╔══╝     ██║
##    ██║   ╚██████╔╝╚██████╔╝███████╗╚█████╔╝███████╗   ██║
##    ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝ ╚════╝ ╚══════╝   ╚═╝

ferramenta_tooljet() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_tooljet

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para aplicação
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o Dominio para a ToolJet (ex: tooljet.oriondesign.art.br): \e[0m" && read -r url_tooljet
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_smtp_tooljet
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_smtp_tooljet
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_smtp_tooljet
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r host_smtp_tooljet
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_tooljet
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_tooljet

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL
    echo -e "\e[33mDominio da ToolJet:\e[97m $url_tooljet\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mEmail SMTP:\e[97m $email_smtp_tooljet\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mUser SMTP:\e[97m $usuario_smtp_tooljet\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mSenha SMTP:\e[97m $senha_smtp_tooljet\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mHost SMTP:\e[97m $host_smtp_tooljet\e[0m"
    echo ""

    ## Informação sobre URL
    echo -e "\e[33mPorta SMTP:\e[97m $porta_smtp_tooljet\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_tooljet

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DA TOOLJET \e[33m[1/5]\e[0m"
echo ""
sleep 1

telemetria ToolJet iniciado

## Literalmente nada, apenas um espaço vazio caso precisar de adicionar alguma coisa
## Antes..
## E claro, para aparecer a mensagem do passo..

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/5]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres Instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres

verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "tooljet${1:+_$1}_app"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "tooljet${1:+_$1}_app"
fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/5]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO A TOOLJET \e[33m[4/5]\e[0m"
echo ""
sleep 1

## Aqui de fato vamos iniciar a instalação da tooljet

## Criando uma Global Key Aleatória
master_key=$(openssl rand -hex 16)
secret_key=$(openssl rand -hex 16)
jwt_key=$(openssl rand -hex 16)

## Criando a stack tooljet.yaml
cat > tooljet${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  tooljet${1:+_$1}_app:
    image: tooljet/tooljet:ee-lts-latest
    command: npm run start:prod

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Configuração básica
      - TOOLJET_HOST=https://$url_tooljet
      - SERVE_CLIENT=true
      - PORT=80

      ## Desativar novas inscrições
      - DISABLE_SIGNUPS=false

      ## Ativar perguntas no Onboarding
      - ENABLE_ONBOARDING_QUESTIONS_FOR_ALL_SIGN_UPS=true

      ## Chaves de segurança
      - LOCKBOX_MASTER_KEY=$master_key
      - SECRET_KEY_BASE=$secret_key

      ## Configuração do banco de dados principal
      - DATABASE_URL=postgres://postgres:$senha_postgres@postgres:5432/tooljet${1:+_$1}_app?sslmode=disable

      ## Configuração do banco interno do ToolJet
      - ENABLE_TOOLJET_DB=true
      - TOOLJET_DB=tooljet${1:+_$1}
      - TOOLJET_DB_USER=postgres
      - TOOLJET_DB_HOST=postgres
      - TOOLJET_DB_PASS=$senha_postgres

      ## Configuração do PostgREST
      - PGRST_HOST=tooljet_postgrest${1:+_$1}
      - PGRST_JWT_SECRET=$jwt_key

      ## Configuração do Redis
      - REDIS_HOST=redis
      - REDIS_PORT=6379

      ## Configuração do SMTP
      - DEFAULT_FROM_EMAIL=$email_smtp_tooljet
      - SMTP_USERNAME=$usuario_smtp_tooljet
      - SMTP_PASSWORD=$senha_smtp_tooljet
      - SMTP_DOMAIN=$host_smtp_tooljet
      - SMTP_PORT=$porta_smtp_tooljet

      ## Features do ToolJet
      - COMMENT_FEATURE_ENABLE=true
      - ENABLE_MULTIPLAYER_EDITING=true
      - ENABLE_MARKETPLACE_FEATURE=true

      ## Atualizações e expiração de sessão
      - CHECK_FOR_UPDATES=false
      - USER_SESSION_EXPIRY=120

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.tooljet${1:+_$1}.rule=Host(\`$url_tooljet\`)
        - traefik.http.services.tooljet${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.tooljet${1:+_$1}.service=tooljet${1:+_$1}
        - traefik.http.routers.tooljet${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.tooljet${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.tooljet${1:+_$1}.tls=true

  ## --------------------------- ToolJet PostgREST --------------------------- ##

  tooljet${1:+_$1}_postgrest:
    image: postgrest/postgrest:v12.0.2

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - PGRST_SERVER_PORT=80
      - PGRST_DB_URI=postgres://postgres:$senha_postgres@postgres:5432/tooljet${1:+_$1}_app?sslmode=disable
      - PGRST_DB_SCHEMA=public
      - PGRST_DB_ANON_ROLE=anon
      - PGRST_JWT_SECRET=$jwt_key
      - PGRST_JWT_AUD=tooljet${1:+_$1}

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack da TOOLJET"
fi
STACK_NAME="tooljet${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c tooljet.yaml tooljet > /dev/null 2>&1

#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel subir a stack da tooljet"
#fi

sleep 10

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stack "tooljet" para verificar se o serviço esta online
wait_stack "tooljet${1:+_$1}"

telemetria ToolJet finalizado

cd dados_vps

cat > dados_tooljet${1:+_$1} <<EOL
[ TOOLJET ]

Dominio: https://$url_tooljet

Usuario: Precisa de criar no primeiro acesso ao ToolJet

Senha: Precisa de criar no primeiro acesso ao ToolJet
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ TOOLJET ]\e[0m"
echo ""

echo -e "\e[97mDominio:\e[33m https://$url_tooljet\e[0m"
echo ""

echo -e "\e[97mUsuario:\e[33m Precisa de criar no primeiro acesso ao ToolJet\e[0m"
echo ""

echo -e "\e[97mSenha:\e[33m Precisa de criar no primeiro acesso ao ToolJet\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ███████╗████████╗██╗██████╗ ██╗     ██╗███╗   ██╗ ██████╗     ██████╗ ██████╗ ███████╗
## ██╔════╝╚══██╔══╝██║██╔══██╗██║     ██║████╗  ██║██╔════╝     ██╔══██╗██╔══██╗██╔════╝
## ███████╗   ██║   ██║██████╔╝██║     ██║██╔██╗ ██║██║  ███╗    ██████╔╝██║  ██║█████╗
## ╚════██║   ██║   ██║██╔══██╗██║     ██║██║╚██╗██║██║   ██║    ██╔═══╝ ██║  ██║██╔══╝
## ███████║   ██║   ██║██║  ██║███████╗██║██║ ╚████║╚██████╔╝    ██║     ██████╔╝██║
## ╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═════╝ ╚═╝

ferramenta_stirlingpdf() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_stirlingpdf

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o Stirling PDF (ex: stirlingpdf.oriondesign.art.br): \e[0m" && read -r url_stirlingpdf
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite o nome para o App (ex: OrionPDF): \e[0m" && read -r name_stirlingpdf
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -en "\e[33mDigite uma descrição para o App (ex: Meu app de PDF): \e[0m" && read -r desc_stirlingpdf
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_stirlingpdf

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do stirlingpdf
    echo -e "\e[33mDominio do Stirling PDF:\e[97m $url_stirlingpdf\e[0m"
    echo ""

    ## Informação sobre URL do stirlingpdf
    echo -e "\e[33mNome do App:\e[97m $name_stirlingpdf\e[0m"
    echo ""

    ## Informação sobre URL do stirlingpdf
    echo -e "\e[33mDescrição do App:\e[97m $desc_stirlingpdf\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_stirlingpdf

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO STIRLING PDF \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria StirlingPDF iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO stirlingpdf \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack stirlingpdf.yaml
cat > stirlingpdf${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  stirlingpdf${1:+_$1}:
    image: frooodle/s-pdf:latest ## Versão da aplicação

    volumes:
      - stirlingpdf${1:+_$1}_data:/usr/share/tessdata
      - stirlingpdf${1:+_$1}_config:/configs
      - stirlingpdf${1:+_$1}_logs:/logs

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Liberar cadastros
      - SECURITY_ENABLELOGIN=true

      ## Branding
      - UI_APPNAME=$name_stirlingpdf
      - UI_APPNAMENAVBAR=$name_stirlingpdf
      - UI_HOMEDESCRIPTION=$desc_stirlingpdf

      ## Configurações
      - DOCKER_ENABLE_SECURITY=false
      - SYSTEM_MAXFILESIZE=100
      - LANGS=en_GB,en_US,ar_AR,de_DE,fr_FR,es_ES,zh_CN,zh_TW,ca_CA,it_IT,sv_SE,pl_PL,ro_RO,ko_KR,pt_BR,ru_RU,el_GR,hi_IN,hu_HU,tr_TR,id_ID
      - SYSTEM_DEFAULTLOCALE=BR
      - METRICS_ENABLED=true
      - SYSTEM_GOOGLEVISIBILITY=false

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.stirlingpdf${1:+_$1}.rule=Host(\`$url_stirlingpdf\`) ## Url da aplicação
        - traefik.http.services.stirlingpdf${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.routers.stirlingpdf${1:+_$1}.service=stirlingpdf${1:+_$1}
        - traefik.http.routers.stirlingpdf${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.stirlingpdf${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.stirlingpdf${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  stirlingpdf${1:+_$1}_data:
    external: true
    name: stirlingpdf${1:+_$1}_data
  stirlingpdf${1:+_$1}_config:
    external: true
    name: stirlingpdf${1:+_$1}_config
  stirlingpdf${1:+_$1}_logs:
    external: true
    name: stirlingpdf${1:+_$1}_logs

networks:
  $nome_rede_interna: ## Nome da rede interna
    external: true
    name: $nome_rede_interna ## Nome da rede interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do stirlingpdf"
fi
STACK_NAME="stirlingpdf${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c stirlingpdf.yaml stirlingpdf > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do stirlingpdf"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_stirlingpdf para verificar se o serviço esta online
wait_stack "stirlingpdf${1:+_$1}"

telemetria StirlingPDF finalizado

cd dados_vps

cat > dados_stirlingpdf${1:+_$1} <<EOL
[ STIRLING PDF ]

Dominio do stirlingpdf: https://$url_stirlingpdf

Usuario: Precisa criar no primeiro acesso do stirlingpdf

Senha: Precisa criar no primeiro acesso do stirlingpdf

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ STIRLING PDF ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_stirlingpdf\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa criar no primeiro acesso do stirlingpdf\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa criar no primeiro acesso do stirlingpdf\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

##  ██████╗██╗     ██╗ ██████╗██╗  ██╗██╗  ██╗ ██████╗ ██╗   ██╗███████╗███████╗
## ██╔════╝██║     ██║██╔════╝██║ ██╔╝██║  ██║██╔═══██╗██║   ██║██╔════╝██╔════╝
## ██║     ██║     ██║██║     █████╔╝ ███████║██║   ██║██║   ██║███████╗█████╗
## ██║     ██║     ██║██║     ██╔═██╗ ██╔══██║██║   ██║██║   ██║╚════██║██╔══╝
## ╚██████╗███████╗██║╚██████╗██║  ██╗██║  ██║╚██████╔╝╚██████╔╝███████║███████╗
##  ╚═════╝╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝

ferramenta_clickhouse() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_clickhouse

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/3\e[0m"
    echo -en "\e[33mDigite o dominio para o ClickHouse (ex: clickhouse.oriondesign.art.br): \e[0m" && read -r url_clickhouse
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/3\e[0m"
    echo -en "\e[33mDigite um nome de usuario para o ClickHouse (ex: admin): \e[0m" && read -r user_clickhouse
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/3\e[0m"
    echo -en "\e[33mDigite uma senha para o usuario (ex: @Senha123_): \e[0m" && read -r pass_clickhouse
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_clickhouse

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do clickhouse
    echo -e "\e[33mDominio do ClickHouse:\e[97m $url_clickhouse\e[0m"
    echo ""

    ## Informação sobre URL do clickhouse
    echo -e "\e[33mUsuario:\e[97m $user_clickhouse\e[0m"
    echo ""

    ## Informação sobre URL do clickhouse
    echo -e "\e[33mSenha:\e[97m $pass_clickhouse\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_clickhouse

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO CLICKHOUSE \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria ClickHouse iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO CLICKHOUSE \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack clickhouse.yaml
cat > clickhouse${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  clickhouse:${1:+_$1}
    image: clickhouse/clickhouse-server:23.8.8.20-alpine

    volumes:
      - clickhouse${1:+_$1}_data:/var/lib/clickhouse
      - clickhouse${1:+_$1}_log:/var/log/clickhouse-server

    networks:
      - $nome_rede_interna ## Nome da rede interna
    #ports:
    #  - "8123:8123"
    #  - "9000:9000"
    #  - "9009:9009"

    environment:
      - CLICKHOUSE_DB=default
      - CLICKHOUSE_USER=$user_clickhouse
      - CLICKHOUSE_PASSWORD=$pass_clickhouse

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.clickhouse${1:+_$1}.rule=Host(\`$url_clickhouse\`)
        - traefik.http.services.clickhouse${1:+_$1}.loadbalancer.server.port=8123
        - traefik.http.routers.clickhouse${1:+_$1}.service=clickhouse${1:+_$1}
        - traefik.http.routers.clickhouse${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.clickhouse${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.routers.clickhouse${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.clickhouse${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  clickhouse${1:+_$1}_data:
    external: true
    name: clickhouse${1:+_$1}_data
  clickhouse${1:+_$1}_log:
    external: true
    name: clickhouse${1:+_$1}_log

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do clickhouse"
fi
STACK_NAME="clickhouse${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c clickhouse.yaml clickhouse > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do clickhouse"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_clickhouse para verificar se o serviço esta online
wait_stack "clickhouse${1:+_$1}"

telemetria ClickHouse finalizado

cd dados_vps

cat > dados_clickhouse${1:+_$1} <<EOL
[ CLICKHOUSE ]

Dashboard do clickhouse: https://$url_clickhouse/dashboard

API do clickhouse: https://$url_clickhouse

Usuario: $user_clickhouse

Senha: $pass_clickhouse

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ CLICKHOUSE ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_clickhouse\e[0m"
echo ""

echo -e "\e[33mDashboard:\e[97m https://$url_clickhouse/dashboard\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_clickhouse\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_clickhouse\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ██████╗ ███████╗██████╗ ██╗███████╗██╗███╗   ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗
## ██╔══██╗██╔════╝██╔══██╗██║██╔════╝██║████╗  ██║██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝
## ██████╔╝█████╗  ██║  ██║██║███████╗██║██╔██╗ ██║███████╗██║██║  ███╗███████║   ██║
## ██╔══██╗██╔══╝  ██║  ██║██║╚════██║██║██║╚██╗██║╚════██║██║██║   ██║██╔══██║   ██║
## ██║  ██║███████╗██████╔╝██║███████║██║██║ ╚████║███████║██║╚██████╔╝██║  ██║   ██║
## ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝

ferramenta_redisinsight() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_redisinsight

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o RedisInsight (ex: redisinsight.oriondesign.art.br): \e[0m" && read -r url_redisinsight
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_redisinsight

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do redisinsight
    echo -e "\e[33mDominio do redisInsight:\e[97m $url_redisinsight\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_redisinsight

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO REDISINSIGHT \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria RedisInsight iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO REDISINSIGHT \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack redisinsight.yaml
cat > redisinsight${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  redisinsight${1:+_$1}:
    image: redislabs/redisinsight:latest

    volumes:
      - redisinsight${1:+_$1}_data:/db
      - redisinsight${1:+_$1}_logs:/data/logs

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      - RI_APP_PORT=5540
      - RI_APP_HOST=0.0.0.0
      - RI_ENCRYPTION_KEY=$key_redisinsight
      - RI_LOG_LEVEL=info
      - RI_FILES_LOGGER=false
      - RI_STDOUT_LOGGER=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.redisinsight${1:+_$1}.rule=Host(\`$url_redisinsight\`) ## Dominio do RedisInsight
        - traefik.http.services.redisinsight${1:+_$1}.loadbalancer.server.port=5540
        - traefik.http.routers.redisinsight${1:+_$1}.service=redisinsight${1:+_$1}
        - traefik.http.routers.redisinsight${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.redisinsight${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.redisinsight${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  redisinsight${1:+_$1}_data:
    external: true
    name: redisinsight${1:+_$1}_data
  redisinsight${1:+_$1}_logs:
    external: true
    name: redisinsight${1:+_$1}_logs

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do RedisInsight"
fi
STACK_NAME="redisinsight${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c redisinsight.yaml redisinsight > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do redisinsight"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/5]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_redisinsight para verificar se o serviço esta online
wait_stack "redisinsight${1:+_$1}"

telemetria RedisInsight finalizado

cd dados_vps

cat > dados_redisinsight${1:+_$1} <<EOL
[ REDISINSIGHT ]

Dominio do redisInsight: https://$url_redisinsight

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ REDISINSIGHT ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_redisinsight\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa de criar no primeiro acesso do RedisInsight\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar no primeiro acesso do RedisInsight\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ████████╗██████╗  █████╗  ██████╗ ██████╗ █████╗ ██████╗
## ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗
##    ██║   ██████╔╝███████║██║     ██║     ███████║██████╔╝
##    ██║   ██╔══██╗██╔══██║██║     ██║     ██╔══██║██╔══██╗
##    ██║   ██║  ██║██║  ██║╚██████╗╚██████╗██║  ██║██║  ██║
##    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝

ferramenta_traccar() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_traccar

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Traccar (ex: traccar.oriondesign.art.br): \e[0m" && read -r url_traccar
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_traccar

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do traccar
    echo -e "\e[33mDominio do Traccar:\e[97m $url_traccar\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_traccar

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO TRACCAR \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria Traccar iniciado

#cd
#cd
#cd /root
#mkdir traccar${1:+_$1}_data
#cd traccar${1:+_$1}_data
#mkdir _data
#cd _data
#mkdir conf logs data
#cd conf
#OUTPUT_FILE="/root/traccar${1:+_$1}_data/_data/conf/traccar.xml"
#gerar_senha_mysql=$(openssl rand -hex 16)
#cat <<EOF > "$OUTPUT_FILE"
#<?xml version="1.0" encoding="UTF-8"?>
#<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
#<properties>
#  <entry key="database.driver">com.mysql.cj.jdbc.Driver</entry>
#  <entry key="database.url">jdbc:mysql://traccar_db:3306/traccar</entry>
#  <entry key="database.user">traccar</entry>
#  <entry key="database.password">$gerar_senha_mysql</entry>
#</properties>
#EOF
#cd
#cd

docker pull traccar/traccar:latest > /dev/null 2>&1

mkdir -p /opt/traccar${1:+_$1}/logs

docker run \
--rm \
--entrypoint cat \
traccar/traccar:latest \
/opt/traccar${1:+_$1}/conf/traccar.xml > /opt/traccar/traccar.xml


## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO TRACCAR \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack traccar.yaml
cat > traccar${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  traccar${1:+_$1}:
    image: traccar/traccar:latest

    volumes:
      - /opt/traccar/logs:/opt/traccar${1:+_$1}/logs:rw
      - /opt/traccar/traccar.xml:/opt/traccar${1:+_$1}/conf/traccar.xml:ro
      - traccar${1:+_$1}_data:/opt/traccar/

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
     - JAVA_OPTS=-Xms1g -Xmx1g -Djava.net.preferIPv4Stack=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.traccar${1:+_$1}.rule=Host(\`$url_traccar\`)
        - traefik.http.services.traccar${1:+_$1}.loadbalancer.server.port=8082
        - traefik.http.routers.traccar${1:+_$1}.service=traccar${1:+_$1}
        - traefik.http.routers.traccar${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.traccar${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.traccar${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

  traccar${1:+_$1}_db:
    image: mysql:8.0

    volumes:
      - traccar${1:+_$1}_db:/var/lib/mysql

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=traccar
      - MYSQL_USER=traccar
      - MYSQL_PASSWORD=$gerar_senha_mysql

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

volumes:
  traccar${1:+_$1}_data:
    external: true
    name: traccar${1:+_$1}_data
  traccar${1:+_$1}_db:
    external: true
    name: traccar${1:+_$1}_db

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do traccar"
fi
STACK_NAME="traccar${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c traccar.yaml traccar > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do traccar"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_traccar para verificar se o serviço esta online
wait_stack "traccar${1:+_$1}"

telemetria Traccar finalizado

cd dados_vps

cat > dados_traccar${1:+_$1} <<EOL
[ TRACCAR ]

Dominio do Traccar: https://$url_traccar

EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ TRACCAR ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_traccar\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m Precisa de criar no primeiro acesso do traccar\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m Precisa de criar no primeiro acesso do traccar\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ███████╗██╗██████╗ ███████╗ ██████╗██████╗  █████╗ ██╗    ██╗██╗
## ██╔════╝██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║    ██║██║
## █████╗  ██║██████╔╝█████╗  ██║     ██████╔╝███████║██║ █╗ ██║██║
## ██╔══╝  ██║██╔══██╗██╔══╝  ██║     ██╔══██╗██╔══██║██║███╗██║██║
## ██║     ██║██║  ██║███████╗╚██████╗██║  ██║██║  ██║╚███╔███╔╝███████╗
## ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝

ferramenta_firecrawl() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_firecrawl

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/2\e[0m"
    echo -en "\e[33mDigite o dominio para o Firecrawl (ex: firecrawl.oriondesign.art.br): \e[0m" && read -r url_firecrawl
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/2\e[0m"
    echo -en "\e[33mDigite uma ApiKey da OpenAI: \e[0m" && read -r api_firecrawl
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_firecrawl

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do firecrawl
    echo -e "\e[33mDominio do Firecrawl:\e[97m $url_firecrawl\e[0m"
    echo ""

    ## Informação sobre URL do firecrawl
    echo -e "\e[33mApiKey OpenAi:\e[97m $api_firecrawl\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_firecrawl

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO FIRECRAWL \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Firecrawl iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO FIRECRAWL \e[33m[3/4]\e[0m"
echo ""
sleep 1

apikey_firecrawl="fc-$(cat /dev/urandom | tr -dc 'a-f0-9' | head -c 32)"
## Criando a stack firecrawl.yaml
cat > firecrawl${1:+_$1}.yaml <<EOL
version: "3.8"
services:

## --------------------------- ORION --------------------------- ##

  firecrawl${1:+_$1}_api:
    image: oriondesign/firecrawl-api:latest
    command: [ "pnpm", "run", "start:production" ]

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Credencial
      - FIRECRAWL_API_KEY=$apikey_firecrawl

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379
      - REDIS_RATE_LIMIT_URL=redis://redis:6379

      ## Dados da OpenAI
      - OPENAI_API_KEY=$api_firecrawl
      - OPENAI_BASE_URL=https://api.openai.com/v1
      - MODEL_NAME=gpt-4o

      # Dados do ScrapingBee
      - SCRAPING_BEE_API_KEY=
      - HOST=0.0.0.0

      # Dados do Webhook e Debug
      - SELF_HOSTED_WEBHOOK_URL=
      - LOGGING_LEVEL=DEBUG

      ## Dados do Supabase
      - USE_DB_AUTHENTICATION=false
      #- SUPABASE_URL=
      #- SUPABASE_ANON_TOKEN=
      #- SUPABASE_SERVICE_TOKEN=

      ## Outras configurações
      - PORT=3002
      - NUM_WORKERS_PER_QUEUE=8
      - FLY_PROCESS_GROUP=app
      - PLAYWRIGHT_MICROSERVICE_URL=http://firecrawl${1:+_$1}_playwright:3000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.firecrawl${1:+_$1}_api.rule=Host(\`$url_firecrawl\`)
        - traefik.http.services.firecrawl${1:+_$1}_api.loadbalancer.server.port=3002
        - traefik.http.routers.firecrawl${1:+_$1}_api.service=firecrawl${1:+_$1}_api
        - traefik.http.routers.firecrawl${1:+_$1}_api.tls.certresolver=letsencryptresolver
        - traefik.http.routers.firecrawl${1:+_$1}_api.entrypoints=websecure
        - traefik.http.routers.firecrawl${1:+_$1}_api.tls=true

## --------------------------- ORION --------------------------- ##

  firecrawl${1:+_$1}_worker:
    image: oriondesign/firecrawl-api:latest
    command: [ "pnpm", "run", "workers" ]

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Credencial
      - FIRECRAWL_API_KEY=$apikey_firecrawl

      ## Dados do Redis
      - REDIS_URL=redis://redis:6379
      - REDIS_RATE_LIMIT_URL=redis://redis:6379

      ## Dados da OpenAI
      - OPENAI_API_KEY=$api_firecrawl
      - OPENAI_BASE_URL=https://api.openai.com/v1
      - MODEL_NAME=gpt-4o

      # Dados do ScrapingBee
      - SCRAPING_BEE_API_KEY=
      - HOST=0.0.0.0

      # Dados do Webhook e Debug
      - SELF_HOSTED_WEBHOOK_URL=
      - LOGGING_LEVEL=DEBUG

      ## Dados do Supabase
      - USE_DB_AUTHENTICATION=false
      #- SUPABASE_URL=
      #- SUPABASE_ANON_TOKEN=
      #- SUPABASE_SERVICE_TOKEN=

      ## Outras configurações
      - PORT=3002
      - NUM_WORKERS_PER_QUEUE=8
      - FLY_PROCESS_GROUP=worker
      - PLAYWRIGHT_MICROSERVICE_URL=http://firecrawl${1:+_$1}_playwright:3000

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

  firecrawl${1:+_$1}_playwright:
    image: oriondesign/firecrawl-playwright-service:latest

    networks:
     - $nome_rede_interna ## Nome da rede interna

    environment:
      - PORT=3000
      - PROXY_SERVER=http://proxy-server.com:3128
      - PROXY_USERNAME=admin
      - PROXY_PASSWORD=admin
      - BLOCK_MEDIA=true

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M

## --------------------------- ORION --------------------------- ##

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do firecrawl"
fi
STACK_NAME="firecrawl${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c firecrawl.yaml firecrawl > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do firecrawl"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_firecrawl para verificar se o serviço esta online
wait_stack "firecrawl${1:+_$1}"

telemetria Firecrawl finalizado

cd dados_vps

cat > dados_firecrawl${1:+_$1} <<EOL
[ FIRECRAWL ]

Dominio do firecrawl: https://$url_firecrawl

API Key: $apikey_firecrawl
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ FIRECRAWL ]\e[0m"
echo ""

echo -e "\e[33mDominio da API:\e[97m https://$url_firecrawl\e[0m"
echo ""

echo -e "\e[33mAPI Key:\e[97m $apikey_firecrawl\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ██╗    ██╗██╗   ██╗███████╗ █████╗ ██████╗ ██╗
## ██║    ██║██║   ██║╚══███╔╝██╔══██╗██╔══██╗██║
## ██║ █╗ ██║██║   ██║  ███╔╝ ███████║██████╔╝██║
## ██║███╗██║██║   ██║ ███╔╝  ██╔══██║██╔═══╝ ██║
## ╚███╔███╔╝╚██████╔╝███████╗██║  ██║██║     ██║
##  ╚══╝╚══╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_wuzapi() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_wuzapi

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/1\e[0m"
    echo -en "\e[33mDigite o dominio para o Wuzapi (ex: wuzapi.oriondesign.art.br): \e[0m" && read -r url_wuzapi
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_wuzapi

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do wuzapi
    echo -e "\e[33mDominio do wuzapi:\e[97m $url_wuzapi\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_wuzapi

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO WUZAPI \e[33m[1/4]\e[0m"
echo ""
sleep 1

telemetria Wuzapi iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO POSTGRES \e[33m[2/4]\e[0m"
echo ""
sleep 1

## Aqui vamos fazer uma verificação se já existe Postgres e redis instalado
## Se tiver ele vai criar um banco de dados no postgres ou perguntar se deseja apagar o que já existe e criar outro

## Verifica container postgres e cria banco no postgres
verificar_container_postgres
if [ $? -eq 0 ]; then
    echo "1/3 - [ OK ] - Postgres já instalado"
    pegar_senha_postgres > /dev/null 2>&1
    echo "2/3 - [ OK ] - Copiando senha do Postgres"
    criar_banco_postgres_da_stack "wuzapi${1:+_$1}"
    echo "3/3 - [ OK ] - Criando banco de dados"
    echo ""
else
    ferramenta_postgres
    pegar_senha_postgres > /dev/null 2>&1
    criar_banco_postgres_da_stack "wuzapi${1:+_$1}"
fi

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO WUZAPI \e[33m[3/4]\e[0m"
echo ""
sleep 1

apikey_wuzapi=$(openssl rand -hex 16)
encryption_key=$(openssl rand -hex 16)
## Criando a stack wuzapi.yaml
cat > wuzapi${1:+_$1}.yaml <<EOL
version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

 wuzapi${1:+_$1}:
  image: setupautomatizado/wuzapi-server:latest

  volumes:
    - wuzapi${1:+_$1}_dbdata:/app/dbdata
    - wuzapi${1:+_$1}_files:/app/files

  networks:
    - $nome_rede_interna ## Nome da rede interna

  environment:
    ## Credencial
    - WUZAPI_ADMIN_TOKEN=$apikey_wuzapi
    - SECRET_KEY=$encryption_key

    ## Dados do postgres
    - DB_HOST=postgres
    - DB_USER=postgres
    - DB_PASSWORD=$senha_postgres
    - DB_NAME=wuzapi${1:+_$1}
    - DB_PORT=5432
    - DB_DRIVER=postgres

  deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.wuzapi${1:+_$1}.rule=Host(\`$url_wuzapi\`)
        - traefik.http.services.wuzapi${1:+_$1}.loadbalancer.server.port=8080
        - traefik.http.routers.wuzapi${1:+_$1}.service=wuzapi${1:+_$1}
        - traefik.http.routers.wuzapi${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.wuzapi${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.wuzapi${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  wuzapi${1:+_$1}_dbdata:
    external: true
    name: wuzapi${1:+_$1}_dbdata
  wuzapi${1:+_$1}_files:
    external: true
    name: wuzapi${1:+_$1}_files

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do wuzapi"
fi
STACK_NAME="wuzapi${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c wuzapi.yaml wuzapi > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do wuzapi"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[4/4]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_wuzapi para verificar se o serviço esta online
wait_stack "wuzapi${1:+_$1}"

telemetria Wuzapi finalizado

cd dados_vps

cat > dados_wuzapi${1:+_$1} <<EOL
[ WUZAPI ]

Dominio do wuzapi: https://$url_wuzapi

Apikey: $apikey_wuzapi
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ WUZAPI ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_wuzapi\e[0m"
echo ""

echo -e "\e[33mDocumentação:\e[97m https://$url_wuzapi/api\e[0m"
echo ""

echo -e "\e[33mAPI Key:\e[97m $apikey_wuzapi\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ██╗  ██╗██████╗  █████╗ ██╗   ██╗██╗███╗   ██╗     ██████╗██████╗ ███╗   ███╗
## ██║ ██╔╝██╔══██╗██╔══██╗╚██╗ ██╔╝██║████╗  ██║    ██╔════╝██╔══██╗████╗ ████║
## █████╔╝ ██████╔╝███████║ ╚████╔╝ ██║██╔██╗ ██║    ██║     ██████╔╝██╔████╔██║
## ██╔═██╗ ██╔══██╗██╔══██║  ╚██╔╝  ██║██║╚██╗██║    ██║     ██╔══██╗██║╚██╔╝██║
## ██║  ██╗██║  ██║██║  ██║   ██║   ██║██║ ╚████║    ╚██████╗██║  ██║██║ ╚═╝ ██║
## ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝

ferramenta_krayincrm() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_krayincrm

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/6\e[0m"
    echo -en "\e[33mDigite o dominio para o Krayin CRM (ex: krayincrm.oriondesign.art.br): \e[0m" && read -r url_krayincrm
    echo ""

    ##Pergunta o Email SMTP
    echo -e "\e[97mPasso$amarelo 2/6\e[0m"
    echo -en "\e[33mDigite o Email para SMTP (ex: contato@oriondesign.art.br): \e[0m" && read -r email_krayincrm
    echo ""

    ##Pergunta o usuário do Email SMTP
    echo -e "\e[97mPasso$amarelo 3/6\e[0m"
    echo -e "$amarelo--> Caso não tiver um usuario do email, use o proprio email abaixo"
    echo -en "\e[33mDigite o Usuário para SMTP (ex: oriondesign ou contato@oriondesign.art.br): \e[0m" && read -r usuario_email_krayincrm
    echo ""

    ## Pergunta a senha do SMTP
    echo -e "\e[97mPasso$amarelo 4/6\e[0m"
    echo -e "$amarelo--> Sem caracteres especiais: \!#$ | Se estiver usando gmail use a senha de app"
    echo -en "\e[33mDigite a Senha SMTP do Email (ex: @Senha123_): \e[0m" && read -r senha_email_krayincrm
    echo ""

    ## Pergunta o Host SMTP do email
    echo -e "\e[97mPasso$amarelo 5/6\e[0m"
    echo -en "\e[33mDigite o Host SMTP do Email (ex: smtp.hostinger.com): \e[0m" && read -r smtp_email_krayincrm
    echo ""

    ## Pergunta a porta SMTP do email
    echo -e "\e[97mPasso$amarelo 6/6\e[0m"
    echo -en "\e[33mDigite a porta SMTP do Email (ex: 465): \e[0m" && read -r porta_smtp_krayincrm
    echo ""

    ## Verifica se a porta é 465, se sim deixa o ssl true, se não, deixa false
    if [ "$porta_smtp_krayincrm" -eq 465 ]; then
    smtp_secure_krayincrm=ssl
    else
    smtp_secure_krayincrm=tls
    fi

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_krayincrm

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do krayincrm
    echo -e "\e[33mDominio do krayincrm:\e[97m $url_krayincrm\e[0m"
    echo ""

     ## Informação sobre Email
    echo -e "\e[33mEmail do SMTP:\e[97m $email_krayincrm\e[0m"
    echo ""

    ## Informação sobre Email
    echo -e "\e[33mUsuário do SMTP:\e[97m $usuario_email_krayincrm\e[0m"
    echo ""

    ## Informação sobre Senha do Email
    echo -e "\e[33mSenha do Email:\e[97m $senha_email_krayincrm\e[0m"
    echo ""

    ## Informação sobre Host SMTP
    echo -e "\e[33mHost SMTP do Email:\e[97m $smtp_email_krayincrm\e[0m"
    echo ""

    ## Informação sobre Porta SMTP
    echo -e "\e[33mPorta SMTP do Email:\e[97m $porta_smtp_krayincrm\e[0m"
    echo ""

    ## Informação sobre Secure SMTP
    echo -e "\e[33mSecure SMTP do Email:\e[97m $smtp_secure_krayincrm\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_krayincrm

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO KRAYIN CRM \e[33m[1/6]\e[0m"
echo ""
sleep 1

telemetria "Krayin CRM" "iniciado"

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO MYSQL \e[33m[2/6]\e[0m"
echo ""
sleep 1

dados

## Cria banco de dados do site no mysql
verificar_container_mysql
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - MySQL já instalado"
        pegar_senha_mysql > /dev/null 2>&1
        echo "2/3 - [ OK ] - Copiando senha do MySQL"
        criar_banco_mysql_da_stack "krayin${1:+_$1}"
        echo "3/3 - [ OK ] - Criando banco de dados"
    else
        ferramenta_mysql
        pegar_senha_mysql > /dev/null 2>&1
        criar_banco_mysql_da_stack "krayin${1:+_$1}"
    fi

sleep 5

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO/INSTALANDO REDIS \e[33m[3/6]\e[0m"
echo ""
sleep 1

## Verifica/instala o Redis
verificar_container_redis
if [ $? -eq 0 ]; then
    echo "1/1 - [ OK ] - Redis já instalado"
    echo ""
else
    ferramenta_redis
fi

# Criação do banco de dados
#docker exec -it "$(docker ps --filter "name=^mysql_mysql" -q)" mysql -u root -p"$senha_mysql" -e "CREATE DATABASE krayin${1:+_$1} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "1/4 - [ OK ] - Criação do banco de dados"
#else
#    echo "1/10 - [ OFF ] - Criação do banco de dados"
#fi
#
## Criação do usuário
#docker exec -it "$(docker ps --filter "name=^mysql_mysql" -q)" mysql -u root -p"$senha_mysql" -e "CREATE USER 'orion'@'%' IDENTIFIED BY 'design';" > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/4 - [ OK ] - Criação do usuário"
#else
#    echo "2/4 - [ OFF ] - Criação do usuário"
#fi
## Concessão de privilégios ao usuário
#docker exec -it "$(docker ps --filter "name=^mysql_mysql" -q)" mysql -u root -p"$senha_mysql" -e "GRANT ALL PRIVILEGES ON krayin${1:+_$1}.* TO 'orion'@'%';" > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "3/4 - [ OK ] - Concessão de privilégios ao usuário"
#else
#    echo "3/4 - [ OFF ] - Concessão de privilégios ao usuário"
#fi
## Atualização dos privilégios
#docker exec -it "$(docker ps --filter "name=^mysql_mysql" -q)" mysql -u root -p"$senha_mysql" -e "FLUSH PRIVILEGES;" > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "4/4 - [ OK ] - Atualização dos privilégios"
#else
#    echo "4/4 - [ OFF ] - Atualização dos privilégios"
#fi
#sleep 5


## Mensagem de Passo
echo -e "\e[97m• INSTALANDO KRAYIN CRM \e[33m[4/6]\e[0m"
echo ""
sleep 1

secret_key="base64:$(openssl rand -base64 32)"
## Criando a stack krayincrm.yaml
cat > krayincrm${1:+_$1}.yaml <<EOL
version: "3.7"
services:

  ## --------------------------- ORION --------------------------- ##

  krayin${1:+_$1}:
    image: webkul/krayin:2.0.4

    volumes:
      - krayin${1:+_$1}_data:/var/www/html/laravel-crm

    networks:
      - $nome_rede_interna ## Nome da rede interna

    environment:
      ## Dados de acesso
      - krayin_PUBLIC_URL=https://$url_krayincrm
      - APP_URL=https://$url_krayincrm
      - krayin_CADDY_ADDRESSES=:80
      - APP_ENV=production
      - APP_KEY=$secret_key
      - APP_DEBUG=false
      - APP_TIMEZONE=America/Sao_Paulo
      - APP_LOCALE=pt_BR
      - APP_CURRENCY=BRL
      - SANCTUM_STATEFUL_DOMAINS=https://$url_krayincrm/public

      ## Configuração do Banco de Dados
      - DB_CONNECTION=mysql
      - DB_HOST=mysql
      - DB_PORT=3306
      - DB_DATABASE=krayin${1:+_$1}
      - DB_USERNAME=root
      - DB_PASSWORD=$senha_mysql
      - DB_PREFIX=

      ## Configurações de e-mail
      - MAIL_MAILER=smtp
      - MAIL_FROM_ADDRESS=$email_krayincrm ## mude
      - MAIL_USERNAME=$usuario_email_krayincrm ## mude
      - MAIL_PASSWORD=$senha_email_krayincrm ## mude
      - MAIL_HOST=$smtp_email_krayincrm ## mude
      - MAIL_PORT=$porta_smtp_krayincrm ## mude
      - MAIL_ENCRYPTION=$smtp_secure_krayincrm
      - MAIL_FROM_NAME="OrionCRM" ## mude

      ## Configurações de Cache e Sessão
      - CACHE_DRIVER=file
      - SESSION_DRIVER=file
      - SESSION_LIFETIME=120

      ## Configurações de Redis
      - REDIS_HOST=redis
      - REDIS_PASSWORD=null
      - REDIS_PORT=6379

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "2"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.krayin${1:+_$1}.rule=Host(\`$url_krayincrm\`) && PathPrefix(\`/\`) ## Url do Krayin
        - traefik.http.services.krayin${1:+_$1}.loadbalancer.server.port=80
        - traefik.http.routers.krayin${1:+_$1}.service=krayin${1:+_$1}
        - traefik.http.routers.krayin${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.routers.krayin${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.krayin${1:+_$1}.tls=true

## --------------------------- ORION --------------------------- ##

volumes:
  krayin${1:+_$1}_data:
    external: true
    name: krayin${1:+_$1}_data

networks:
  $nome_rede_interna: ## Nome da rede interna
    name: $nome_rede_interna ## Nome da rede interna
    external: true
EOL
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do krayincrm"
fi
STACK_NAME="krayincrm${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c krayincrm.yaml krayincrm > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do krayincrm"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[5/6]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_krayincrm para verificar se o serviço esta online
wait_stack "krayincrm${1:+_$1}"

## Mensagem de Passo
echo -e "\e[97m• APLICANDO CONFIGURAÇÕES \e[33m[6/6]\e[0m"
echo ""
sleep 1

## Executa o comando artisan krayin-crm:install
docker exec -it -e APP_NAME="Krayin CRM" -e APP_URL="https://$url_krayincrm" -e APP_TIMEZONE="America/Sao_Paulo" -e APP_LOCALE="pt_BR" -e APP_CURRENCY="BRL" -e DB_CONNECTION="mysql" -e DB_HOST="mysql" -e DB_PORT="3306" -e DB_DATABASE="krayin${1:+_$1}" -e DB_USERNAME="root" -e DB_PASSWORD="$senha_mysql" "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /var/www/html/laravel-crm/artisan krayin-crm:install --no-interaction > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Executando: artisan krayin-crm:install"
else
    echo "1/10 - [ OFF ] - Executando: artisan krayin-crm:install"
fi

sleep 5

## Cria o arquivo AppServiceProvider.php
cat > AppServiceProvider.php <<EOL
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (config("app.env") !== "local") { // Força HTTPS em ambientes que não sejam "local"
            URL::forceScheme("https");
        }
    }
}
EOL

## Remove o arquivo AppServiceProvider.php errado do dir
rm /var/lib/docker/volumes/krayin${1:+_$1}_data/_data/app/Providers/AppServiceProvider.php
if [ $? -eq 0 ]; then
    echo "2/10 - [ OK ] - Removendo AppServiceProvider"
else
    echo "2/10 - [ OFF ] - Removendo AppServiceProvider"
fi

## Move o arquivo AppServiceProvider.php certo para o dir correspondente
mv AppServiceProvider.php /var/lib/docker/volumes/krayin${1:+_$1}_data/_data/app/Providers/AppServiceProvider.php
if [ $? -eq 0 ]; then
    echo "3/10 - [ OK ] - Adicionando novo AppServiceProvider"
else
    echo "3/10 - [ OFF ] - Adicionando novo AppServiceProvider"
fi
sleep 5

docker exec -it "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /var/www/html/laravel-crm/artisan migrate --force > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "4/10 - [ OK ] - Forçando Migração"
else
    echo "4/10 - [ OFF ] - Forçando Migração"
fi

#docker exec -it "$(docker ps --filter 'name=krayincrm_krayin' -q)" php /var/www/html/laravel-crm/artisan migrate --seed --force > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "1/10 - [ OK ] - Forçando Migração"
#else
#    echo "1/10 - [ OFF ] - Forçando Migração"
#fi

## Adicionado a linha SANCTUM_STATEFUL_DOMAINS
echo "SANCTUM_STATEFUL_DOMAINS=https://$url_krayincrm/public" >> \
  /var/lib/docker/volumes/krayin${1:+_$1}_data/_data/.env

# Altera DB_CONNECTION
sed -i 's/^DB_CONNECTION=.*/DB_CONNECTION=mysql/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_HOST
sed -i 's/^DB_HOST=.*/DB_HOST=mysql/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_PORT
sed -i 's/^DB_PORT=.*/DB_PORT=3306/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_DATABASE
sed -i "s/^DB_DATABASE=.*/DB_DATABASE=krayin${1:+_$1}/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_USERNAME
sed -i 's/^DB_USERNAME=.*/DB_USERNAME=root/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_PASSWORD
sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=$senha_mysql/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera DB_PREFIX
sed -i 's/^DB_PREFIX=.*/DB_PREFIX=/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera REDIS_HOST
sed -i 's/^REDIS_HOST=.*/REDIS_HOST=redis/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera REDIS_PASSWORD
sed -i 's/^REDIS_PASSWORD=.*/REDIS_PASSWORD=/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera REDIS_PORT
sed -i 's/^REDIS_PORT=.*/REDIS_PORT=6379/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_MAILER
sed -i 's/^MAIL_MAILER=.*/MAIL_MAILER=smtp/' /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_FROM_ADDRESS
sed -i "s/^MAIL_FROM_ADDRESS=.*/MAIL_FROM_ADDRESS=$email_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_USERNAME
sed -i "s/^MAIL_USERNAME=.*/MAIL_USERNAME=$usuario_email_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_PASSWORD
sed -i "s/^MAIL_PASSWORD=.*/MAIL_PASSWORD=$senha_email_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_HOST
sed -i "s/^MAIL_HOST=.*/MAIL_HOST=$smtp_email_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_PORT
sed -i "s/^MAIL_PORT=.*/MAIL_PORT=$porta_smtp_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_ENCRYPTION
sed -i "s/^MAIL_ENCRYPTION=.*/MAIL_ENCRYPTION=$smtp_secure_krayincrm/" /var/lib/docker/volumes/krayin_data/_data/.env

# Altera MAIL_FROM_NAME
sed -i 's/^MAIL_FROM_NAME=.*/MAIL_FROM_NAME="Krayin CRM"/' /var/lib/docker/volumes/krayin_data/_data/.env

if [ $? -eq 0 ]; then
    echo "5/10 - [ OK ] - Preenchendo arquivo .env do Krayin CRM"
else
    echo "5/10 - [ OFF ] - Preenchendo arquivo .env do Krayin CRM"
fi

docker exec $(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q) php /var/www/html/laravel-crm/artisan krayin-crm:install > /dev/null 2>&1

## Ativando API
docker exec -it "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /usr/local/bin/composer require krayin/rest-api --working-dir=/var/www/html/laravel-crm > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "6/10 - [ OK ] - Instalando API"
else
    echo "6/10 - [ OFF ] - Instalando API"
fi

## Ativando API
docker exec -it --workdir /var/www/html/laravel-crm "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php artisan krayin-rest-api:install > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "7/10 - [ OK ] - Ativando API"
else
    echo "7/10 - [ OFF ] - Ativando API"
fi

## Ativando API
wget -O /var/lib/docker/volumes/krayin${1:+_$1}_data/_data/packages/Webkul/Admin/src/Resources/lang/en/app.php https://raw.githubusercontent.com/oriondesign2015/SetupOrion/refs/heads/main/Extras/Krayin/app.php > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "8/10 - [ OK ] - Baixando Tradução"
else
    echo "8/10 - [ OFF ] - Baixando Tradução"
fi

#docker service update --force krayincrm${1:+_$1}_krayin > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "9/10 - [ OK ] - Aplicando Tradução"
#else
#    echo "9/10 - [ OFF ] - Aplicando Tradução"
#fi
#sleep 30

## Limpando Cache
docker exec -it "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /var/www/html/laravel-crm/artisan config:clear > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "9/10 - [ OK ] - Limpando Cache"
else
    echo "10/10 - [ OFF ] - Limpando Cache"
fi

## Criando arquivo de cache
docker exec -it "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /var/www/html/laravel-crm/artisan config:cache > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "10/10 - [ OK ] - Criando novo arquivo de Cache"
else
    echo "10/10 - [ OFF ] - Criando novo arquivo de Cache"
fi

telemetria "Krayin CRM" "finalizado"

cd dados_vps

cat > dados_krayincrm${1:+_$1} <<EOL
[ KRAYIN CRM ]

Dominio do Krayin CRM: https://$url_krayincrm

Usuario: admin@example.com

Senha: admin123

Documentação: https://$url_krayincrm/api/documentation
EOL

cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ KRAYIN CRM ]\e[0m"
echo ""

echo -e "\e[33mDominio:\e[97m https://$url_krayincrm\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m admin@example.com\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m admin123\e[0m"
echo ""

echo -e "\e[33mDocumentação:\e[97m https://$url_krayincrm/api/documentation\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao

}

## ████████╗██████╗  █████╗ ███╗   ██╗███████╗ ██████╗██████╗ ███████╗██╗   ██╗███████╗
## ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔════╝██║   ██║██╔════╝
##    ██║   ██████╔╝███████║██╔██╗ ██║███████╗██║     ██████╔╝█████╗  ██║   ██║█████╗
##    ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██║     ██╔══██╗██╔══╝  ╚██╗ ██╔╝██╔══╝
##    ██║   ██║  ██║██║  ██║██║ ╚████║███████║╚██████╗██║  ██║███████╗ ╚████╔╝ ███████╗
##    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚══════╝
##
##                                ███████╗ █████╗ ██████╗
##                                ╚══███╔╝██╔══██╗██╔══██╗
##                                  ███╔╝ ███████║██████╔╝
##                                 ███╔╝  ██╔══██║██╔═══╝
##                                ███████╗██║  ██║██║
##                                ╚══════╝╚═╝  ╚═╝╚═╝

ferramenta_transcrevezap() {

## Limpa o terminal
clear

## Ativa a função dados para pegar os dados da vps
dados

## Mostra o nome da aplicação
nome_transcrevezap

## Mostra mensagem para preencher informações
preencha_as_info

## Inicia um Loop até os dados estarem certos
while true; do

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 1/4\e[0m"
    echo -en "\e[33mDigite o dominio para a API do TranscreveZap (ex: apitranscreve.oriondesign.art.br): \e[0m" && read -r api_transcrevezap
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 2/4\e[0m"
    echo -en "\e[33mDigite o dominio para o Manager do TranscreveZap (ex: transcrevezap.oriondesign.art.br): \e[0m" && read -r url_transcrevezap
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 3/4\e[0m"
    echo -en "\e[33mDigite um usuario para o TranscreveZap (ex: OrionDesign): \e[0m" && read -r user_transcrevezap
    echo ""

    ##Pergunta o Dominio para a ferramenta
    echo -e "\e[97mPasso$amarelo 4/4\e[0m"
    echo -en "\e[33mDigite uma senha para o TranscreveZap (ex: @Senha123_): \e[0m" && read -r pass_transcrevezap
    echo ""

    ## Limpa o terminal
    clear

    ## Mostra o nome da aplicação
    nome_transcrevezap

    ## Mostra mensagem para verificar as informações
    conferindo_as_info

    ## Informação sobre URL do transcrevezap
    echo -e "\e[33mDominio da API TranscreveZap:\e[97m $api_transcrevezap\e[0m"
    echo ""

    ## Informação sobre URL do transcrevezap
    echo -e "\e[33mDominio do Manager do TranscreveZap:\e[97m $url_transcrevezap\e[0m"
    echo ""

    ## Informação sobre URL do transcrevezap
    echo -e "\e[33mUsuario do TranscreveZap:\e[97m $user_transcrevezap\e[0m"
    echo ""

    ## Informação sobre URL do transcrevezap
    echo -e "\e[33mSenha do TranscreveZap:\e[97m $pass_transcrevezap\e[0m"
    echo ""

    ## Pergunta se as respostas estão corretas
    read -p "As respostas estão corretas? (Y/N): " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then

        ## Digitou Y para confirmar que as informações estão corretas

        ## Limpar o terminal
        clear

        ## Mostrar mensagem de Instalando
        instalando_msg

        ## Sai do Loop
        break
    else

        ## Digitou N para dizer que as informações não estão corretas.

        ## Limpar o terminal
        clear

        ## Mostra o nome da ferramenta
        nome_transcrevezap

        ## Mostra mensagem para preencher informações
        preencha_as_info

    ## Volta para o inicio do loop com as perguntas
    fi
done

## Mensagem de Passo
echo -e "\e[97m• INICIANDO A INSTALAÇÃO DO TRANSCREVEZAP \e[33m[1/3]\e[0m"
echo ""
sleep 1

telemetria TranscreveZap iniciado

## Nadaaaaa

## Mensagem de Passo
echo -e "\e[97m• INSTALANDO TRANSCREVEZAP \e[33m[2/3]\e[0m"
echo ""
sleep 1

## Criando a stack transcrevezap.yaml
cat > transcrevezap${1:+_$1}.yaml <<EOL

version: "3.7"
services:

## --------------------------- ORION --------------------------- ##

  transcrevezap${1:+_$1}:
    image: impacteai/transcrevezap:latest
    command: ./start.sh

    networks:
      - $nome_rede_interna

    environment:
      ## Configurações de acesso
      - MANAGER_USER=$user_transcrevezap
      - MANAGER_PASSWORD=$pass_transcrevezap

      ## Configurações Globais
      - API_DOMAIN=$api_transcrevezap
      - UVICORN_PORT=8005
      - UVICORN_HOST=0.0.0.0
      - UVICORN_RELOAD=true
      - UVICORN_WORKERS=1

      ## Configurações do Redis
      - REDIS_HOST=redis_transcrevezap${1:+_$1}
      - REDIS_PORT=6380

      ## Configurações de Debug
      - DEBUG_MODE=false
      - LOG_LEVEL=INFO

    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.transcrevezap${1:+_$1}.rule=Host(\`$api_transcrevezap\`) ## url do transcrevezap
        - traefik.http.routers.transcrevezap${1:+_$1}.entrypoints=websecure
        - traefik.http.routers.transcrevezap${1:+_$1}.tls.certresolver=letsencryptresolver
        - traefik.http.services.transcrevezap${1:+_$1}.loadbalancer.server.port=8005
        - traefik.http.services.transcrevezap${1:+_$1}.loadbalancer.passHostHeader=true
        - traefik.http.routers.transcrevezap${1:+_$1}.service=transcrevezap${1:+_$1}
        - traefik.http.middlewares.traefik-compress.compress=true
        - traefik.http.routers.transcrevezap${1:+_$1}.middlewares=traefik-compress
        - traefik.http.routers.transcrevezap${1:+_$1}_manager.rule=Host(\`$url_transcrevezap\`) ## url do manager do transcrevezap
        - traefik.http.routers.transcrevezap${1:+_$1}_manager.entrypoints=websecure
        - traefik.http.routers.transcrevezap${1:+_$1}_manager.tls.certresolver=letsencryptresolver
        - traefik.http.services.transcrevezap${1:+_$1}_manager.loadbalancer.server.port=8501
        - traefik.http.routers.transcrevezap${1:+_$1}_manager.service=transcrevezap${1:+_$1}_manager

## --------------------------- ORION --------------------------- ##

  redis_transcrevezap${1:+_$1}:
    image: redis:6
    command: [
        "redis-server",
        "--appendonly",
        "yes",
        "--port",
        "6380"
      ]

    volumes:
      - redis_transcrevezap${1:+_$1}_data:/data

    networks:
      - $nome_rede_interna

## --------------------------- ORION --------------------------- ##

volumes:
  redis_transcrevezap${1:+_$1}_data:
    external: true
    name: redis_transcrevezap${1:+_$1}_data

networks:
  $nome_rede_interna:
    external: true
    name: $nome_rede_interna
EOL

if [ $? -eq 0 ]; then
    echo "1/10 - [ OK ] - Criando Stack"
else
    echo "1/10 - [ OFF ] - Criando Stack"
    echo "Não foi possivel criar a stack do TranscreveZap"
fi
STACK_NAME="transcrevezap${1:+_$1}"
stack_editavel # > /dev/null 2>&1
#docker stack deploy --prune --resolve-image always -c transcrevezap.yaml transcrevezap > /dev/null 2>&1
#if [ $? -eq 0 ]; then
#    echo "2/2 - [ OK ] - Deploy Stack"
#else
#    echo "2/2 - [ OFF ] - Deploy Stack"
#    echo "Não foi possivel Subir a stack do transcrevezap"
#fi

## Mensagem de Passo
echo -e "\e[97m• VERIFICANDO SERVIÇO \e[33m[3/3]\e[0m"
echo ""
sleep 1

## Usa o serviço wait_transcrevezap para verificar se o serviço esta online
wait_stack "transcrevezap${1:+_$1}"

telemetria TranscreveZap finalizado

cd dados_vps

cat > dados_transcrevezap${1:+_$1} <<EOL
[ TRANSCREVEZAP ]

Url API do TranscreveZap: https://$api_transcrevezap

Url Manager do TranscreveZap: https://$url_transcrevezap

Usuario: $user_transcrevezap

Senha: $pass_transcrevezap
EOL
cd
cd

## Espera 30 segundos
wait_30_sec

## Mensagem de finalizado
instalado_msg

## Mensagem de Guarde os Dados
guarde_os_dados_msg

## Dados da Aplicação:
echo -e "\e[32m[ TRANSCREVEZAP ]\e[0m"
echo ""

echo -e "\e[33mLink do Manager:\e[97m https://$url_transcrevezap\e[0m"
echo ""

echo -e "\e[33mLink da API:\e[97m https://$api_transcrevezap\e[0m"
echo ""

echo -e "\e[33mUsuario:\e[97m $user_transcrevezap\e[0m"
echo ""

echo -e "\e[33mSenha:\e[97m $pass_transcrevezap\e[0m"

## Creditos do instalador
creditos_msg

## Pergunta se deseja instalar outra aplicação
requisitar_outra_instalacao
}

## Ignore esta parte, só para facilitar minha identificação com esta parte "XXOOXX"

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Comandos extras

portainer.restart() {

    echo ""
    echo "Aguarde enquanto reiniciamos o Portainer"
    echo ""
    docker service update --force $(docker service ls --filter name='portainer_agent' -q) > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "1/2 - [ OK ]"
    else
        echo "1/2 - [ OFF ]"
        echo "Não foi possivel reiniciar o portainer"
    fi
    docker service update --force $(docker service ls --filter name='portainer_portainer' -q) > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/2 - [ OK ]"
    else
        echo "2/2 - [ OFF ]"
        echo "Não foi possivel reiniciar o portainer"
    fi
    sleep 2
    clear
}

chatwoot.nulled() {

    echo ""
    echo "Aguarde..."
    echo ""
    while :; do
    if docker ps -q --filter "name=postgres" | grep -q .; then
        CONTAINER_ID=$(docker ps -q --filter "name=postgres")
        docker exec -i "$CONTAINER_ID" psql -U postgres -d chatwoot -c \
        "UPDATE public.installation_configs SET serialized_value = '\"--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue: enterprise\n\"' WHERE name = 'INSTALLATION_PRICING_PLAN'; \
        UPDATE public.installation_configs SET serialized_value = '\"--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue: 200\n\"' WHERE name = 'INSTALLATION_PRICING_PLAN_QUANTITY';"

        if [ $? -eq 0 ]; then
        echo "1/1 - [ OK ]"
        else
            echo "1/1 - [ OFF ]"
            echo "Não foi possivel fazer isso, mude através do pgadmin."
        fi

        sleep 2

        break
    else
        sleep 5
    fi
done
}

chatwoot.uno.nulled() {

    echo ""
    echo "Aguarde..."
    echo ""
    while :; do
    if docker ps -q --filter "name=postgres" | grep -q .; then
        CONTAINER_ID=$(docker ps -q --filter "name=postgres")
        docker exec -i "$CONTAINER_ID" psql -U postgres -d chatwoot_uno -c \
        "UPDATE public.installation_configs SET serialized_value = '\"--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue: enterprise\n\"' WHERE name = 'INSTALLATION_PRICING_PLAN'; \
        UPDATE public.installation_configs SET serialized_value = '\"--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue: 200\n\"' WHERE name = 'INSTALLATION_PRICING_PLAN_QUANTITY';"

        if [ $? -eq 0 ]; then
        echo "1/1 - [ OK ]"
        else
            echo "1/1 - [ OFF ]"
            echo "Não foi possivel fazer isso, mude através do pgadmin."
        fi

        sleep 2

        break
    else
        sleep 5
    fi
done
}

chatwoot.mail() {

    echo ""
    echo "Aguarde enquanto trocamos os emails..."
    echo ""

    #cd /var/lib/docker/volumes/chatwoot_mailer/_data/app/views/devise/mailer/
    cd /var/lib/docker/volumes/chatwoot_mailer/_data/

    # Renomeia os arquivos
    mv password_change.html.erb password_change.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "1/9 - [ OK ]"
    else
        echo "1/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv confirmation_instructions.html.erb confirmation_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/9 - [ OK ]"
    else
        echo "2/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv reset_password_instructions.html.erb reset_password_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "3/9 - [ OK ]"
    else
        echo "3/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv unlock_instructions.html.erb unlock_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "4/9 - [ OK ]"
    else
        echo "4/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi

    # Baixa os novos arquivos
    wget -O confirmation_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/confirmation_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "5/9 - [ OK ]"
    else
        echo "5/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O password_change.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/password_change.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "6/9 - [ OK ]"
    else
        echo "6/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O reset_password_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/reset_password_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "7/9 - [ OK ]"
    else
        echo "7/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O unlock_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/unlock_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "8/9 - [ OK ]"
    else
        echo "8/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi

    cd
    cd

    # Deleta os containers do Chatwoot
    docker rm -f $(docker ps -a | grep 'chatwoot' | awk '{print $1}') > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "9/9 - [ OK ]"
    else
        echo "9/9 - [ OFF ]"
        echo "Não foi possivel deletar containers."
    fi

    echo ""
    echo "Esperando containers subir..."
    wait_30_sec

    echo ""
    echo "Concluido!"
    sleep 2
}

chatwoot.n.mail() {

    echo ""
    echo "Aguarde enquanto trocamos os emails..."
    echo ""

    #cd /var/lib/docker/volumes/chatwoot_mailer/_data/app/views/devise/mailer/
    cd /var/lib/docker/volumes/chatwoot_nestor_mailer/_data/

    # Renomeia os arquivos
    mv password_change.html.erb password_change.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "1/9 - [ OK ]"
    else
        echo "1/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv confirmation_instructions.html.erb confirmation_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/9 - [ OK ]"
    else
        echo "2/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv reset_password_instructions.html.erb reset_password_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "3/9 - [ OK ]"
    else
        echo "3/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi
    mv unlock_instructions.html.erb unlock_instructions.html.erb.old > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "4/9 - [ OK ]"
    else
        echo "4/9 - [ OFF ]"
        echo "Não foi possivel mudar email."
    fi

    # Baixa os novos arquivos
    wget -O confirmation_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/confirmation_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "5/9 - [ OK ]"
    else
        echo "5/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O password_change.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/password_change.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "6/9 - [ OK ]"
    else
        echo "6/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O reset_password_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/reset_password_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "7/9 - [ OK ]"
    else
        echo "7/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi
    wget -O unlock_instructions.html.erb https://github.com/oriondesign2015/SetupOrion/raw/main/Extras/Chatwoot/emails/unlock_instructions.html.erb > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "8/9 - [ OK ]"
    else
        echo "8/9 - [ OFF ]"
        echo "Não foi possivel baixar email."
    fi

    cd
    cd

    # Deleta os containers do Chatwoot
    docker rm -f $(docker ps -a | grep 'chatwoot' | awk '{print $1}') > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "9/9 - [ OK ]"
    else
        echo "9/9 - [ OFF ]"
        echo "Não foi possivel deletar containers."
    fi

    echo ""
    echo "Esperando containers subir..."
    wait_30_sec

    echo ""
    echo "Concluido!"
    sleep 2
}

n8n.workflows(){
while true; do
    if docker ps -q --filter "name=n8n_quepasa_n8n_quepasa_editor" | grep -q .; then
        # Capturar o ID do container
        container_id=$(docker ps --filter "name=n8n_quepasa_n8n_quepasa_editor" --format "{{.ID}}")

        # Verificar se o ID do container foi capturado corretamente
        if [ -z "$container_id" ]; then
            echo "Erro: Não foi possível encontrar o ID do contêiner."
            exit 1
        fi

        # Executar o código no contêiner apenas se ele estiver em execução
        docker exec "$container_id" /bin/sh -c '
            # Criando diretório temporário
            temp_dir=$(mktemp -d)

            # Entrando no diretório temporário
            cd "$temp_dir"

            # Baixando workflows

            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/ChatwootExtra.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/ChatwootProfileUpdate.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/ChatwootToQuepasa.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/GetChatwootContacts.json"
	          wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/MsgRejectCall.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/PostToChatwoot.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/PostToWebCallBack.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/QuepasaAutomatic.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/QuepasaChatControl.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/QuepasaInboxControl.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/QuepasaQrcode.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/QuepasaToChatwoot.json"
            wget "https://raw.githubusercontent.com/DeividMs/QP_Setup_Orion/main/workflows/latest/ToChatwootTranscriptViaOpenAI.json"

            # Subindo workflows
            n8n import:workflow --input="$temp_dir" --separate

            # Verificando se os workflows foram importados com sucesso
            if [ $? -eq 0 ]; then
                echo "Workflows importados com sucesso"
            else
                echo "Erro ao importar workflows"
                exit 1
            fi

            # Ativando os workflows
            n8n update:workflow --id 1008 --active=true && echo "Fluxo 1008 ativado" || echo "Erro ao ativar fluxo 1008"
            n8n update:workflow --id 1009 --active=true && echo "Fluxo 1009 ativado" || echo "Erro ao ativar fluxo 1009"
            n8n update:workflow --id 1010 --active=true && echo "Fluxo 1010 ativado" || echo "Erro ao ativar fluxo 1010"
            n8n update:workflow --id 1011 --active=true && echo "Fluxo 1011 ativado" || echo "Erro ao ativar fluxo 1011"
            n8n update:workflow --id GIPTrjgdT9vuOSlN --active=true && echo "Fluxo GIPTrjgdT9vuOSlN ativado" || echo "Erro ao ativar fluxo GIPTrjgdT9vuOSlN"
        '
        break
    else
        clear
        erro_msg
        echo ""
        echo -e "Ops, parece que você não instalou a opção \e[32m[28] N8N + Nodes Quepasa${reset} ${branco}do nosso instalador.${reset}"
        echo "Instale antes de tentar instalar esta aplicação."
        echo ""
        echo "Pressione CTRL C para sair do instalador."
        sleep 5
        exit
    fi
done

}

portainer.reset() {
    cd
    clear
    nome_portainer.reset
    echo "Aguarde enquanto reseto a senha do portainer..."
    echo ""

    docker service scale portainer_portainer=0 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "1/7 - [ OK ]"
    else
        echo "1/7 - [ OFF ]"
        echo "Ops, não foi possivel derrubar o serviço do portainer"
    fi

    docker pull portainer/helper-reset-password > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/7 - [ OK ]"
    else
        echo "2/7 - [ OFF ]"
        echo "Ops, não foi possivel super o serviço de reset password do portainer"
    fi

    script -c "docker run --rm -v /var/lib/docker/volumes/portainer_data/_data:/data portainer/helper-reset-password" output.txt > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "3/7 - [ OK ]"
    else
        echo "3/7 - [ OFF ]"
        echo "Ops, não foi possivel resetar a senha do portainer"
    fi

    cd
    #STACK_NAME="portainer"
    #stack_editavel > /dev/null 2>&1
    docker stack deploy --prune --resolve-image always -c portainer.yaml portainer > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "4/7 - [ OK ]"
    else
        echo "4/7 - [ OFF ]"
        echo "Ops, não foi possivel subir a stack do portainer"
    fi

    USER=$(grep -oP 'user: \K[^,]*' output.txt)
    if [ $? -eq 0 ]; then
        echo "5/7 - [ OK ]"
    else
        echo "5/7 - [ OFF ]"
        echo "Ops, não foi possivel pegar o usuario do portainer"
    fi

    PASSWORD=$(grep -oP 'login: \K.*' output.txt)
    if [ $? -eq 0 ]; then
        echo "6/7 - [ OK ]"
    else
        echo "6/7 - [ OFF ]"
        echo "Ops, não foi possivel pegar a senha do portainer"
    fi

    rm output.txt
    if [ $? -eq 0 ]; then
        echo "7/7 - [ OK ]"
    else
        echo "7/7 - [ OFF ]"
        echo "Ops, não foi possivel remover o arquivo output. txt ou ele não existe"
    fi

    echo ""
    sleep 3
    clear
    nome_portainer.reset
    echo -e "\e[32m[ PORTAINER ]\e[0m"
    echo ""

    echo -e "\e[97mUsuario:\e[33m $USER\e[0m"
    echo ""

    echo -e "\e[97mNova Senha:\e[33m $PASSWORD\e[0m"

    ## Creditos do instalador
    creditos_msg

    read -p "Deseja voltar ao menu principal? (Y/N): " choice
    if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        return
    else
        cd
        cd
        clear
        exit 1
    fi
}

traefik.fix() {

    echo ""
    echo ""
    echo "Trocando a versão da Stack do traefik..."
    ## Trocando a versão na stack
    sed -i 's/image: traefik:latest/image: traefik:v2.11.2/' /root/traefik.yaml
    if [ $? -eq 0 ]; then
        echo "1/3 - [ OK ] - Alterando versão na Stack"
    else
        echo "1/3 - [ OFF ] - Alterando versão na Stack"
        echo "Ops, não foi possivel alterar a versão na stack do Traefik"
    fi
    echo ""

    docker stack deploy --prune --resolve-image always -c traefik.yaml traefik > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "2/3 - [ OK ] - Fazendo Deploy da stack"
    else
        echo "2/3 - [ OFF ] - Fazendo Deploy da stack"
        echo "Ops, não foi possivel fazer o deploy da stack do Traefik"
    fi
    echo ""

    echo "Verificando stack do Traefik"
    wait_stack "traefik"

    if [ $? -eq 0 ]; then
        echo "3/3 - [ OK ] - Verificando Stack"
    else
        echo "3/3 - [ OFF ] - Verificando Stack"
        echo "Ops, não foi possivel Verificar a stack do Traefik"
    fi
    echo ""
    echo "Finalizado, já fixamos a imagem do seu traefik =D"
    echo ""
    sleep 5

}

krayin.fix(){

  URL_VAR=$(grep '\s*- APP_URL=' /root/krayincrm.yaml | cut -d '=' -f 2-)
  DB_VAR=$(grep '\s*- DB_DATABASE=' /root/krayincrm.yaml | cut -d '=' -f 2-)
  pegar_senha_mysql > /dev/null 2>&1


  if [ $? -eq 0 ]; then
      echo "1/4 - [ OK ] - Pegando URL do Krayin CRM"
  else
      echo "1/4 - [ OFF ] - Pegando URL do Krayin CRM"
  fi

#docker exec -it "$(docker ps --filter "name=^mysql_mysql" -q)" mysql -u root -p"$senha_mysql" -e "
#CREATE DATABASE $DB_VAR CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
#CREATE USER 'orion'@'%' IDENTIFIED BY 'design';
#GRANT ALL PRIVILEGES ON $DB_VAR.* TO 'orion'@'%';
#FLUSH PRIVILEGES;" > /dev/null 2>&1


  docker exec -it "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)" php /var/www/html/laravel-crm/artisan migrate --force > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "2/4 - [ OK ] - Migrando DB"
  else
      echo "2/4 - [ OFF ] - Migrando DB"
  fi

  docker exec -it   -e APP_NAME="Krayin CRM"   -e APP_URL="https://$URL_VAR"   -e APP_TIMEZONE="America/Sao_Paulo"   -e APP_LOCALE="en"   -e APP_CURRENCY="BRL"   -e DB_CONNECTION="mysql"   -e DB_HOST="mysql"   -e DB_PORT="3306"   -e DB_DATABASE="$DB_VAR"   -e DB_USERNAME="orion"   -e DB_PASSWORD="design"   "$(docker ps --filter "name=krayincrm${1:+_$1}_krayin" -q)"   php /var/www/html/laravel-crm/artisan krayin-crm:install --no-interaction > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "3/4 - [ OK ] - Aplicando Seed"
  else
      echo "3/4 - [ OFF ] - Aplicando Seed"
  fi

  #docker exec -it "$(docker ps --filter 'name=krayincrm_krayin' -q)" bash -c 'cd /var/www/html/laravel-crm && ls -l artisan || (ls -l composer.json && composer install) && php artisan krayin-crm:install'
  docker exec -it "$(docker ps --filter 'name=krayincrm_krayin' -q)" php /var/www/html/laravel-crm/artisan migrate --seed --force > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "4/4 - [ OK ] - Aplicando atualização"
  else
      echo "4/4 - [ OFF ] - Aplicando atualização"
  fi
  # docker exec -it "$(docker ps --filter 'name=krayincrm_krayin' -q)" bash -c 'cd /var/www/html/laravel-crm && ls -l artisan || (ls -l composer.json && composer install) && php artisan krayin-crm:install'


  sleep 2
  echo ""
  echo "Finalizado..."
  sleep 5

}

krayin.br(){
  wget -O /var/lib/docker/volumes/krayin_data/_data/packages/Webkul/Admin/src/Resources/lang/es/app.php https://raw.githubusercontent.com/oriondesign2015/SetupOrion/refs/heads/main/Extras/Krayin/app.php > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "1/2 - [ OK ] - Traduzindo..."
  else
      echo "1/2 - [ OFF ] - Traduzindo..."
  fi
  sleep 5
  docker service update --force krayincrm${1:+_$1}_krayin > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      echo "2/2 - [ OK ] - Reiniciando..."
  else
      echo "2/2 - [ OFF ] - Reiniciando..."
  fi
  sleep 30
  echo ""
  echo "Tradução realizada com sucesso! Troque o idioma para espanhol para deixa-lo em português!"
  echo ""
  sleep 10
}



ctop() {

    echo ""
    echo "Instalando CTOP"
    sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -O /usr/local/bin/ctop
    if [ $? -eq 0 ]; then
        echo "1/2 - [ OK ] - Baixando CTOP"
    else
        echo "1/2 - [ OFF ] - Baixando CTOP"
        echo "Ops, não foi possivel baixar o CTOP"
    fi

    sudo chmod +x /usr/local/bin/ctop
    if [ $? -eq 0 ]; then
        echo "2/2 - [ OK ] - Dando permissão ao CTOP"
    else
        echo "2/2 - [ OFF ] - Dando permissão ao CTOP"
        echo "Ops, não foi possivel dar permissão ao CTOP"
    fi
    echo ""
    echo "Instalado, digite CTOP fora do nosso Setup oara executa-lo a qualquer momento."
    echo ""
    sleep 5

}

quepasa.setup.off(){
    echo ""
    echo "Desativando painel /setup do quepasa"
    mv /var/lib/docker/volumes/quepasa_volume/_data/views/setup.tmpl /var/lib/docker/volumes/quepasa_volume/_data/views/setup.old
    if [ $? -eq 0 ]; then
        echo "1/1 - [ OK ] - Painel /setup Desativado"
    else
        echo "1/1 - [ OFF ] - Erro ao desativar painel"
        echo "Tente novamente mais tarde ou verifique se você tem Quepasa instalado."
    fi
    echo ""
    echo "Voltando ao menu de ferramentas..."
    sleep 5
}

quepasa.setup.on(){
    echo ""
    echo "Ativando painel /setup do quepasa"
    mv /var/lib/docker/volumes/quepasa_volume/_data/views/setup.old /var/lib/docker/volumes/quepasa_volume/_data/views/setup.tmpl
    if [ $? -eq 0 ]; then
        echo "1/1 - [ OK ] - Painel /setup Ativado"
    else
        echo "1/1 - [ OFF ] - Erro ao Ativar painel"
        echo "Tente novamente mais tarde ou verifique se você tem Quepasa instalado."
    fi
    echo ""
    echo "Voltando ao menu de ferramentas..."
    sleep 5
}

# Função para calcular espaço de disco
armazenamento_livre() {
    df_output=$(df --output=used,avail,size --block-size=1G / | tail -n1)
    used=$(echo "$df_output" | awk '{print $1}')
    avail=$(echo "$df_output" | awk '{print $2}')
    total=$(echo "$df_output" | awk '{print $3}')
    percentage=$((100 * used / total))

    echo "$used $avail $total $percentage"
}

# Função principal
limpar() {
    clear
    nome_expurgando
    echo -e "\e[97m• VERIFICANDO ESPAÇO DISPONÍVEL \e[33m[1/3]\e[0m"
    echo ""
    sleep 1
    read used_before avail_before total_before percent_before <<<"$(armazenamento_livre)"
    echo -e "Espaço usado: \e[33m${used_before}Gb\e[0m (\e[33m${percent_before}%\e[0m usado)"
    echo -e "Espaço livre: \e[33m${avail_before}Gb\e[0m de \e[33m${total_before}Gb\e[0m"
    echo ""

    echo -e "\e[97m• LIMPANDO RECURSOS NÃO UTILIZADOS DO DOCKER \e[33m[2/3]\e[0m"
    echo ""
    sleep 1
    docker system prune -af > /dev/null
    truncate -s 0 /var/lib/docker/containers/*/*-json.log > /dev/null
    sleep 1

    echo -e "\e[97m• LIMPEZA CONCLUÍDA \e[33m[3/3]\e[0m"
    echo ""
    read used_after avail_after total_after percent_after <<<"$(armazenamento_livre)"
    echo -e "Espaço usado: \e[33m${used_after}Gb\e[0m (\e[33m${percent_after}%\e[0m usado)"
    echo -e "Espaço livre: \e[33m${avail_after}Gb\e[0m de \e[33m${total_after}Gb\e[0m"

    # Calcular espaço liberado
    space_freed=$((used_before - used_after))
    echo -e "Foi liberado: \e[33m${space_freed}Gb\e[0m do seu servidor"
    echo ""
    echo -e "\e[97mVoltando ao menu principal em 10 segundos...\e[0m"
    sleep 10
}



## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

## Iniciando instalador

## Mostrar nome do instalador
nome_instalador

## Mostrar direitos do instalador
direitos_instalador

##Após apetar Y e confirmar continua..

## Menu de opções (backend)
while true; do

    nome_menu
    menu_instalador

    read -p "Digite o NÚMERO da opção desejada ou COMANDO oculto: " opcao

    set -- $opcao
    opcao1=$1
    opcao2=$2

    case $opcao1 in

        0|00|teste_smtp|TESTE_SMTP)
            ferramenta_testeemail
            ;;

        1|01|portainer|traefik|PORTAINER|TRAEFIK)
            ferramenta_traefik_e_portainer
            ;;

        2|02|chatwoot|CHATWOOT)

            verificar_stack "chatwoot${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="chatwoot${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_chatwoot "$opcao2"
                else
                    APP_ORION="ferramenta_chatwoot"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;

        3|03|evolution|evo|EVO)

            verificar_stack "evolution${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="evolution${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_evolution "$opcao2"
                else
                    APP_ORION="ferramenta_evolution"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        4|04|minio|MINIO)

            verificar_stack "minio${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="minio${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_minio "$opcao2"
                else
                    APP_ORION="ferramenta_minio"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        5|05|typebot|TYPEBOT)

            verificar_stack "typebot${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio; then
                ## INICIO TOKEN
                STACK_NAME="typebot${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_typebot "$opcao2"
                else
                    APP_ORION="ferramenta_typebot"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        6|06|n8n|N8N)

            verificar_stack "n8n${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="n8n${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_n8n "$opcao2"
                else
                    APP_ORION="ferramenta_n8n"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        7|07|flowise|FLOWISE)

            verificar_stack "flowise${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="flowise${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_flowise "$opcao2"
                else
                    APP_ORION="ferramenta_flowise"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        8|08|pgadmin|PGADMIN)

            verificar_stack "pgadmin${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="pgadmin${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_pgAdmin_4 "$opcao2"
                else
                    APP_ORION="ferramenta_pgAdmin_4"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        9|09|nocobase|NOCOBASE)

            verificar_stack "nocobase${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="nocobase${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_nocobase "$opcao2"
                else
                    APP_ORION="ferramenta_nocobase"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        10|botpress|BOTPRESS)

            verificar_stack "botpress${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="botpress${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_botpress "$opcao2"
                else
                    APP_ORION="ferramenta_botpress"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        11|wordpress|WORDPRESS)
            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_wordpress
                else
                    APP_ORION="ferramenta_wordpress"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        12|baserow|BASEROW)

            verificar_stack "baserow${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="baserow${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_baserow "$opcao2"
                else
                    APP_ORION="ferramenta_baserow"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        13|mongodb|MONGODB)

            verificar_stack "mongodb${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="mongodb${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_mongodb "$opcao2"
                else
                    APP_ORION="ferramenta_mongodb"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        14|rabbitmq|RABBITMQ)

            verificar_stack "rabbitmq${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="rabbitmq${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_rabbitmq "$opcao2"
                else
                    APP_ORION="ferramenta_rabbitmq"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        100|poker|POKER)

            verificar_stack "poker${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="poker${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_poker "$opcao2"
                else
                    APP_ORION="ferramenta_poker"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        15|uptimekuma|UPTIMEKUMA)

            verificar_stack "uptimekuma${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="uptimekuma${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_uptimekuma "$opcao2"
                else
                    APP_ORION="ferramenta_uptimekuma"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        16|calcom|CALCOM)

            verificar_stack "calcom${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="calcom${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_calcom "$opcao2"
                else
                    APP_ORION="ferramenta_calcom"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        17|mautic|MAUTIC)

            verificar_stack "mautic${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="mautic${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_mautic "$opcao2"
                else
                    APP_ORION="ferramenta_mautic"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        18|appsmith|APPSMITH)

            verificar_stack "appsmith${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="appsmith${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_appsmith "$opcao2"
                else
                    APP_ORION="ferramenta_appsmith"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        19|qdrant|QDRANT)

            verificar_stack "qdrant${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="qdrant${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_qdrant "$opcao2"
                else
                    APP_ORION="ferramenta_qdrant"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        20|woofedcrm|WOOFEDCRM)

            verificar_stack "woofedcrm${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="woofedcrm${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_woofed "$opcao2"
                else
                    APP_ORION="ferramenta_woofed"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        21|formbricks|FORMBRICKS)

            verificar_stack "formbricks${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="formbricks${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_formbricks "$opcao2"
                else
                    APP_ORION="ferramenta_formbricks"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        22|nocodb|NOCODB)

            verificar_stack "nocodb${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="nocodb${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_nocodb "$opcao2"
                else
                    APP_ORION="ferramenta_nocodb"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        23|langfuse|LANGFUSE)

            verificar_stack "langfuse${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="langfuse${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_langfuse "$opcao2"
                else
                    APP_ORION="ferramenta_langfuse"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        24|metabase|METABASE)

            verificar_stack "metabase${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="metabase${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_metabase "$opcao2"
                else
                    APP_ORION="ferramenta_metabase"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        25|odoo|ODOO)

            verificar_stack "odoo${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="odoo${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_odoo "$opcao2"
                else
                    APP_ORION="ferramenta_odoo"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        26|chatwoot_nestor|CHATWOOT_NETOR)

            verificar_stack "chatwoot_nestor${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="chatwoot_nestor${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_chatwoot_nestor "$opcao2"
                else
                    APP_ORION="ferramenta_chatwoot_nestor"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        27|unoapi|UNOAPI)

            verificar_stack "unoapi${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio_e_rabbitmq_e_chatwoot; then
                ## INICIO TOKEN
                STACK_NAME="unoapi${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_unoapi "$opcao2"
                else
                    APP_ORION="ferramenta_unoapi"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        28|n8n_quepasa|N8N_QUEPASA)

            verificar_stack "n8n_quepasa${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="n8n_quepasa${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_n8n_quepasa "$opcao2"
                else
                    APP_ORION="ferramenta_n8n_quepasa"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        29|quepasa|QUEPASA)

            verificar_stack "quepasa${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="quepasa${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_quepasa "$opcao2"
                else
                    APP_ORION="ferramenta_quepasa"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        30|docuseal|DOCUSEAL)

            verificar_stack "docuseal${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="docuseal${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_docuseal "$opcao2"
                else
                    APP_ORION="ferramenta_docuseal"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        31|monitor|grafana|MONITOR|GRAFANA)

            verificar_stack "monitor${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="monitor${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_monitor "$opcao2"
                else
                    APP_ORION="ferramenta_monitor"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        32|dify|DIFY)

            verificar_stack "dify${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio; then
                ## INICIO TOKEN
                STACK_NAME="dify${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_dify "$opcao2"
                else
                    APP_ORION="ferramenta_dify"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        33|ollama|OLLAMA)

            verificar_stack "ollama${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="ollama${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_ollama "$opcao2"
                else
                    APP_ORION="ferramenta_ollama"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        34|affine|AFFINE)

            verificar_stack "affine${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="affine${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_affine "$opcao2"
                else
                    APP_ORION="ferramenta_affine"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        35|directus|DIRECTUS)

            verificar_stack "directus${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio; then
                ## INICIO TOKEN
                STACK_NAME="directus${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_directus "$opcao2"
                else
                    APP_ORION="ferramenta_directus"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        36|vaultwarden|VAULTWARDEN)

            verificar_stack "vaultwarden${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="vaultwarden${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_vaultwarden "$opcao2"
                else
                    APP_ORION="ferramenta_vaultwarden"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        37|nextcloud|NEXTCLOUD)

            verificar_stack "nextcloud${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="nextcloud${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_nextcloud "$opcao2"
                else
                    APP_ORION="ferramenta_nextcloud"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        38|strapi|STRAPI)

            verificar_stack "strapi${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="strapi${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_strapi "$opcao2"
                else
                    APP_ORION="ferramenta_strapi"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        39|phpmyadmin|pma|PHPMYADMIN|PMA)

            verificar_stack "phpmyadmin${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="phpmyadmin${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_phpmyadmin "$opcao2"
                else
                    APP_ORION="ferramenta_phpmyadmin"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        40|supabase|supa|SUPABASE|SUPA)

            verificar_stack "supabase${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio; then
                ## INICIO TOKEN
                STACK_NAME="supabase${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_supabase "$opcao2"
                else
                    APP_ORION="ferramenta_supabase"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        41|ntfy|NTFY)

            verificar_stack "ntfy${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="ntfy${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_ntfy "$opcao2"
                else
                    APP_ORION="ferramenta_ntfy"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        42|lowcoder|LOWCODER)

            verificar_stack "lowcoder${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_mongo; then
                ## INICIO TOKEN
                STACK_NAME="lowcoder${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_lowcoder "$opcao2"
                else
                    APP_ORION="ferramenta_lowcoder"
                    verificar_arquivo
                fi
                ## FIM TOKEN
            fi
            ;;
        43|langflow|LANGFLOW)

            verificar_stack "langflow${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="langflow${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_langflow "$opcao2"
                else
                    APP_ORION="ferramenta_langflow"
                    ferramenta_langflow
                fi
                ## FIM TOKEN
            fi
            ;;
        44|openproject|OPENPROJECT)

            verificar_stack "openproject${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="openproject${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_openproject "$opcao2"
                else
                    APP_ORION="ferramenta_openproject"
                    ferramenta_openproject
                fi
                ## FIM TOKEN
            fi
            ;;
        45|zep|ZEP)

            verificar_stack "zep${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="zep${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_zep "$opcao2"
                else
                    APP_ORION="ferramenta_zep"
                    ferramenta_zep
                fi
                ## FIM TOKEN
            fi
            ;;
        46|humhub|HUMHUB)

            verificar_stack "humhub${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="humhub${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_humhub "$opcao2"
                else
                    APP_ORION="ferramenta_humhub"
                    ferramenta_humhub
                fi
                ## FIM TOKEN
            fi
            ;;
        47|yourls|YOURLS)

            verificar_stack "yourls${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="yourls${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_yourls "$opcao2"
                else
                    APP_ORION="ferramenta_yourls"
                    ferramenta_yourls
                fi
                ## FIM TOKEN
            fi
            ;;

        48|twentycrm|TWENTYCRM)

            verificar_stack "twentycrm${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="twentycrm${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_twentycrm "$opcao2"
                else
                    APP_ORION="ferramenta_twentycrm"
                    ferramenta_twentycrm
                fi
                ## FIM TOKEN
            fi
            ;;

        49|mattermost|MATTERMOST)

            verificar_stack "mattermost${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="mattermost${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_mattermost "$opcao2"
                else
                    APP_ORION="ferramenta_mattermost"
                    ferramenta_mattermost
                fi
                ## FIM TOKEN
            fi
            ;;

        50|outline|OUTLINE)

            verificar_stack "outline${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="outline${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_outline "$opcao2"
                else
                    APP_ORION="ferramenta_outline"
                    ferramenta_outline
                fi
                ## FIM TOKEN
            fi
            ;;

        51|focalboard|FOCALBOARD)

            verificar_stack "focalboard${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="focalboard${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_focalboard "$opcao2"
                else
                    APP_ORION="ferramenta_focalboard"
                    ferramenta_focalboard
                fi
                ## FIM TOKEN
            fi
            ;;

        52|glpi|GLPI)

            verificar_stack "glpi${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="glpi${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_glpi "$opcao2"
                else
                    APP_ORION="ferramenta_glpi"
                    ferramenta_glpi
                fi
                ## FIM TOKEN
            fi
            ;;

        53|anythingllm|anything|AnythingLLM|Anything)

            verificar_stack "anythingllm${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_qdrant; then
                ## INICIO TOKEN
                STACK_NAME="anythingllm${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_anythingllm "$opcao2"
                else
                    APP_ORION="ferramenta_anythingllm"
                    ferramenta_anythingllm
                fi
                ## FIM TOKEN
            fi
            ;;

        54|excalidraw|Excalidraw)

            verificar_stack "excalidraw${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="excalidraw${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_excalidraw "$opcao2"
                else
                    APP_ORION="ferramenta_excalidraw"
                    ferramenta_excalidraw
                fi
                ## FIM TOKEN
            fi
            ;;

        55|easyappointments|EasyAppointments|Easy!Appointments|easy!appointments)

            verificar_stack "easyappointments${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="easyappointments${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_easyappointments "$opcao2"
                else
                    APP_ORION="ferramenta_easyappointments"
                    ferramenta_easyappointments
                fi
                ## FIM TOKEN
            fi
            ;;

        56|documenso|Documenso)

            verificar_stack "documenso${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik && verificar_antes_se_tem_minio; then
                ## INICIO TOKEN
                STACK_NAME="documenso${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_documenso "$opcao2"
                else
                    APP_ORION="ferramenta_documenso"
                    ferramenta_documenso
                fi
                ## FIM TOKEN
            fi
            ;;

        57|moodle|MOODLE)

            verificar_stack "moodle${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="moodle${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_moodle "$opcao2"
                else
                    APP_ORION="ferramenta_moodle"
                    ferramenta_moodle
                fi
                ## FIM TOKEN
            fi
            ;;

        58|tooljet|TOOLJET)

            verificar_stack "tooljet${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="tooljet${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_tooljet "$opcao2"
                else
                    APP_ORION="ferramenta_tooljet"
                    ferramenta_tooljet
                fi
                ## FIM TOKEN
            fi
            ;;

        59|StirlingPDF|Stirling|stirling)

            verificar_stack "stirlingpdf${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="stirlingpdf${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_stirlingpdf "$opcao2"
                else
                    APP_ORION="ferramenta_stirlingpdf"
                    ferramenta_stirlingpdf
                fi
                ## FIM TOKEN
            fi
            ;;

        60|ClickHouse|clickhouse|CLICKHOUSE)

            verificar_stack "clickhouse${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="clickhouse${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_clickhouse "$opcao2"
                else
                    APP_ORION="ferramenta_clickhouse"
                    ferramenta_clickhouse
                fi
                ## FIM TOKEN
            fi
            ;;

        61|RedisInsight|redisinsight|REDISINSIGHT)

            verificar_stack "redisinsight${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="redisinsight${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_redisinsight "$opcao2"
                else
                    APP_ORION="ferramenta_redisinsight"
                    ferramenta_redisinsight
                fi
                ## FIM TOKEN
            fi
            ;;

        62|Traccar|traccar|TRACCAR)

            verificar_stack "traccar${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="traccar${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_traccar "$opcao2"
                else
                    APP_ORION="ferramenta_traccar"
                    ferramenta_traccar
                fi
                ## FIM TOKEN
            fi
            ;;

        63|Firecrawl|firecrawl|FIRECRAWL)

            verificar_stack "firecrawl${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="firecrawl${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_firecrawl "$opcao2"
                else
                    APP_ORION="ferramenta_firecrawl"
                    ferramenta_firecrawl
                fi
                ## FIM TOKEN
            fi
            ;;

        64|Wuzapi|wuzapi|WUZAPI)

            verificar_stack "wuzapi${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="wuzapi${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_wuzapi "$opcao2"
                else
                    APP_ORION="ferramenta_wuzapi"
                    ferramenta_wuzapi
                fi
                ## FIM TOKEN
            fi
            ;;

        65|KrayinCRM|krayincrm|KRAYINCRM)

            verificar_stack "krayincrm${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then
                ## INICIO TOKEN
                STACK_NAME="krayincrm${opcao2:+_$opcao2}"
                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_krayincrm "$opcao2"
                else
                    APP_ORION="ferramenta_krayincrm"
                    ferramenta_krayincrm
                fi
                ## FIM TOKEN
            fi
            ;;

        ##remover.stack)
        ##    if verificar_docker_e_portainer_traefik; then
        ##
        ##        ferramenta_remover_stack
        ##
        ##    fi
        ##    ;;

        sair|fechar|exit|close|x)
            clear
            nome_saindo
            echo ""
            break
            ;;


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

        postgres)

            verificar_stack "postgres${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="postgres${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_postgres_setup "$opcao2"
                else
                    APP_ORION="ferramenta_postgres_setup"
                    ferramenta_postgres_setup
                fi

                ## FIM TOKEN

            fi
            ;;

        mysql)

            verificar_stack "mysql${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="mysql${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_mysql_setup "$opcao2"
                else
                    APP_ORION="ferramenta_mysql_setup"
                    ferramenta_mysql_setup
                fi

                ## FIM TOKEN

            fi
            ;;

        redis)

            verificar_stack "redis${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="redis${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_redis_setup "$opcao2"
                else
                    APP_ORION="ferramenta_redis_setup"
                    ferramenta_redis_setup
                fi

                ## FIM TOKEN

            fi
            ;;
        pgvector)

            verificar_stack "pgvector${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="pgvector${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_pgvector_setup "$opcao2"
                else
                    APP_ORION="ferramenta_pgvector_setup"
                    ferramenta_pgvector_setup
                fi

                ## FIM TOKEN

            fi
            ;;


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

        evolution.v1)

            verificar_stack "evolution_v1${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="evolution_v1${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_evolution_v1 "$opcao2"
                else
                    APP_ORION="ferramenta_evolution_v1"
                    ferramenta_evolution_v1
                fi

                ## FIM TOKEN

            fi
            ;;

        evolution.v2)

            verificar_stack "evolution_v2${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="evolution_v2${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_evolution_v2 "opcao2"
                else
                    APP_ORION="ferramenta_evolution_v2${opcao2:+_$opcao2}"
                    ferramenta_evolution_v2 "$opcao2"
                fi

                ## FIM TOKEN

            fi
            ;;

        evolution.lite)

            verificar_stack "evolution_lite${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="evolution_lite${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_evolution_lite "$opcao2"
                else
                    APP_ORION="ferramenta_evolution_lite${opcao2:+_$opcao2}"
                    ferramenta_evolution_lite "$opcao2"
                fi

                ## FIM TOKEN

            fi
            ;;

        transcrevezap)

            verificar_stack "transcrevezap${opcao2:+_$opcao2}" && continue || echo ""

            if verificar_docker_e_portainer_traefik; then

                ## INICIO TOKEN

                STACK_NAME="transcrevezap${opcao2:+_$opcao2}"

                if grep -q "Token: .\+" /root/dados_vps/dados_portainer; then
                    ferramenta_transcrevezap "$opcao2"
                else
                    APP_ORION="transcrevezap${opcao2:+_$opcao2}"
                    ferramenta_transcrevezap "$opcao2"
                fi

                ## FIM TOKEN

            fi
            ;;


## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

        ## Reiniciar portainer
        portainer.restart)
            portainer.restart
            ;;

        ## Redefinir senha do portainer
        portainer.reset)
            portainer.reset
            ;;

        ## Traduzir emails do Chatwoot
        chatwoot.mail)
            chatwoot.mail
            ;;

        ## Traduzir emails do Chatwoot N
        chatwoot.n.mail)
            chatwoot.n.mail
            ;;

        ## Desbloquear funções do Chatwoot
        chatwoot.nulled)
            chatwoot.nulled
            ;;

        ## Importar Workflows do Quepasa no N8N
        n8n.workflows)
            n8n.workflows
            ;;

        ## Corrigir imagem da stack do traefik para 2.11.2
        traefik.fix)
            traefik.fix
            ;;

        ## Corrigir instalação do Krayin
        krayin.fix)
            krayin.fix
            ;;

        krayin.br)
            krayin.br
            ;;

        ## Instalar CTOP
        ctop)
            ctop
            ;;

        ## Corrigir credenciais do portainer (para instalações)
        credencial.reset)
            criar_arquivo
            ;;

        quepasa.setup.off)
            quepasa.setup.off
            ;;

        quepasa.setup.on)
            quepasa.setup.on
            ;;

        p1|P1)
            menu_instalador="1"
            ;;

        p2|P2) menu_instalador="2"
            ;;

        limpar|clean|LIMPAR|CLEAN|expurgar|EXPURGAR)
            limpar
            ;;

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                         ORION DESIGN                                        ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##


        *)

            ;;
    esac
    echo ""
done