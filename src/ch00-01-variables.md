# Variables

There are 3 types of variables in Cairo contracts:

- Local
  - declared inside a function
  - not stored on the blockchain
- Storage
  - declared in the `Storage` struct of a contract
  - can be accessed from one execution to another
- Global
  - provides information about the blockchain
  - accessed anywhere, even within library functions

## Local Variables

Local variables are used and accessed within the scope of a specific function or block of code. They are temporary and exist only for the duration of that particular function or block execution.

Local variables are stored in memory and are not stored on the blockchain. This means they cannot be accessed from one execution to another. Local variables are useful for storing temporary data that is relevant only within a specific context. They also make the code more readable by giving names to intermediate values.

Here's a simple example of a contract with only local variables:

```rust
{{#include ../listings/ch00-introduction/variables/src/local_variables.cairo}}
```
Visit contract on [Voyager](https://goerli.voyager.online/contract/0x015B3a10F9689BeD741Ca3C210017BC097122CeF76f3cAA191A20ff8b9b56b96) or play with it in [Remix](https://remix.ethereum.org/?#activate=Starknet&url=https://github.com/NethermindEth/StarknetByExample/blob/main/listings/ch00-introduction/variables/src/local_variables.cairo).

## Storage Variables

Storage variables are persistent data stored on the blockchain. They can be accessed from one execution to another, allowing the contract to remember and update information over time.

To write or update a storage variable, you need to interact with the contract through an `#[external]` entrypoint by sending a transaction.

On the other hand, you can read state variables, for free, without any transaction, simply by interacting with a node.

Here's a simple example of a contract with one storage variable:

```rust
{{#include ../listings/ch00-introduction/variables/src/storage_variables.cairo}}
```
Visit contract on [Voyager](https://goerli.voyager.online/contract/0x06eA827B32875483709b785A7F9e846a52776Cd8D42C3fE696218c2624b0DCCa) or play with it in [Remix](https://remix.ethereum.org/?#activate=Starknet&url=https://github.com/NethermindEth/StarknetByExample/blob/main/listings/ch00-introduction/variables/src/storage_variables.cairo).

## Global Variables

Global variables are predefined variables that provide information about the blockchain and the current execution environment. They can be accessed at any time and from anywhere!

In Starknet, you can access global variables by using specific functions contained in the starknet core libraries.

For example, the `get_caller_address` function returns the address of the caller of the current transaction, and the `get_contract_address` function returns the address of the current contract.

```rust
{{#include ../listings/ch00-introduction/variables/src/global_variables.cairo}}
```
Visit contract on [Voyager](https://goerli.voyager.online/contract/0x05bD2F3943bd4e030f85678b55b2EC2C1be939e32388530FB20ED967B3Be433F) or play with it in [Remix](https://remix.ethereum.org/?#activate=Starknet&url=https://github.com/NethermindEth/StarknetByExample/blob/main/listings/ch00-introduction/variables/src/global_variables.cairo).