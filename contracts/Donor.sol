// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Donor {
    constructor() {}

    // Donors[] allDonors;
    mapping(address => Donors) allDonors;
    mapping(address => mapping(address => bool)) consentsProvided;
    mapping(address => address) validDonors;
    uint donorsCount = 0;
    uint validDonorsCount = 0;

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
        bool isValidDonor;
    }

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
        bool _isValidDonor
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
                _isValidDonor
            );
    }


    /**
    @dev - consent provided for donating to patient
     */
    function provideConsentForDonation(address _donorAddress, address _patientAddress) public {
        consentsProvided[_donorAddress][_patientAddress] = true;
    }


    /**
    @dev - check if consent is available for the patient address
     */
    function checkForConsent(address _donorAddress, address _patientAddress) public view returns(bool _consented) {
        _consented = consentsProvided[_donorAddress][_patientAddress];
    }

    function setDonorAsValid(address _donorAddr,address _approvedBy) public {
        allDonors[_donorAddr].isValidDonor = true;
        validDonors[_donorAddr] = _approvedBy;
        validDonorsCount ++;
    }

    /**
    @dev - set donor as invalid and adress of the one setting it.
     */
    function setDonorAsInValid(address _donorAddr,address _approvedBy) public {
        allDonors[_donorAddr].isValidDonor = false;
        validDonors[_donorAddr] = _approvedBy;
        validDonorsCount --;
    }
}
