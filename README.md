# VaccineRegistry

The VaccineRegistry contract is a Solidity smart contract that enables the tracking and management of vaccine records. It allows authorized administrators to add and update vaccine information, and provides a function to retrieve vaccine details.

## Features

- **Authorization**: The contract implements an authorization mechanism where only authorized administrators can perform certain functions.

- **Vaccine Tracking**: The contract maintains a mapping of vaccine hashes to their corresponding details, including vaccine name, manufacturer, lot number, expiration date, date administered, administering address, and validity status.

- **Adding Vaccines**: Authorized administrators can add new vaccine records by providing the necessary details. Each vaccine is identified by a unique hash derived from its attributes.

- **Updating Vaccines**: Authorized administrators can update existing vaccine records. When an update is performed, the previous vaccine record is marked as invalid and a new record with the updated details is added.

- **Retrieving Vaccine Details**: The contract provides a function to retrieve the details of a specific vaccine by specifying its attributes.

## Usage

1. Deploy the contract: Deploy the `VaccineRegistry.sol` contract on a compatible Ethereum blockchain.

2. Authorization: The contract constructor sets the deploying address as an authorized administrator. Additional administrators can be authorized by calling the `authorizeAdminister` function, passing the address to be authorized.

3. Adding Vaccines: Authorized administrators can add new vaccines by calling the `addVaccine` function, providing the vaccine details such as name, manufacturer, lot number, expiration date, date administered, and administering address.

4. Updating Vaccines: Authorized administrators can update existing vaccines by calling the `updateVaccine` function, providing the updated vaccine details. The previous vaccine record will be marked as invalid, and a new record with the updated details will be added.

5. Retrieving Vaccine Details: Call the `getVaccine` function, passing the attributes of the vaccine to retrieve its details.

## Contract Deployment

The contract can be deployed on Ethereum-compatible blockchains, such as the Ethereum mainnet, Ropsten testnet, or a local development network. Ensure that you have the necessary development environment set up, including a compatible Solidity compiler and a deployment tool such as Remix or Truffle.

## Development and Testing

The contract can be further developed and tested based on specific requirements. Use Solidity development tools, such as Solidity IDEs and testing frameworks, to enhance the contract's functionality and perform thorough testing.

## Disclaimer

This contract is provided as a sample implementation and should not be used in a production environment without appropriate security audits and modifications to meet specific use case requirements.

## License

This project is licensed under the [MIT License](LICENSE).

