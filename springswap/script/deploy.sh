curl --location --request POST https://faucet.devnet.aptoslabs.com/mint?address=0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f&amount=10000000000000000

# https://explorer.aptoslabs.com/txn/0xdfad80df34903e80c19aa7763ab5226dade4d1af3aad0aaf2d25b4532f7746e1
aptos move publish  --assume-yes  --gas-unit-price 100

aptos account list --account 0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f

# https://explorer.aptoslabs.com/txn/0x9d44423f7f3e6640cce0b7bbb88bbcd28a644774d265939d90db20ac95a4e33b
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::mint_me  --args u64:10000000000

# https://explorer.aptoslabs.com/txn/0xb26291fd438d70307eeca9bc2ace042c60ee369073c5c96fa9449056cac6ec27
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::mint_me  --args u64:10000000000

# https://explorer.aptoslabs.com/txn/0xa0fe8b3247479ef092c8ee790c2041e5ea0a24027132498c768a3e434c1fefe8
aptos move run --assume-yes --function-id 0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f::router::create_pool --type-args 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::USDC  0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::USDT

# https://explorer.aptoslabs.com/txn/0x436956dc2df3f8c6f1b0fdfc1641a378df2af4841ba29b2ed076f39b4a280fe3
aptos move run --assume-yes --function-id 0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f::router::add_to_pool --type-args 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::USDC  0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::USDT --args u64:10000000000 u64:10000000000

# https://explorer.aptoslabs.com/txn/0x90a940cbe7246fb09bc148555ce48cdb2e8448ba51f97e5e51e8e97cf8a88180
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::mint_me  --args u64:1000

# https://explorer.aptoslabs.com/txn/0x5b57e25cf201828e89438eaa7cd77c357e0721d15726da2f8b715d9bb3268fc9
aptos move run --assume-yes --function-id 0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f::router::swap --type-args 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::USDC  0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::USDT --args u64:1000

# https://explorer.aptoslabs.com/txn/0x7b8db6d851503e7e14af7bfcb87729c8d6ba5b44caf5ec7e066157b7e0f9a06e
aptos move run --assume-yes --function-id 0x1e836c5da93612547c40d3448d268494e31ac8f063ee163d562b86095dd1318f::router::swap --type-args 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::USDT 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::USDC   --args u64:1000


