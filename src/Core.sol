// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

error InvalidCertificate();
error RevokedCertificate();
contract Core {
    struct Admin {
        bytes adminName;
        bytes university;
    }

    enum CertificateType {
        DEGREE,
        TRANSCRIPT,
        DIPLOMA,
        OTHER
    }

    struct Certificate {
        bytes32 certHash;
        string ipfsCID;
        CertificateType certType;
        address issuedBy;
        uint256 issuedAt;
        bool revoked;
    }

    mapping(bytes32 certHash => Certificate cert) private certificates;
    mapping(address admin => Admin) private admins;

    constructor () {
        bytes memory adminName = bytes("Hud Saidi Buhero");
        bytes memory university = bytes("University of Dar es Salaam");
        Admin memory admin = Admin (
            adminName, university
        );

        admins[msg.sender] = admin;
    }

    modifier onlyAdmin(address admin) {
        if (!isAdmin(admin)) revert();
        _;
    }

    function isAdmin(address admin) public view returns (bool) {
        return admins[admin].adminName.length != 0;
    }

    function issueCertificate(bytes32 certHash, string memory ipfsCID, CertificateType certType) public onlyAdmin(msg.sender){
        certificates[certHash] = Certificate(certHash, ipfsCID, certType, msg.sender, block.timestamp, false);
    }

    function verifyCertificate(bytes32 certHash) public view returns(bool){
        Certificate memory certificate = certificates[certHash];
        if (certificate.issuedBy == address(0)) revert InvalidCertificate();

        if (certificate.revoked ) revert RevokedCertificate();

        return true;
    }

    function getCertificate(bytes32 certHash) public view returns (Certificate memory) {
        return certificates[certHash];
    }

    function getAdmin(address adminAddress) public view returns (string memory, string memory){
        Admin memory admin = admins[adminAddress];

        return (string(admin.adminName), string(admin.university));
    }
}
