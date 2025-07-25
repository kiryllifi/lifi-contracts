// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.17;

/// @title Interface for Across SpokePool
/// @author LI.FI (https://li.fi)
/// @custom:version 1.0.0
interface IAcrossSpokePool {
    function deposit(
        address recipient, // Recipient address
        address originToken, // Address of the token
        uint256 amount, // Token amount
        uint256 destinationChainId, // ⛓ id
        int64 relayerFeePct, // see #Fees Calculation
        uint32 quoteTimestamp, // Timestamp for the quote creation
        // solhint-disable-next-line max-line-length
        bytes memory message, // Arbitrary data that can be used to pass additional information to the recipient along with the tokens.
        uint256 maxCount // Used to protect the depositor from frontrunning to guarantee their quote remains valid.
    ) external payable;

    function depositV3(
        address depositor,
        address recipient,
        address inputToken,
        address outputToken,
        uint256 inputAmount,
        uint256 outputAmount, // <-- replaces fees
        uint256 destinationChainId,
        address exclusiveRelayer,
        uint32 quoteTimestamp,
        uint32 fillDeadline,
        uint32 exclusivityDeadline,
        bytes calldata message
    ) external payable;
}
