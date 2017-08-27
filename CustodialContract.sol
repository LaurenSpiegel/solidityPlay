pragma solidity ^0.4.0;

contract CustodialContract {
    address client;
    bool toggle = false;
    
    function CustodialContract() {
        client = msg.sender;
    }
    
    // can only register events in setters since
    // getters don't get added to blockchain
    // need underscore for these args since reserved names
    event UpdateStatus(string _msg, uint _amount);
    event UserStatus(string _msg, address user, uint _amount);
    
    modifier ifClient(){
        if(client != msg.sender) {
            revert();
        }
        _;
    }
    // as long as use the payable keyword,
    // this function will allow deposits to the
    // contract itself. you can't validate
    // the amount sent, so no use using the
    // argument for this simple contract
    function depositFunds() payable {
        UserStatus("User has deposited some money", msg.sender, msg.value);
    }
    
    function withdrawFunds(uint amount) ifClient {
        // client.send returns true if successful
        // so wrap in if clause to perform
        // further steps only if successful
        if (client.send(amount)) {
            UpdateStatus("Client has withdrawn funds", amount);
            toggle = true;
        }
    }
    
    function getFunds() ifClient constant returns(uint) {
        return this.balance;
    }
}