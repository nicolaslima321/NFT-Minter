pragma solidity ^0.8.1;

// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract MyEpicNFT is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721 ("SquareNFT", "SQUARE"){
      console.log("Esse eh meu contrato de NFT! Tchu-hu");
    }

    // Uma função que o nosso usuário irá chamar para pegar sua NFT.
    function makeAnEpicNFT() public {
        // Pega o tokenId atual, que começa por 0.
        uint256 newItemId = _tokenIds.current();
        // Minta ("cunha") o NFT para o sender (quem ativa o contrato) usando msg.sender.
        _safeMint(msg.sender, newItemId);
        // Designa os dados do NFT.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/W0DG");
        console.log("Uma NFT com o ID %s foi mintada para %s", newItemId, msg.sender);
        // Incrementa o contador para quando o próximo NFT for mintado.
        _tokenIds.increment();
    }
}
