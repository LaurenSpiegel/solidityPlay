pragma solidity ^0.4.0;

contract PayableContract {
    
    function PayableContract() {
        
    }
    
    // if the contract address is hit with a value, then the balance of
    // the contract itself will increase
    function receiveFunds() payable {
        
    }
    
    function getter() constant returns(uint) {
        return this.balance;
    }

}