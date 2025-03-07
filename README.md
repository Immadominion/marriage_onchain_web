# Base Chain Marriage Certificate Minting App (Flutter)

## Project Overview

This project aims to develop a mobile application using Flutter that allows users on the Base blockchain to mint and manage marriage certificates as soulbound NFTs. The application will facilitate the creation of digital marriage certificates, displaying the couple's Base names, full names, and the ENS name of the officiant (marriage.onchain.base). Users will be able to initiate the certificate minting process by paying a fee in ETH on Base, and their partners can claim a free Base name (if needed) or mint their own copy of the certificate via a shared URL. A grid-based dashboard will enable users to view and explore other marriage certificates minted on the platform.

## Project Goals

* **Port Existing Functionality:** Migrate the core functionality of the existing TypeScript React application to a robust and performant Flutter mobile app.
* **User-Friendly Interface:** Create an intuitive and visually appealing user interface for seamless interaction.
* **Base Blockchain Integration:** Implement seamless integration with the Base blockchain for NFT minting, transaction handling, and ENS resolution.
* **Soulbound NFT Implementation:** Ensure that the minted marriage certificates are soulbound, preventing transfer or resale.
* **Fee Management:** Implement secure and transparent fee collection in ETH on the Base network.
* **Partner Claiming/Minting:** Provide a straightforward process for partners to claim a free Base name or mint their own copy of the certificate.
* **Certificate Display and Sharing:** Enable users to view, share, and explore other marriage certificates.
* **Cross Platform Functionality:** build a cross platform application that can be used on IOS and Android.

## Target Audience

* Individuals on the Base blockchain seeking to formalize their on-chain relationships.
* Users interested in exploring and collecting digital marriage certificates.
* Couples looking for a unique and verifiable way to commemorate their union.

## Functional Requirements

* **User Authentication:**
    * Connect to the application using a Web3 wallet (e.g., MetaMask, Coinbase Wallet).
* **Marriage Certificate Minting:**
    * Initiator enters partner's Base name and full name.
    * Initiator pays a fixed fee (e.g., $10 in ETH) on the Base network.
    * Application fetches and displays the officiant's ENS name (marriage.onchain.base).
    * Application generates a unique marriage certificate NFT with the required details.
    * NFT is minted as a soulbound token on the Base blockchain.
    * A link is generated to share with the partner.
* **Partner Claim/Mint:**
    * Partner receives a shareable link.
    * Partner can claim a free Base name if they don't have one.
    * Partner can mint their own copy of the certificate (soulbound).
* **Certificate Display:**
    * User can view their own minted certificates.
    * User can view other minted certificates in a grid layout.
    * Certificate details should be clearly displayed (couple's names, Base names, officiant, date).
* **Transaction History:**
    * Users can view their transaction history related to certificate minting.
* **Fee Handling:**
    * Secure and transparent fee collection in ETH on the Base network.
    * Display fee amount and transaction status.
* **Error Handling:**
    * Robust error handling for network issues, wallet connection, and transaction failures.

## Non-Functional Requirements

* **Performance:** The application should be responsive and performant on various devices.
* **Security:** Implement best practices for security to protect user data and funds.
* **Usability:** The application should be easy to use and navigate.
* **Scalability:** The application should be designed to handle a growing number of users and certificates.
* **Reliability:** The application should be stable and reliable.
* **Cross-Platform Compatibility:** The application must work seamlessly on both Android and iOS platforms.
* **Maintainability:** The codebase should be well-structured and documented for easy maintenance.

## Technology Stack

* **Flutter:** For cross-platform mobile application development.
* **Dart:** Programming language for Flutter.
* **Web3 Dart/Ethers Dart:** For interacting with the Base blockchain.
* **Base Blockchain:** The underlying blockchain network.
* **ENS (Ethereum Name Service):** For resolving Base names and officiant ENS.
* **Web3 Wallet Integration:** MetaMask, Coinbase Wallet, etc.
* **State Management:** Provider, Riverpod, or Bloc (to be decided).
* **UI Libraries:** Material Design or Cupertino (based on platform).

## Project Timeline (Estimated)

* **Phase 1 (1-2 weeks):** Project setup, Flutter environment configuration, basic UI layout.
* **Phase 2 (2-3 weeks):** Base blockchain integration, wallet connection, ENS resolution.
* **Phase 3 (3-4 weeks):** Marriage certificate minting logic, fee handling, soulbound NFT implementation.
* **Phase 4 (2-3 weeks):** Partner claim/mint functionality, link sharing.
* **Phase 5 (2 weeks):** Certificate display, grid view, transaction history.
* **Phase 6 (1-2 weeks):** Testing, bug fixing, and optimization.
* **Phase 7 (1 week):** Deployment and release.

## Success Criteria

* Successful porting of existing functionality to Flutter.
* Seamless integration with the Base blockchain.
* Positive user feedback on the application's usability and performance.
* Successful minting and display of marriage certificates.
* Secure and reliable transaction handling.

## Future Considerations

* Integration with social media platforms for certificate sharing.
* Adding customizable certificate templates.
* Implementing a verification system for officiants.
* Add a feature to allow users to add custom messages to the certificate.
* Add push notifications.