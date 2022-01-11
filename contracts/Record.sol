// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Record {
    constructor() {}

//     struct Records {
//         Entry[] diagnosedEntries;
//     }

//     struct Entry {
//         string date;
//         string hospitalName;
//         string diagnosedWith;
//         string medicationsProvided;
//         address diagnosedBy;
//     }

//     mapping(address => Records) allRecords;
    
//     Entry[] entries;
//     function createRecord(
//         string memory _date,
//         string memory _hospitalName,
//         string memory _diagnosedWith,
//         string memory _medicationsProvided,
//         address _diagnosedBy,
//         address _patientAddress
//     ) public {
//         entries.push(
//             Entry(
//                 _date,
//                 _hospitalName,
//                 _diagnosedWith,
//                 _medicationsProvided,
//                 _diagnosedBy
//             )
//         );

//         allRecords[_patientAddress] = Records(entries);
//     }

    struct PatientRecord{
        string date;
        string hospitalName;
        string diagnosedWith;
        string medicationProvided;
        address diagnosedby;
    }
    
    mapping(address => mapping(uint => PatientRecord)) patientRecords;
    uint recordID =0;

    function createRecord(
        address _patientAddress,
        string memory _date,
        string memory _hospitalName,
        string memory _dignosedWith,
        string memory _medicationProvided,
        address _diagnosedBy
        ) public {
            recordID ++;
            patientRecords[_patientAddress][recordID] = PatientRecord(
                _date,
                _hospitalName,
                _dignosedWith,
                _medicationProvided,
                _diagnosedBy
                );
    }

    function removeRecord(uint id,address _patientAddress) public {
        delete patientRecords[_patientAddress][id];
    }
}
