const EscrowService = artifacts.require("EscrowService")

contract("EscrowService", (accounts) => {
    let contractInstance;

    const seller = accounts[0]
    
    beforeEach(async () => {
    
        contractInstance = await EscrowService.new();
    
    });


    it("Should abort the purchase", async () => {
        
        const result = await contractInstance.abort({from : seller})
        
       assert.equal(result.receipt.status, true, "tx reciept status is true")
        
    })

    it("Should confirm purchase", async () => {
        
        const result = await contractInstance.confirmPurchase({from : accounts[1]})
        
      return assert.equal(result.receipt.status, true, "tx reciept status is true")
    
    })
})