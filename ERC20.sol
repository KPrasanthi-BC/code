Smart Contract :
pragma solidity ^0.6.12;
contract Prasanthi_Token {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    // Constructor
    constructor() public {
        symbol = "PK";
        name = "Prasanthi_Token";
        decimals = 0;
        totalSupply = 10000;
        balances[0x51b4Df1eA81cA04e9Ee78ef9189d4A77732042E5] = totalSupply;
    }
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    function TotalSupply() external view returns (uint) 
    {
        return totalSupply  - balances[address(0)];
    }
    function balanceOf(address Owner) external view returns (uint balance) 
    {
        return balances[Owner];
    }
    function transfer(address _to, uint256 tokens)external returns (bool success) {
    if (balances[msg.sender] >= tokens && tokens> 0 && balances[_to] + tokens > balances[_to]) {
        balances[msg.sender] -= tokens;
         balances[_to] += tokens;
         emit Transfer(address(0), 0x51b4Df1eA81cA04e9Ee78ef9189d4A77732042E5, totalSupply);
        return true;       
    } else {
        return false; }
   }
    function approve(address spender, uint tokens) external returns (bool success){
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
   function transferFrom(address _from, address _to, uint256 tokens)external returns (bool success) 
   {
    if (balances[_from] >= tokens && allowed[_from][msg.sender] >= tokens &&tokens > 0 && balances[_to] + tokens > balances[_to]) 
    {
        balances[_from] -= tokens;
        balances[_to] += tokens;
        Transfer(_from, _to, tokens);
        return true;
    } 
    else {
      return false;
    }
  }
    function allowance(address tokenOwner, address spender) external view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}
