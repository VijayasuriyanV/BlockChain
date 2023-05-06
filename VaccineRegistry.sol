pragma solidity ^0.8.0;

contract VaccineRegistry {
    
    struct Vaccine {
        string vaccineName;
        string manufacturer;
        string lotNumber;
        uint256 expirationDate;
        uint256 dateAdministered;
        address administeredBy; 
        bool isValid;
    }

    mapping (bytes32 => Vaccine) vaccines;
    mapping (address => bool) authorizedAdministers;

    event VaccineAdded(bytes32 vaccineHash);
    event VaccineUpdated(bytes32 vaccineHash);

    constructor() {
        authorizedAdministers[msg.sender] = true;
    }

    modifier onlyAuthorized() {
        require(authorizedAdministers[msg.sender], "Not authorized.");
        _;
    }

    function authorizeAdminister(address _administer) public onlyAuthorized {
        authorizedAdministers[_administer] = true;
    }

    function addVaccine(string memory _vaccineName, string memory _manufacturer, string memory _lotNumber, uint256 _expirationDate, uint256 _dateAdministered, address _administeredBy) public onlyAuthorized {
        bytes32 vaccineHash = keccak256(abi.encodePacked(_vaccineName, _manufacturer, _lotNumber, _expirationDate, _dateAdministered, _administeredBy));
        require(!vaccines[vaccineHash].isValid, "Vaccine already added.");
        Vaccine memory vaccine = Vaccine({
            vaccineName: _vaccineName,
            manufacturer: _manufacturer,
            lotNumber: _lotNumber,
            expirationDate: _expirationDate,
            dateAdministered: _dateAdministered,
            administeredBy: _administeredBy,
            isValid: true
        });
        vaccines[vaccineHash] = vaccine;
        emit VaccineAdded(vaccineHash);
    }

    function updateVaccine(string memory _vaccineName, string memory _manufacturer, string memory _lotNumber, uint256 _expirationDate, uint256 _dateAdministered, address _administeredBy) public onlyAuthorized {
        bytes32 vaccineHash = keccak256(abi.encodePacked(_vaccineName, _manufacturer, _lotNumber, _expirationDate, _dateAdministered, _administeredBy));
        require(vaccines[vaccineHash].isValid, "Vaccine does not exist.");
        Vaccine memory vaccine = vaccines[vaccineHash];
        vaccine.isValid = false;
        vaccines[vaccineHash] = vaccine;
        addVaccine(_vaccineName, _manufacturer, _lotNumber, _expirationDate, _dateAdministered, _administeredBy);
        emit VaccineUpdated(vaccineHash);
    }

    function getVaccine(string memory _vaccineName, string memory _manufacturer, string memory _lotNumber, uint256 _expirationDate, uint256 _dateAdministered, address _administeredBy) public view returns (string memory, string memory, string memory, uint256, uint256, address, bool) {
        bytes32 vaccineHash = keccak256(abi.encodePacked(_vaccineName, _manufacturer, _lotNumber, _expirationDate, _dateAdministered, _administeredBy));
        require(vaccines[vaccineHash].isValid, "Vaccine does not exist.");
        Vaccine memory vaccine  = vaccines[vaccineHash];
        return (
            vaccine.vaccineName,
            vaccine.manufacturer,
            vaccine.lotNumber,
            vaccine.expirationDate,
            vaccine.dateAdministered,
            vaccine.administeredBy,
            vaccine.isValid
        );
    }
}
