// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {Core} from "../src/Core.sol";
import {HelperConfig} from "./HelperConfig.sol";

contract DeployCore is Script {
    function run () external returns (Core) {

        HelperConfig helper = new HelperConfig();
        (address deployerKey) = helper.activeConfig();
        vm.startBroadcast(deployerKey);
        Core core = new Core();
        vm.stopBroadcast();
        
        return (core);
    }
}