// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;



interface IReverseRegistrar {

    function node(address addr) external pure returns (bytes32);

}

interface IENSRegistry {

    function resolver(bytes32 node) external view returns (address);
}

interface IResolver {
    function name(bytes32 node) external view returns(string memory);

}



contract BatchEns {


    IReverseRegistrar constant ReverseRegistrar = IReverseRegistrar(0xa58E81fe9b61B5c3fE2AFD33CF304c454AbFc7Cb);

    IENSRegistry constant ENSRegistry = IENSRegistry(0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e);





    constructor() {

    }

    function addressesToNames(address[] calldata addrs) public view returns (string[] memory) {
        string[] memory names = new string[](addrs.length);
        bytes32 node;
        IResolver resolver;
        for(uint i=0; i<addrs.length; i++) {
            node = ReverseRegistrar.node(addrs[i]);
            resolver = IResolver(ENSRegistry.resolver(node));
            names[i] = resolver.name(node);


        }

        return names;


    }




    function addressToName(address addr) public view returns (string memory) {

        bytes32 node = ReverseRegistrar.node(addr);
        IResolver resolver = IResolver(ENSRegistry.resolver(node));
        return resolver.name(node);

    }

}
