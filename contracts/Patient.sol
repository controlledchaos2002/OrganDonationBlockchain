// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Admin.sol";

contract Patient {
    constructor() {}

    // Admin admin;
    // Patients[] allPatients;

    // struct Patients {
    //     string name;
    //     string permanentAddress;
    //     string temporaryAddress;
    //     string phoneNumber;
    //     string age;
    //     string sex;
    //     string bloodGroup;
    //     address patientWalletAddress;
    // }

    // function registerPatient(
    //     string memory _name,
    //     string memory _perAddr,
    //     string memory _tempAddr,
    //     string memory _phoneNo,
    //     string memory _age,
    //     string memory _sex,
    //     string memory _bloodGroup,
    //     address _patientwalletAddr
    // ) public {
    //     require(msg.sender == admin.HOSPITAL_ADMIN());
    //     allPatients.push(
    //         Patients(
    //             _name,
    //             _perAddr,
    //             _tempAddr,
    //             _phoneNo,
    //             _age,
    //             _sex,
    //             _bloodGroup,
    //             _patientwalletAddr
    //         )
    //     );
    // }

    mapping(address => Patients) allPatients;
    struct Patients {
        string name;
        string permanentAddress;
        string temporaryAddress;
        string phoneNumber;
        string age;
        string sex;
        string bloodGroup;
        address createdBy;
    }

    function createPatient(
        string memory _name,
        string memory _permAddr,
        string memory _tempAddr,
        string memory _phoneNo,
        string memory _age,
        string memory _sex,
        string memory _bloodGroup,
        address _patientWalletAddr,
        address _createdBy
    ) public {
        allPatients[_patientWalletAddr] = 
        Patients(_name,
        _permAddr,
        _tempAddr,
        _phoneNo,
        _age,
        _sex,
        _bloodGroup,
        _createdBy);
    }

    
}
