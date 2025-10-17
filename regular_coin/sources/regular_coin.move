module 0x0::currency;

use sui::coin::Coin;
use sui::coin_registry::{Self, CoinRegistry};

// Total supply of the `DEFLATIONARY_SUPPLY` coin is 1B (with 6 decimals).
const TOTAL_SUPPLY: u64 = 1000000000_000000; 

// The type identifier of coin. The coin will have a type
// tag of kind: `Coin<package_object::currency::MyCoin>`
public struct MyCoin has key { id: UID }

#[allow(lint(self_transfer))]
/// Creates a new currency with a non-OTW proof of uniqueness.
public fun new_currency(registry: &mut CoinRegistry, ctx: &mut TxContext): Coin<MyCoin> {
    let (mut currency, mut treasury_cap) = coin_registry::new_currency(
        registry,
        6, // Decimals
        b"MyCoin".to_string(), // Symbol
        b"My Coin".to_string(), // Name
        b"Standard Unregulated Coin".to_string(), // Description
        b"https://example.com/my_coin.png".to_string(), // Icon URL
        ctx,
    );

    let total_supply = treasury_cap.mint(TOTAL_SUPPLY, ctx);
    currency.make_supply_burn_only(treasury_cap);

    let metadata_cap = currency.finalize(ctx);
    transfer::public_transfer(metadata_cap, ctx.sender());

    total_supply
}
