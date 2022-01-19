// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Donor {
    constructor() {}

    /// Stores the donors in this state variable
    mapping(address => Donors) public allDonors;

    /// All the donors who have provided consent
    /// @dev After the donor provides consent a copy of them is stored here
    mapping(address => mapping(address => bool)) consentsProvided;

    /// The donor who are eligible for donation
    mapping(address => address) validDonors;

    uint256 donorsCount = 0;
    uint256 validDonorsCount = 0;

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

    /// Creates Donor Record in the blockchain
    /// @dev stored in mapping allDonors where donor wallet Address will be the key
    /// isValidDonor will be set by the doctor performing the inspection through another function
    /// @param _name name of the donor
    /// @param _tempAddr temporary addr of the donor
    /// @param _permAddr permanent addr of the donor
    /// @param _phoneNo phone number of the donor
    /// @param _age age of the donor
    /// @param _sex gender of the donor
    /// @param _bloodGroup blood group of the donor
    /// @param _organs oragans registered for donation
    /// @param _donorAddress wallet address of the donor
    /// @param _isValidDonor flag to see if the donor is eligible for donation
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
        donorsCount++;

        allDonors[_donorAddress] = Donors(
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

    /// Donor provides consent to patient using this function
    /// @dev used to check the consent given for the transplants to specific patient by the donor
    /// @param _donorAddress wallet address of the donor
    /// @param _patientAddress wallet address of the patient
    function provideConsentForDonation(
        address _donorAddress,
        address _patientAddress
    ) public {
        consentsProvided[_donorAddress][_patientAddress] = true;
    }

   /// Check if consent is provided
   /// @dev consentsProvided mapping will store the value
   /// @param _donorAddress wallet address of the donor
   /// @param _patientAddress wallet address of the patient
   /// @return _consented the return variables of a contract’s function state variable
    function checkForConsent(address _donorAddress, address _patientAddress)
        public
        view
        returns (bool _consented)
    {
        _consented = consentsProvided[_donorAddress][_patientAddress];
    }

    /// Doctor sets the donor valid using this function
    /// @param _donorAddr wallet address of the donor
    /// @param _approvedBy wallet address of the doctor who has approved
    function setDonorAsValid(address _donorAddr, address _approvedBy) public {
        allDonors[_donorAddr].isValidDonor = true;
        validDonors[_donorAddr] = _approvedBy;
        validDonorsCount++;
    }

   /// Setter function for invalid Donor
   /// @dev Doctor will set the donor as invalid after checkup
   /// @param _donorAddr wallet address of the donor
   /// @param _approvedBy wallet address of the doctor
    function setDonorAsInValid(address _donorAddr, address _approvedBy) public {
        allDonors[_donorAddr].isValidDonor = false;
        validDonors[_donorAddr] = _approvedBy;
        validDonorsCount--;
    }

    /// function to check if he/she is valid donor
    /// @param _donorAddr wallet address of the donor
    /// @return result 
    function isValidDonor(address _donorAddr) public returns (bool result) {
        allDonors[_donorAddr].isValidDonor = true;
        result = allDonors[_donorAddr].isValidDonor;
    }

    /// Check if donor exists in the blockchain
    /// @dev if wallet address of the donor is default, then not present in mapping allDonors
    /// @param _donorAddr address of the donor
    /// @return result
    function existsDonor(address _donorAddr) public view returns (bool result) {
        if (allDonors[_donorAddr].donorAddress == address(0)) {
            result = false;
        } else result = true;
    }
}
