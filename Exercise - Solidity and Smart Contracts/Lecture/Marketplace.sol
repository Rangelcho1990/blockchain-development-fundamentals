// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Event} from "./Event.sol";

error InvalidInput(string info);
error AlreadyListed();
error MustBeOrganazier();
error WrongBuyingOption();
error ProfitDestributionFailed();

enum ByuingOption {
    FixedPrice,
    Bidding
}

struct EventData {
    uint256 ticketPrice;
    ByuingOption sellType;
    uint256 sellsEnds; // timestamp
}

contract Marketplace {
    uint256 public constant MIN_SALE_PERIOD = 24 hours;
    uint256 public constant SALE_FEE = 0.1 ether;

    address public immutable feeCollector;

    mapping(address => EventData) public events;
    mapping(address => uint256) public profits;

    event NewEvent(address indexed newEvent);

    constructor(address feeCollector_) {
        feeCollector = feeCollector_;
    }

    function createEvent(
        string memory eventName,
        uint256 date,
        string memory location,
        uint256 ticketPrice,
        ByuingOption sellType,
        uint256 sellsEnds
    ) external {
        address newEvent = address(
            new Event(address(this), eventName, date, location, msg.sender)
        );

        emit NewEvent(newEvent);

        _listEvent(newEvent, ticketPrice, sellType, sellsEnds);
    }

    function listEvent(
        address newEvent,
        uint256 ticketPrice,
        ByuingOption sellType,
        uint256 sellsEnds
    ) external {
        if (msg.sender != Event(newEvent).organazier()) {
            revert MustBeOrganazier();
        }

        _listEvent(newEvent, ticketPrice, sellType, sellsEnds);
    }

    function _listEvent(
        address newEvent,
        uint256 ticketPrice,
        ByuingOption sellType,
        uint256 sellsEnds
    ) internal {
        // TODO: Ensure External Event is comatible with IEvent
        if (sellsEnds < block.timestamp + MIN_SALE_PERIOD) {
            revert InvalidInput("sellsEnds is invalid");
        }

        if (ticketPrice < SALE_FEE) {
            revert InvalidInput("ticketPrice >= SALE_FEE");
        }

        if (events[newEvent].sellsEnds != 0) {
            revert AlreadyListed();
        }

        events[newEvent] = EventData({
            ticketPrice: ticketPrice,
            sellType: sellType,
            sellsEnds: sellsEnds
        });
    }

    // TODO: CHECK FOR REENTRANCY ATTACK POSIBILITIES
    function buyTicket(
        address event_
    )  external payable {
        if (events[event_].sellType != ByuingOption.FixedPrice) {
            revert WrongBuyingOption();
        }

        if (msg.value != events[event_].ticketPrice) {
            revert InvalidInput("wrong value");
        }

        profits[Event(event_).organazier()] += msg.value - SALE_FEE;
        profits[feeCollector] += SALE_FEE;

        Event(event_).safeMint(msg.sender);
    }

    function withdrwaProvift(
        address to
    ) external payable {
        uint256 profit = profits[msg.sender];
        profits[msg.sender] = 0;

        (bool success, ) = to.call{value: profit}("");
        if (!success) {
         revert ProfitDestributionFailed();
        }
    }

    // testing from lecture start at 1:34:50 
}
