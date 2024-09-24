// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BatchEns} from "../src/BatchEns.sol";

contract BatchEnsTest is Test {
    BatchEns public batchEns;
    uint256 mainnetFork;

    function setUp() public {
        // mainnetFork = vm.createFork("https://eth-mainnet.g.alchemy.com/v2/DlToxt17q3KWS2S5rHXMXVAdusnUDx8O");
        batchEns = new BatchEns();
    }

    function test_AddressToName() public {
        // vm.selectFork(mainnetFork);
        address test = 0xFFaCD334696Ad0c43A2fC0588a855f20eDd9bdf9;
        string memory name = batchEns.addressToName(test);
        console.log(name);

    }

    function test_AddressesToNames() public {



    }

    function test_GetNode() public {
        // console.log(mainnetFork);
        address test = 0x225f137127d9067788314bc7fcc1f36746a3c3B5;
        // bytes32 node = batchEns.getNode(test);
        // console.log(node);
        
    }
}
