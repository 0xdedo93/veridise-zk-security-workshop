# Findings

```
Critical: the project will definitely get hacked upon deployment.
High: the project will likely get hacked, but an attacker will need some luck on their side.
Medium: the project will likely get hacked, but the impact of the hack won't be detrimental.
Low: the project might get hacked, but the attack surface and impact are minimal.
Warning: the project won't get hacked, but code quality can be improved.
Info: the project won't get hacked, but the developers follow bad engineering practices.
```

-   [Critical] Uncostrained subcomponent output circuit [?][check with picus]
-   [Critical] Circuit signal not deterministic [?]
-   [Medium] Uncostrained input circtuit [?][check with picus]
-   [Medium] Reentrancy 1
-   [Medium] Unused return
-   [Low] Reentrancy 3
-   [Warning] State variables could be declared immutable
-   [Info] Unused state variable
-   [Info] Use of Assembly
-   [Info] Dead code
-   [Info] Different versions of Solidity are used

# Tools Output

## circuits

### vk-Vanguard

#### balance_membership.circom

```
- non-det-wit: [CRITICAL] In template MerkleTreeInclusionProof in tree.circom:14, Vanguard found a signal used inside a conditional: * Signal index in tree.circom:32

- uc-inputs:   [MEDIUM] In template Membership in membership.circom:48, Vanguard found an input signal that is unconstrained: * Signal receiver
```

#### auction_bid.circom

```
- uc-subcmp-outputs: [CRITICAL] In template Bid in bid.circom:11, Vanguard found a subcomponent output signal that is unconstrained: * Signal balCheck.out
```

## contracts

### slither

```
INFO:Detectors:
Auction.constructor(address,address,address,IBidVerifier) (../packages/contracts/contracts/Auction.sol#47-50) calls AuctionEscrow.constructor(address,address) (../packages/contracts/contracts/base/AuctionEscrow.sol#22-26) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.createAuction(uint256,address,uint256,uint256) (../packages/contracts/contracts/Auction.sol#53-70) calls AuctionAdmin._createAuction(uint256) (../packages/contracts/contracts/base/AuctionAdmin.sol#20-31) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.addMembers(uint256,uint256[]) (../packages/contracts/contracts/Auction.sol#97-109) calls AuctionAdmin._addMember(uint256,uint256) (../packages/contracts/contracts/base/AuctionAdmin.sol#36-52) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.bid(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256[],uint256[20],uint256[8]) (../packages/contracts/contracts/Auction.sol#132-175) calls AuctionEscrow._setBal(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#73-75) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.reveal(uint256,uint256,uint256,address,uint256,uint256,uint256[8]) (../packages/contracts/contracts/Auction.sol#177-190) calls AuctionEscrow._balanceHash(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#28-30) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.refund(uint256,uint256,uint256,uint256,uint256[],uint256,uint256[]) (../packages/contracts/contracts/Auction.sol#192-200) calls AuctionEscrow._balanceHash(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#28-30) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Auction.refund(uint256,uint256,uint256,uint256,uint256[],uint256,uint256[]) (../packages/contracts/contracts/Auction.sol#192-200) calls AuctionEscrow._depositToExisting(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#66-71) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
AuctionEscrow.deposit(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#32-39) calls AuctionEscrow._balanceHash(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#28-30) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
AuctionEscrow.deposit(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#41-50) calls AuctionEscrow.deposit(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#32-39) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
AuctionEscrow.deposit(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#41-50) calls AuctionEscrow._depositToExisting(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#66-71) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
AuctionEscrow.withdraw(uint256,uint256,uint256,address,uint256,uint256,uint256[],uint256[8]) (../packages/contracts/contracts/base/AuctionEscrow.sol#52-64) calls AuctionEscrow._balanceHash(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#28-30) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
AuctionEscrow._depositToExisting(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#66-71) calls AuctionEscrow._balanceHash(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#28-30) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
IncrementalBinaryTree.update(IncrementalTreeData,uint256,uint256,uint256[],uint256) (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#169-209) calls IncrementalBinaryTree.verify(IncrementalTreeData,uint256,uint256[],uint256) (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#231-261) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
IncrementalBinaryTree.remove(IncrementalTreeData,uint256,uint256[],uint256) (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#216-223) calls IncrementalBinaryTree.update(IncrementalTreeData,uint256,uint256,uint256[],uint256) (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#169-209) which halt the execution return(uint256,uint256)(0,0x20) (poseidon-solidity/PoseidonT3.sol#388)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-assembly-return
INFO:Detectors:
Reentrancy in Auction.distribute(uint256) (../packages/contracts/contracts/Auction.sol#202-208):
	External calls:
	- nft.safeTransferFrom(address(this),auctions[auctionId].winner,auctions[auctionId].tokenId) (../packages/contracts/contracts/Auction.sol#203)
	State variables written after the call(s):
	- auctions[auctionId].winningAmt = 0 (../packages/contracts/contracts/Auction.sol#205)
	Auction.auctions (../packages/contracts/contracts/Auction.sol#17) can be used in cross function reentrancies:
	- Auction.afterAuction(uint256) (../packages/contracts/contracts/Auction.sol#40-43)
	- Auction.bid(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256[],uint256[20],uint256[8]) (../packages/contracts/contracts/Auction.sol#132-175)
	- Auction.createAuction(uint256,address,uint256,uint256) (../packages/contracts/contracts/Auction.sol#53-70)
	- Auction.distribute(uint256) (../packages/contracts/contracts/Auction.sol#202-208)
	- Auction.duringBidding(uint256) (../packages/contracts/contracts/Auction.sol#28-32)
	- Auction.duringReveal(uint256) (../packages/contracts/contracts/Auction.sol#34-38)
	- Auction.getAuctionCompleteTimestamp(uint256) (../packages/contracts/contracts/Auction.sol#80-82)
	- Auction.getRevealTimestamp(uint256) (../packages/contracts/contracts/Auction.sol#76-78)
	- Auction.getStartTimestamp(uint256) (../packages/contracts/contracts/Auction.sol#72-74)
	- Auction.onlyAuctionAdmin(uint256) (../packages/contracts/contracts/Auction.sol#21-26)
	- Auction.refund(uint256,uint256,uint256,uint256,uint256[],uint256,uint256[]) (../packages/contracts/contracts/Auction.sol#192-200)
	- Auction.reveal(uint256,uint256,uint256,address,uint256,uint256,uint256[8]) (../packages/contracts/contracts/Auction.sol#177-190)
	- Auction.updateAuctionAdmin(uint256,address) (../packages/contracts/contracts/Auction.sol#85-89)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities-1
INFO:Detectors:
AuctionEscrow.deposit(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#32-39) ignores return value by escrowTree.insert(bal) (../packages/contracts/contracts/base/AuctionEscrow.sol#36)
AuctionAdmin._addMember(uint256,uint256) (../packages/contracts/contracts/base/AuctionAdmin.sol#36-52) ignores return value by merkleTrees[auctionId].insert(leaf) (../packages/contracts/contracts/base/AuctionAdmin.sol#42)
Auction.bid(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256[],uint256[20],uint256[8]) (../packages/contracts/contracts/Auction.sol#132-175) ignores return value by auctions[auctionId].bids.insert(bidLeaf) (../packages/contracts/contracts/Auction.sol#173)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-return
INFO:Detectors:
Reentrancy in Auction.createAuction(uint256,address,uint256,uint256) (../packages/contracts/contracts/Auction.sol#53-70):
	External calls:
	- nft.safeTransferFrom(msg.sender,address(this),tokenId) (../packages/contracts/contracts/Auction.sol#67)
	Event emitted after the call(s):
	- AuctionCreated(auctionId,tokenId,admin,duration) (../packages/contracts/contracts/Auction.sol#69)
Reentrancy in AuctionEscrow.deposit(uint256,uint256) (../packages/contracts/contracts/base/AuctionEscrow.sol#32-39):
	External calls:
	- require(bool)(token.transferFrom(msg.sender,address(this),amount)) (../packages/contracts/contracts/base/AuctionEscrow.sol#37)
	Event emitted after the call(s):
	- Deposit(commitment,0,amount,commitmentInd[commitment]) (../packages/contracts/contracts/base/AuctionEscrow.sol#38)
Reentrancy in AuctionEscrow.deposit(uint256,uint256,uint256,uint256[]) (../packages/contracts/contracts/base/AuctionEscrow.sol#41-50):
	External calls:
	- require(bool)(token.transferFrom(msg.sender,address(this),amount)) (../packages/contracts/contracts/base/AuctionEscrow.sol#48)
	Event emitted after the call(s):
	- Deposit(commitment,curBal,amount,commitmentInd[commitment]) (../packages/contracts/contracts/base/AuctionEscrow.sol#49)
Reentrancy in Auction.distribute(uint256) (../packages/contracts/contracts/Auction.sol#202-208):
	External calls:
	- nft.safeTransferFrom(address(this),auctions[auctionId].winner,auctions[auctionId].tokenId) (../packages/contracts/contracts/Auction.sol#203)
	- require(bool)(token.transfer(auctions[auctionId].admin,amt)) (../packages/contracts/contracts/Auction.sol#206)
	Event emitted after the call(s):
	- Distribute(auctionId,auctions[auctionId].tokenId,auctions[auctionId].winner,amt) (../packages/contracts/contracts/Auction.sol#207)
Reentrancy in AuctionEscrow.withdraw(uint256,uint256,uint256,address,uint256,uint256,uint256[],uint256[8]) (../packages/contracts/contracts/base/AuctionEscrow.sol#52-64):
	External calls:
	- require(bool)(token.transfer(receiver,amount)) (../packages/contracts/contracts/base/AuctionEscrow.sol#62)
	Event emitted after the call(s):
	- Withdraw(commitment,curBal,amount,commitmentInd[commitment]) (../packages/contracts/contracts/base/AuctionEscrow.sol#63)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities-3
INFO:Detectors:
PoseidonT3.hash(uint256[2]) (poseidon-solidity/PoseidonT3.sol#14-390) uses assembly
	- INLINE ASM (poseidon-solidity/PoseidonT3.sol#15-389)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#assembly-usage
INFO:Detectors:
Different versions of Solidity are used:
	- Version used: ['0.8.4', '>=0.7.0', '^0.8.0', '^0.8.4']
	- 0.8.4 (../packages/contracts/contracts/Auction.sol#2)
	- 0.8.4 (../packages/contracts/contracts/base/AuctionAdmin.sol#2)
	- 0.8.4 (../packages/contracts/contracts/base/AuctionEscrow.sol#2)
	- 0.8.4 (../packages/contracts/contracts/interfaces/IAuction.sol#2)
	- 0.8.4 (../packages/contracts/contracts/interfaces/IAuctionAdmin.sol#2)
	- 0.8.4 (../packages/contracts/contracts/interfaces/IBidVerifier.sol#2)
	- 0.8.4 (../packages/contracts/contracts/interfaces/IMembershipVerifier.sol#2)
	- >=0.7.0 (poseidon-solidity/PoseidonT3.sol#2)
	- ^0.8.0 (@openzeppelin/contracts/token/ERC20/IERC20.sol#4)
	- ^0.8.0 (@openzeppelin/contracts/token/ERC721/IERC721.sol#4)
	- ^0.8.0 (@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#4)
	- ^0.8.0 (@openzeppelin/contracts/utils/Context.sol#4)
	- ^0.8.0 (@openzeppelin/contracts/utils/introspection/IERC165.sol#4)
	- ^0.8.4 (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#2)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#different-pragma-directives-are-used
INFO:Detectors:
Context._msgData() (@openzeppelin/contracts/utils/Context.sol#21-23) is never used and should be removed
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#dead-code
INFO:Detectors:
Pragma version0.8.4 (../packages/contracts/contracts/Auction.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/base/AuctionAdmin.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/base/AuctionEscrow.sol#2) allows old versions
Pragma version^0.8.4 (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/interfaces/IAuction.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/interfaces/IAuctionAdmin.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/interfaces/IBidVerifier.sol#2) allows old versions
Pragma version0.8.4 (../packages/contracts/contracts/interfaces/IMembershipVerifier.sol#2) allows old versions
Pragma version^0.8.0 (@openzeppelin/contracts/token/ERC20/IERC20.sol#4) allows old versions
Pragma version^0.8.0 (@openzeppelin/contracts/token/ERC721/IERC721.sol#4) allows old versions
Pragma version^0.8.0 (@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#4) allows old versions
Pragma version^0.8.0 (@openzeppelin/contracts/utils/Context.sol#4) allows old versions
Pragma version^0.8.0 (@openzeppelin/contracts/utils/introspection/IERC165.sol#4) allows old versions
Pragma version>=0.7.0 (poseidon-solidity/PoseidonT3.sol#2) allows old versions
solc-0.8.4 is not recommended for deployment
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
INFO:Detectors:
IncrementalBinaryTree.SNARK_SCALAR_FIELD (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#23-24) is never used in IncrementalBinaryTree (../packages/contracts/contracts/base/IncrementalBinaryTree.sol#21-263)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-state-variable
INFO:Detectors:
Auction.bidVerifier (../packages/contracts/contracts/Auction.sol#13) should be immutable
Auction.nft (../packages/contracts/contracts/Auction.sol#14) should be immutable
AuctionEscrow.membershipVerifier (../packages/contracts/contracts/base/AuctionEscrow.sol#17) should be immutable
AuctionEscrow.token (../packages/contracts/contracts/base/AuctionEscrow.sol#16) should be immutable
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#state-variables-that-could-be-declared-immutable
INFO:Slither:../packages/contracts/contracts/Auction.sol analyzed (14 contracts with 93 detectors), 46 result(s) found
```
