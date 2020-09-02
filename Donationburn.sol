pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);


    event Approval(address indexed owner, address indexed spender, uint256 value);
}
interface Sprout{
        function treasuryDAO() external view returns (address treasury);
}
contract Donation {
IERC20 public Token;
uint256 public start;
uint256 public finish;
address payable public ad1;
address payable public ad2;
address payable public ad3;
address payable public ad4;
address payable public ad5;
address payable public ad6;  
uint256 public price;
constructor(IERC20 Tokent, address payable a1, address payable a2, address payable a3, address payable a4, address payable a5, address payable a6) public{
Token = Tokent;
start = now;
finish = now + 1 days;  
ad1=a1;
ad2=a2; 
ad3=a3; 
ad4=a4; 
ad5=a5; 
ad6=a6;
}
fallback() external payable {   
price = 0.1 ether;
Token.transfer(msg.sender,msg.value*10 - msg.value*10*((now-start) / (finish-start)));
}
function donate() public{
ad1.transfer(address(this).balance/5);
ad2.transfer(address(this).balance/5);
ad3.transfer(address(this).balance/5);
ad4.transfer(address(this).balance/10);
ad5.transfer(address(this).balance/10);
ad6.transfer(address(this).balance/5);
}}