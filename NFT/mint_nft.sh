#!/bin/bash

password=YOUR_PASSWORD

for wallet in `cat $HOME/spam_nft/wallet_list.txt`; do 
  rm -rf /root/spam_nft/limit_tx.json /root/spam_nft/nft_tx.json
  wallet_name=$(echo $password | seispamd keys show $wallet --home $HOME/.seispam | grep name | awk '{print $3}');
  sed "s/YOUR_WALLET_ADDR/$wallet/g" gen_limit_tx.json > /root/spam_nft/limit_tx.json;
  sed "s/YOUR_WALLET_ADDR/$wallet/g" gen_nft.json > /root/spam_nft/nft_tx.json;

  for ((i = 1; i <= 10; i++ )); do 
     echo $password | seispamd tx sign /root/spam_nft/limit_tx.json --from $wallet_name --chain-id atlantic-1 --home $HOME/.seispam --output-document /root/spam_nft/tx_tmp.json --node https://sei-testnet-rpc.brocha.in:443 ; sleep 5;
     echo $password | seispamd tx broadcast /root/spam_nft/tx_tmp.json; sleep 5;
  done
    
     echo $password | seispamd tx sign /root/spam_nft/nft_tx.json --from $wallet_name --chain-id atlantic-1 --home $HOME/.seispam --output-document /root/spam_nft/nft_tmp.json --node https://sei-testnet-rpc.brocha.in:443; sleep 5;
     echo $password | seispamd tx broadcast /root/spam_nft/nft_tmp.json --home $HOME/.seispam --node https://sei-testnet-rpc.brocha.in:443 >> nft_txh.log
     sleep 5;
done
