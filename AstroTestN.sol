// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AstroDev {
    string public constant name = "AstroTestN";
    string public constant symbol = "ATESTN";
    uint8 public constant decimals = 18;
    uint256 public constant totalSupply = 10 ** 36; // 1 quintillion tokens

    address public immutable InitialOwner;
    address public immutable TaxWallet;
    address public immutable AIWallet;

    uint256 public constant taxPercent = 167; // Representing 1.67%
    bool public paused = false;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Paused();
    event Unpaused();

    modifier onlyOwner() {
        require(msg.sender == InitialOwner, "Not authorized");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    modifier whenPaused() {
        require(paused, "Contract is not paused");
        _;
    }

    modifier nonReentrant() {
        uint256 _status = _guard;
        require(_status != 1, "Reentry detected");
        _guard = 1;
        _;
        _guard = 0;
    }

    uint256 private _guard;

    constructor(address _TaxWallet, address _AIWallet) {
        InitialOwner = msg.sender;
        TaxWallet = _TaxWallet;
        AIWallet = _AIWallet;
        balances[InitialOwner] = totalSupply;
    }

    // --- Standard ERC20 Functions ---

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) public whenNotPaused nonReentrant returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public whenNotPaused returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public whenNotPaused nonReentrant returns (bool) {
        require(allowances[sender][msg.sender] >= amount, "Allowance exceeded");
        allowances[sender][msg.sender] -= amount;
        _transfer(sender, recipient, amount);
        return true;
    }

    // --- Internal Transfer Logic with Tax ---
    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "Transfer from zero address");
        require(to != address(0), "Transfer to zero address");
        require(balances[from] >= amount, "Insufficient balance");

        uint256 taxAmount = 0;

        // Apply tax unless exempted
        if (from != TaxWallet && from != InitialOwner && from != AIWallet) {
            taxAmount = (amount * taxPercent) / 10000;
            balances[TaxWallet] += taxAmount;
            emit Transfer(from, TaxWallet, taxAmount);
        }

        uint256 transferAmount = amount - taxAmount;

        balances[from] -= amount;
        balances[to] += transferAmount;
        emit Transfer(from, to, transferAmount);
    }

    // --- Emergency Pause Functions ---
    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit Paused();
    }

    function unpause() public onlyOwner whenPaused {
        paused = false;
        emit Unpaused();
    }
}
