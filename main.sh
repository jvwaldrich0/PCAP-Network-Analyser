#!/bin/bash
PCAP_FILE=$1

while [ true ]; do
    read -p "
***************************************
**      PCAP Network Analyser        **
***************************************
///////////////////////////////////////
//                                   //
// subject: Desec Exercise Script    //
//                                   //
// dev: João Vitor Waldrich          //
//                                   //
///////////////////////////////////////
//                                   //
//    Lista de opções disponíveis    //
//                                   //
///////////////////////////////////////
[0] Sair
[1] Listar IPs envolvidos e o número de requisições

> " user_index_choice
    
    if [ $user_index_choice -eq 0 ]; then
        /bin/bash;
    elif [ $user_index_choice -eq 1 ]; then
        clear;
        tcpdump -vr $PCAP_FILE | cut -d ">" -f 1 | cut -d ")" -f 2 | cut -d " " -f 5 | grep -v '^$';
        read -p "
Press enter to continue...";
        clear;
    fi
done
