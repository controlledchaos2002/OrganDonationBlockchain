// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Hospital {
    constructor() {}

    struct Hospitals {
        string name;
        string hospitalAddress;
        string pincode;
        string city;
        string state;
    }

    uint256 hospitalCount = 0;
    mapping(address => uint256) acceptedOrgans;
    mapping(address => Hospitals) hospitals;

    function registerHospital(
        string memory _hname,
        string memory _hAddr,
        string memory _pincode,
        string memory _city,
        string memory _state,
        address _hwalletAddr
    ) public {
        hospitalCount++;
        hospitals[_hwalletAddr] = Hospitals(
            _hname,
            _hAddr,
            _pincode,
            _city,
            _state
        );
    }
}
