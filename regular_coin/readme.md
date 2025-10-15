# Regular Coin 

A simple deflationary coin implementation on Sui with fixed supply and no minting capabilities.

## 📋 Overview

Regular Coin demonstrates the most basic coin pattern on Sui - a fixed supply token that can only be burned (deflationary). Once deployed, no additional tokens can ever be minted, making it truly deflationary.

### Key Components

1. **One-Time Witness (OTW)**: `REGULAR_COIN` struct ensures the coin can only be created once
2. **TreasuryCap**: Frozen at initialization to prevent minting
3. **CoinMetadata**: Frozen metadata containing coin information
4. **Total Supply**: All tokens minted to deployer address


The coin is automatically initialized when the module is published. The `init` function:
1. Creates the coin with metadata
2. Mints 1 billion tokens
3. Freezes the TreasuryCap (no more minting possible)
4. Freezes the metadata (immutable coin info)
5. Transfers all tokens to the deployer


## 🔍 Key Concepts

### One-Time Witness (OTW)

The `REGULAR_COIN` struct with the `drop` ability serves as a one-time witness, ensuring the coin can only be initialized once during module publication.

### Deflationary Mechanism

By freezing the `TreasuryCap`, we permanently disable minting. This creates a truly deflationary token where supply can only decrease (through burning) or stay constant