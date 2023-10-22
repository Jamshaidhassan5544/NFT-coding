pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNFT} from "src/BasicNFT.sol";
contract interaction is Script
{
    string public constant pug= "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run()external   
    {
        address most_recent_deployment= DevOpsTools.get_most_recent_deployment("BasicNFT",block.chainid);
        mintNftOnContract(most_recent_deployment);
    }
    function mintNftOnContract(address contractAddress) public 
    {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNFT(pug);
        vm.stopBroadcast();
    }
}
