# dowload file 
```
cd $HOME && mkdir $HOME/spam_nft
cd spam_nft
wget -O mint_nft.sh https://raw.githubusercontent.com/minhhangdo/Sei-test-node/main/NFT/mint_nft.sh && chmod +x mint_nft.sh
wget -O gen_nft.json https://raw.githubusercontent.com/minhhangdo/Sei-test-node/main/NFT/gen_nft.json && chmod +x gen_nft.json

```
```
cd $HOME && mkdir $HOME/.seispam
cp /root/go/bin/seid /root/go/bin/seispamd
seispamd version
cd .seispam
seispamd config chain-id atlantic-1 --home $HOME/.seispam
seispamd init SPAM --chain-id atlantic-1 -o --home $HOME/.seispam
seispamd config keyring-backend test  --home $HOME/.seispam
```
### 1. Create wallet
```
password=YOUR_PASSWORD
for ((i = 1; i <= 100; i++ )); do \
echo $password | seispamd keys add sei_nft$i --home $HOME/.seispam ; \
sleep 5;
done 

echo $password | seispamd keys list --home $HOME/.seispam | grep address | awk '{print $2}' > $HOME/spam_nft/wallet_list.txt
```

### 2. Send fund to all wallet
```
main_wallet_addr=YOUR_MAIN_ADDR
main_wallet_name=YOUR_MAIN_NAME

for i in `cat $HOME/spam_nft/wallet_list.txt` ; do \
echo $password | seispamd tx bank send $main_wallet_addr $i 500000factory/sei1466nf3zuxpya8q9emxukd7vftaf6h4psr0a07srl5zw74zh84yjqpeheyc/uust2 --chain-id atlantic-1 --from $main_wallet_name --home $HOME/.seispam --node https://sei-testnet-rpc.brocha.in:443 -y ; \
sleep 5; \
echo $password | seispamd tx bank send $main_wallet_addr $i 10000usei --chain-id atlantic-1 --from $main_wallet_name --home $HOME/.seispam --node https://sei-testnet-rpc.brocha.in:443 -y ; \
sleep 5; \
done;
```
```
sed -i "s|\"sender\": .*|\"sender\": \"$main_wallet_addr\",|" gen_nft.json
```
### 3. Make place order and mint NFT by CLI
- Open script `mint_nft.sh`, then set the variable `password` to YOUR_PASSWORD
- Run script
```
chmod +x /root/spam_nft/mint_nft.sh
nohup /root/spam_nft/mint_nft.sh &
```
- Check TXH of minting NFT in the file `/root/spam_nft/nft_txh.log`

