//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test} from "forge-std/Test.sol";
import {DeployNFT} from "script/DeployNFT.s.sol";
import {BasicNFT} from "src/BasicNFT.sol";
contract TestBasicNft is Test 
{
    DeployNFT public deployer;
    BasicNFT public nft;
    address public user=makeAddr("user");
    string public constant pug= "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function setUp() public 
    {
        deployer= new DeployNFT();
        nft= deployer.run();
    }
    function testNameIsSame() public view 
    {
        string memory name= "Jamie";
        string memory actualName= nft.name();
        assert(keccak256(abi.encodePacked(name))==keccak256(abi.encodePacked(actualName)));
    }
    function testMintNFT() public 
    {
        vm.prank(user);
        nft.mintNFT(pug);
        assert(nft.balanceOf(user)==1);
        assert(keccak256(abi.encodePacked(pug))==keccak256(abi.encodePacked(nft.tokenURI(0))));
    }
}
