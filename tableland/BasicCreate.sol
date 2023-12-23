// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@tableland/evm/contracts/utils/TablelandDeployments.sol";

contract BasicCreate is ERC721Holder {
	// A mapping that holds `tableName` and its `tableId`
    mapping(string => uint256) public tables;

    function create(string memory prefix) public payable {
        uint256 tableId = TablelandDeployments.get().create(
            address(this),
            /*
            *  CREATE TABLE {prefix}_{chainId} (
            *    id integer primary key,
            *    message text
            *  );
            */
            string.concat(
                "CREATE TABLE ",
                prefix,
                "_",
                Strings.toString(block.chainid),
                " (id integer primary key, message text);"
            )
        );

        string memory tableName = string.concat(
            prefix,
            "_",
            Strings.toString(block.chainid),
            "_",
            Strings.toString(tableId)
        );

        tables[tableName] = tableId;
    }
}