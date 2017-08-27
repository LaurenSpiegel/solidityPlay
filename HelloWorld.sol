pragma solidity ^0.4.0;

contract HelloWorldContract {
    string word = "hello world";
    address issuer;
    
    // constructure runs when contract created
    function HelloWorldContract() {
        issuer = msg.sender;
    }
    
    modifier onlyOwner {
        if (msg.sender != issuer) {
            revert();
        }
        _;
    }
    
    // for getter function should use constant keyword
    // (otherwise will be a transaction and cost ether)
    function getWord() constant returns(string) {
        return word;
    }
    
    // add permission on this functino so only issuer can modify it
    // since this is a setter, it will actually be a new transaction (cost ether)
    // can NOT have setter with constant keyword or else info won't change
    // should NOT return a value from a setter because will not return
    // (transaction needs to be mined for update to actually happen) so should
    // use listeners for updates
    function setWord(string newWord) onlyOwner returns(string) {
        word = newWord;
        return;
    }
}