const Escrow = artifacts.require("EscrowService");

module.exports = async (deployer) =>{
    await deployer.deploy(Escrow)
}