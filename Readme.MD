
# QuidEscrow 🦪🚀🚀

# Author 💖

Njoku Emmanuel

# Smart Contract Flow🥑🍕

- On contract initiation The seller will need to stake 2x the value of what he is selling.

- on Confirming purchase, The purchaser will need to stake 2x the value of what he is buying..😋💵

- on confirming delivery, the Smart Contract returns 1ETH to the buyer and 3ETH to the seller. Confirming delivery concludes the transaction.

### The significance of making both seller and buyer stake ETH worth 2x the value of the item is that this motivates both parties to carry the full process of the transaction, from initiation to delivery confirmation.

# Running Smart Contract with Truffle and ganache blockchain locally

```bash
# Clone Repo
$ git clone `https://github.com/Khay-EMMA/bhills-test-escrow-contract`

# Install Dependencies
$ yarn install

```

## Connecting to Ganache and compiling contract and running tests

```bash
# Connect to ganache blockchain
$ ganache-cli -a

# Run truffle test
$ truffle test

# Run Migration and deploy to local blockchain
$ truffle migrate

```