curl --location --request POST https://faucet.devnet.aptoslabs.com/mint?address=0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15&amount=10000000000000000

aptos account list --query balance --account 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15

# https://explorer.aptoslabs.com/txn/0x5c4f4671c6c355728d8f1464c0e64517e149395213ddb1fd1fa186b9f0fc3383
aptos move publish  --gas-unit-price 100

aptos account list --query modules --account 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15

# https://explorer.aptoslabs.com/txn/0x97c7f7ed766163abf41934ea289b81728b5e69a207ade499c2ea5c26d8b1ee07
aptos move run --assume-yes --function-id 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15::usdc::init

# https://explorer.aptoslabs.com/txn/0x699838394d8cffe441703f4bcf3ddff045947fc6a9e7b011b15c2ceb2a44e655
aptos move run --assume-yes --function-id 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15::usdt::init

# https://explorer.aptoslabs.com/txn/0xa1cf59c6670bad34165b9a1d71a1fdb90f3fe1d8ff5f35781fdf7d4f90da4ea9
aptos move run --assume-yes --function-id 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15::usdc::mint_me  --args u64:10000000000
# https://explorer.aptoslabs.com/txn/0xb3984e299e0069346723ce87155d67634786bcad503a71aa2e8e1a9644c8027e
aptos move run --assume-yes --function-id 0x764c516b5e8fe2e09281686a2d6e3de5d314f65dc2bbdec78431f18414d5ac15::usdt::mint_me  --args u64:10000000000

