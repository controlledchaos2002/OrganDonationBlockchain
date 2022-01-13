// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Donor {
    constructor() {}

    // Donors[] allDonors;
    mapping(address => Donors) allDonors;
    mapping(address => mapping(address => bool)) consentsProvided;
    uint donorsCount = 0;

    struct Donors {
        string name;
        string tempAddress;
        string permAddress;
        string phoneNo;
        string age;
        string sex;
        string bloodGroup;
        string donatingOrgans;
        address donorAddress;
        bool isConsentGiven;
    }

    // struct Organs{
    //   string name;
    // }

    function createDonor(
        string memory _name,
        string memory _tempAddr,
        string memory _permAddr,
        string memory _phoneNo,
        string memory _age,
        string memory _sex,
        string memory _bloodGroup,
        string memory _organs,
        address _donorAddress,
        bool _isConsentGiven
    ) public {

      donorsCount ++;

      allDonors[_donorAddress] = 
            Donors(
                _name,
                _tempAddr,
                _permAddr,
                _phoneNo,
                _age,
                _sex,
                _bloodGroup,
                _organs,
                _donorAddress,
                _isConsentGiven
            );
    }

    function provideConsentForDonation(address _donorAddress, address _patientAddress) public {
        consentsProvided[_donorAddress][_patientAddress] = true;
    }

    function checkForConsent(address _donorAddress, address _patientAddress) public view returns(bool _consented) {
        _consented = consentsProvided[_donorAddress][_patientAddress];
    }
}
