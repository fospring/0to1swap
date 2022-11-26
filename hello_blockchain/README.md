# hello blockchain
* clone from [aptos tutorials](https://aptos.dev/tutorials/first-move-module), example [hello_blockchain](https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/move-examples/hello_blockchain)
## commands
* init
```shell
aptos init
```
* compile
```shell
aptos move compile
```
* faucet
```shell
aptos account fund-with-faucet --account cb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488 --amount 500000000
```
* test 
```shell
aptos move test
```
* publish
```shell
aptos move publish
```
the output is:
```text
package size 1844 bytes
Do you want to submit a transaction for a range of [694300 - 1041400] Octas at a gas unit price of 100 Octas? [yes/no] >
yes
{
  "Result": {
    "transaction_hash": "0x69845d2bd2f8ad7319c085e0176ca3641ff8f41855cf36fcdd919384fa7882d6",
    "gas_used": 6943,
    "gas_unit_price": 100,
    "sender": "cb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1669471079181807,
    "version": 9203855,
    "vm_status": "Executed successfully"
  }
}
```
At this point, the module is now stored on the account in the Aptos blockchain.
* Interact with the Move module
```shell
aptos move run \
  --function-id '0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::set_message' \
  --args 'string:hello, blockchain'
```
output is:
```text
{
  "Result": {
    "transaction_hash": "0x03bae0ba8191a0869cebdb62d9058ed18d76a5ffd557941fe89b88d2382906ac",
    "gas_used": 782,
    "gas_unit_price": 100,
    "sender": "cb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488",
    "sequence_number": 1,
    "success": true,
    "timestamp_us": 1669471148101495,
    "version": 9205059,
    "vm_status": "Executed successfully"
  }
}
```
The `set_message` function modifies the `hello_blockchain` `MessageHolder` resource. A resource is a data structure that is stored in global storage. The resource can be read by querying the following REST API:
```shell
curl https://fullnode.devnet.aptoslabs.com/v1/accounts/0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488/resource/0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::MessageHolder
```
After the first execution, this should contain:
```json
{
    "type": "0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::MessageHolder",
    "data": {
        "message": "hello, blockchain",
        "message_change_events": {
            "counter": "0",
            "guid": {
                "id": {
                    "addr": "0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488",
                    "creation_num": "4"
                }
            }
        }
    }
}
```
Notice that the `message` field contains `hello, blockchain`. 
* update message
```shell
aptos move run \
  --function-id '0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::set_message' \
  --args 'string:hello, blockchain again'
```
output is:
```json
{
  "Result": {
    "transaction_hash": "0x1f7d9cebe87594dd9fc7f1e7116b69098d56f2ed1e99ea1c2fbb3dbcc56b99b3",
    "gas_used": 413,
    "gas_unit_price": 100,
    "sender": "cb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488",
    "sequence_number": 2,
    "success": true,
    "timestamp_us": 1669472864711643,
    "version": 9238836,
    "vm_status": "Executed successfully"
  }
}
```
Each successful call to `set_message` after the first call result in an update to `message_change_event`. The `message_change_events` for a given account can be accessed via the REST API:
```shell
curl https://fullnode.devnet.aptoslabs.com/v1/accounts/0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488/events/0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::MessageHolder/message_change_events
```
where, after a call to set the message to `hello, blockchain again`, the event stream would contain the following:
```json
[
    {
        "version": "9238836",
        "guid": {
            "creation_number": "4",
            "account_address": "0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488"
        },
        "sequence_number": "0",
        "type": "0xcb2a3531c62042a5cda7c38172c36ce2ae29ca00b98a6ac363fe02e9f45a1488::message::MessageChangeEvent",
        "data": {
            "from_message": "hello, blockchain",
            "to_message": "hello, blockchain again"
        }
    }
]
```
## Aptos API
* [networks](https://aptos.dev/guides/system-integrators-guide#networks)
* [REST API spec](https://fullnode.devnet.aptoslabs.com/v1/spec#/)