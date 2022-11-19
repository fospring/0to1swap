curl --location --request POST https://faucet.devnet.aptoslabs.com/mint?address=0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43&amount=10000000000000000

# https://explorer.aptoslabs.com/txn/0x5c4f4671c6c355728d8f1464c0e64517e149395213ddb1fd1fa186b9f0fc3383
aptos move publish  --gas-unit-price 100

# https://explorer.aptoslabs.com/txn/0x97c7f7ed766163abf41934ea289b81728b5e69a207ade499c2ea5c26d8b1ee07
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::init

# https://explorer.aptoslabs.com/txn/0x699838394d8cffe441703f4bcf3ddff045947fc6a9e7b011b15c2ceb2a44e655
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::init

# https://explorer.aptoslabs.com/txn/0xa1cf59c6670bad34165b9a1d71a1fdb90f3fe1d8ff5f35781fdf7d4f90da4ea9
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdc::mint_me  --args u64:10000000000
# https://explorer.aptoslabs.com/txn/0xb3984e299e0069346723ce87155d67634786bcad503a71aa2e8e1a9644c8027e
aptos move run --assume-yes --function-id 0xb00e9e309443456360395130e397cc8cb066308ef513532ffc2bb7f683b71f43::usdt::mint_me  --args u64:10000000000

