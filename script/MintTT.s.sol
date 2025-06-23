// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {TTToken} from "../src/TT.sol";

contract MintTTScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address recipient = vm.addr(deployerPrivateKey);
        uint256 amount = 10000000 * 10 ** 18;

        address contractAddress = 0x76d6E4191f0A8cCBd99212B67145Ef019eAcE169;
        TTToken token = TTToken(contractAddress);

        vm.startBroadcast(deployerPrivateKey);

        token.mint(recipient, amount);

        vm.stopBroadcast();
    }
}
