# Move Coins Learning Repository 

A comprehensive collection of Move smart contracts demonstrating various coin creation patterns on the Sui blockchain.

**Created by:** [Demeji](https://github.com/VEOBTS)

## 📚 Overview

This repository contains practical examples of different coin implementations in Move so as to help developers understand the various approaches to creating tokens on Sui. Each folder contains a complete example with its own documentation and source code. 

##this folder will be updated over time and is not yet complete


##Brief description 
Coins on Sui are fungible assets each coin type defines a unique currency.
They’re created with coin::create_currency, which issues a TreasuryCap for mint/burn control and optional metadata for name, symbol, and icon.
A coin can be inflationary (keep TreasuryCap) or deflationary (destroy or freeze TreasuryCap).
All coin actions—minting, burning, transferring—are governed by Move’s resource safety, ensuring no duplication or unauthorized minting.

on Sui coins are created using the coin module with a one-time witness pattern, ensuring each coin type is unique and properly initialized. The TreasuryCap object controls minting rights, while CoinMetadata stores information like name, symbol, and decimals. 



Each subdirectory contains:
- 📖 **README.md** - Detailed explanation of the coin type
- 📁 **sources/** - Move source code files
- 🧪 **tests/** - Unit tests (where applicable)



## 🔗 Official Documentation

For comprehensive guides and API references, visit the official Sui documentation:

- **Sui Move Documentation**: [https://docs.sui.io/](https://docs.sui.io/)
- **Sui GitHub Repository**: [https://github.com/MystenLabs/sui](https://github.com/MystenLabs/sui)
- **Move Language Guide**: [https://github.com/MystenLabs/sui/tree/main/docs/content/guides/developer/sui-101](https://github.com/MystenLabs/sui/tree/main/docs/content/guides/developer/sui-101)
- **Coin Standard**: [https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs)

## 🚀 Getting Started

### Prerequisites

- Install [Sui CLI](https://docs.sui.io/build/install)
- Basic understanding of Move programming language

