# Install npm
```
npm install -g npm@8.19.2
mkdir $HOME/cosmos_haqq_bot && cd $HOME/cosmos_haqq_bot
npm install telegraf nodemon axios start --save
```
# Add Telegram bot
- Using [@BotFather](https://t.me/BotFather) to create your BOT, pay attention to HTTP API 

![image](https://user-images.githubusercontent.com/110323149/196336131-ac5119c9-43c4-49d4-8293-280dff5dc2dd.png)

- Download the repo, then open `create.js` to add API of your BOT
```
wget -O create.js https://raw.githubusercontent.com/minhhangdo/Sei-test-node/main/telebot/create.js
```
![image](https://user-images.githubusercontent.com/110323149/196336246-191e1472-770f-49e0-a048-7908dd6d6dda.png)

# Start BOT
```
which screen
#if result return is "/usr/bin/screen" , screen is installed
#if not have screen , run the current command to install
apt install screen
screen -S telebot
```
```
cd $HOME/cosmos_haqq_bot
npm i && npm start
```
# check and use bot , go to t.me/Cosmos_haqq_bot
- Start the bot with the command /start , then select the chain you want to support

![image](https://user-images.githubusercontent.com/110323149/196334858-ecb605d6-5026-4ab9-a3de-ab13848bf5d4.png)

- Take turns looking for what you like

![image](https://user-images.githubusercontent.com/110323149/196334973-a87b5caf-7cc6-47c3-81c5-61278f60748b.png)
![image](https://user-images.githubusercontent.com/110323149/196335066-eabc6629-3ee2-433c-a97b-64a99bc9ee0d.png)
![image](https://user-images.githubusercontent.com/110323149/196335172-e8d43a94-918d-4058-aa25-91361f5ea2d2.png)
![image](https://user-images.githubusercontent.com/110323149/196335475-e1e5b01e-6d7b-42ce-830e-dd104c13c09e.png)

****good luck****

