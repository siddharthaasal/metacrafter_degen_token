# metacrafter_degen_token
## Description
In this project I have created a custom token "Degen" which can be minted, burned, transferred, and used to redeem item from Degen Gaming Inventory.
I have created this project in hardhat, deployed it on Avalanche Fuji C Chain, and verified it via Snowtrace. 
I have interacted with the smart contract via Remix IDE.`

## Getting Started

### Functions

`mint(address to, uint256 amount):`
This function allows the owner of the contract (creator) to mint a specified amount of tokens and allocate them to a given address. It is accessible only by the contract owner. The minted tokens are added to the recipient's balance and to the total supply of the token.

`burn(uint256 amount): `
The burn function enables token holders to burn (destroy) a certain amount of tokens from their own balance. The function checks if the amount is greater than zero and if the sender's balance is sufficient for the burn. If both conditions are met, the specified amount of tokens is removed from the sender's balance and from the total supply of the token.

`transfer_amount(address recipient, uint256 amount): `
This function allows token holders to transfer a specific amount of tokens to another address. It functions similarly to the standard ERC-20 transfer function. If the sender's balance is sufficient, the tokens are deducted from their balance and added to the recipient's balance.

`redeemForItems(string memory item): `
Token holders can redeem items using this function, provided they have a sufficient balance for the specific item they wish to redeem. The function checks if the sender's balance is greater than or equal to the required amount of tokens for the chosen item. If the condition is met, the required tokens are transferred from the sender's address to the contract's address, and an event is emitted to indicate the redemption of the item.

`checkBalance(address account): `
This function allows users to check the balance of tokens for a given address. It returns the current balance of tokens in the specified account.

`Event: `
ItemRedeemed(address indexed user, string item)
This event is emitted when a token holder redeems an item using the redeemForItems function. It provides information about the user's address and the item that was redeemed.

### Installing

* Clone this repository via 
```
git clone https://github.com/siddharthaasal/metacrafter_degen_token.git
```
*Create a ".env" file and configure it:
```
WALLET_PRIVATE_KEY= <your-wallet's-private-key>

SNOWTRACE_API_KEY= <your-snowtrace-account-api-key>
```
* Run the following commands
```
npm i 
npx hardhat compile
npx hardhat run scripts/deploy.js --network fuji 
npx hardhat verify <YOUR TOKEN ADDRESS> --network fuji
```
* Open Remix IDE online and load the contract via your Token address.
* Play Around
* Open your Snowtrace and paste your contract's address to see/verify live interactions.

## Authors

Siddharth Aasal



## License

This project is licensed under MIT.


