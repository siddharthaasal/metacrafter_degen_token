// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(string => uint256) public itemToTokens;
    event ItemRedeemed(address indexed user, string item);

    constructor() ERC20("Degen", "DGN") {
        itemToTokens["Shirt"] = 1;
        itemToTokens["Jeans"] = 2;
        itemToTokens["Shoes"] = 3;
        itemToTokens["GunSkin"] = 4;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer_amount(address recipient, uint256 amount) public returns (bool) {
        return transfer(recipient, amount);
    }

    function redeemForItems(string memory item) public {
        require(balanceOf(msg.sender) >= itemToTokens[item], "Insufficient balance for this item");
        // Transfer tokens from the user to the contract
        uint256 tokensRequired = itemToTokens[item];
        _transfer(msg.sender, address(this), tokensRequired);
        emit ItemRedeemed(msg.sender, item);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}
