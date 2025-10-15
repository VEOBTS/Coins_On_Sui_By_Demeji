/// Implements a coin with a deflationary supply. Upon initialization, mint the
/// total supply and destroy TreasuryCap to make the supply deflationary.
module regular_coin::regular_coin;

use sui::coin::{Self, Coin, TreasuryCap};
use sui::url;

/// Total supply of the coin is 1B (with 6 decimals).
const TOTAL_SUPPLY: u64 = 1_000_000_000_000_000;

/// One-time witness for coin creation
public struct REGULAR_COIN has drop {}

/// Initialize the coin with fixed supply
fun init(witness: REGULAR_COIN, ctx: &mut TxContext) {
    let (mut treasury_cap, metadata) = coin::create_currency(
        witness,
        6,
        b"REGULAR",
        b"Regular Coin",
        b"Standard Unregulated Coin",
        option::some(url::new_unsafe_from_bytes(b"https://example.com/regular_coin.png")),
        ctx
    );

    // Mint total supply
    let total_supply = treasury_cap.mint(TOTAL_SUPPLY, ctx);

    // Freeze metadata and treasury cap to prevent minting
    transfer::public_freeze_object(metadata);
    transfer::public_freeze_object(treasury_cap);

    // Send all coins to deployer
    transfer::public_transfer(total_supply, ctx.sender());
}

/// Burn coins to reduce supply
public fun burn(treasury: &mut TreasuryCap<REGULAR_COIN>, coin: Coin<REGULAR_COIN>) {
    coin::burn(treasury, coin);
}