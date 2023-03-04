//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract BasicToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalsupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol,
        uint8 decimalUnits
    ) {
        balanceOf[msg.sender] = initialSupply;
        totalsupply = initialSupply;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
