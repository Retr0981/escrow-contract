// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract EscrowService { 

    // variables
    uint public value;
    address payable public buyer;
    address payable public seller;

    enum State { Created, Locked, Release, Inactive }

    //state variable whivh has a default value of the first member
    State public state;

    //modifier to check the current state
    modifier inState(State _state) {
        require(state == _state, "state is invalid");
        _;
    }

    //modifier to check that the function caller is the buyer
    modifier onlyBuyer() {
        require(msg.sender == buyer, "only the buyer can call this");
        _;
    }

    //modifier to check that the function caller is the seller
    modifier onlySeller() {
        require(msg.sender == seller, "only seller can call this");
        _;
    }

    //events to be emitted
    event Aborted();
    event PurchaseConfirmed();
    event ItemRecieved();
    event SellerRefund();


    //ensure that msg.value is an even number
     constructor() public payable {
        seller = msg.sender;
        value = msg.value / 2;
        require((2 * value) == msg.value, "Value has to be even.");
    }

    /** @dev Function to abort the purchase and reclaim the ether
     */
    function abort() public onlySeller inState(State.Created) {
        
        emit Aborted();

        state = State.Inactive;

        //transfer funds
        seller.transfer(address(this).balance);
    }

     /** @dev Function to confirm the purchase
     */
     function confirmPurchase() public inState(State.Created) payable {

         //check if the value is 2x 
         if(msg.value == (2 * value)) {
             
             emit PurchaseConfirmed();
            
            //set the buyer to the function caller
             buyer == msg.sender;

             state = State.Locked;
         }

     }

      /** @dev Function to confirm you the buyer recieved the product and release the locked ether
     */
     function confirmRecieved() public onlyBuyer inState(State.Locked) {

         emit ItemRecieved();

         state = State.Release;

         buyer.transfer(value);

     }

      /** @dev Function to refund the seller. this function pays the seller backs the remaining locked funds
     */
     function refundSeller() public onlySeller inState(State.Release) {

         emit SellerRefund();

         state = State.Inactive;

         seller.transfer(value * 3);
     }
     


}