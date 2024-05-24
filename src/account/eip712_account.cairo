// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts for Cairo v0.13.0 (account/eip712_account.cairo)

/// # Eip712Account Component
///
/// The Eip712Account component enables contracts to behave as accounts signing with EIP-712.
#[starknet::component]
mod Eip712AccountComponent {
    use openzeppelin::account::interface;
    use openzeppelin::introspection::src5::SRC5Component;
    use starknet::EthAddress;
    use starknet::account::Call;
    use starknet::eth_address::EthAddressZero;

    #[storage]
    struct Storage {}

    #[embeddable_as(SRC6Impl)]
    impl SRC6<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::ISRC6<ComponentState<TContractState>> {
        fn __execute__(
            self: @ComponentState<TContractState>, mut calls: Array<Call>
        ) -> Array<Span<felt252>> {
            ArrayTrait::new()
        }

        fn __validate__(self: @ComponentState<TContractState>, mut calls: Array<Call>) -> felt252 {
            0
        }

        fn is_valid_signature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            0
        }
    }

    #[embeddable_as(DeployableImpl)]
    impl Deployable<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IEip712Deployable<ComponentState<TContractState>> {
        fn __validate_deploy__(
            self: @ComponentState<TContractState>,
            class_hash: felt252,
            contract_address_salt: felt252,
            address: EthAddress
        ) -> felt252 {
            0
        }
    }

    #[embeddable_as(AddressImpl)]
    impl Address<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IEip712Address<ComponentState<TContractState>> {
        fn get_address(self: @ComponentState<TContractState>) -> EthAddress {
            EthAddressZero::zero()
        }

        fn set_address(
            ref self: ComponentState<TContractState>,
            new_address: EthAddress,
            signature: Span<felt252>
        ) {}
    }

    #[embeddable_as(SRC6CamelOnlyImpl)]
    impl SRC6CamelOnly<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::ISRC6CamelOnly<ComponentState<TContractState>> {
        fn isValidSignature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            0
        }
    }

    #[embeddable_as(AddressCamelImpl)]
    impl AddressCamel<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IEip712AddressCamel<ComponentState<TContractState>> {
        fn getAddress(self: @ComponentState<TContractState>) -> EthAddress {
            EthAddressZero::zero()
        }

        fn setAddress(
            ref self: ComponentState<TContractState>,
            newAddress: EthAddress,
            signature: Span<felt252>
        ) {}
    }

    #[embeddable_as(Eip712AccountMixinImpl)]
    impl Eip712AccountMixin<
        TContractState,
        +HasComponent<TContractState>,
        impl SRC5: SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::Eip712AccountABI<ComponentState<TContractState>> {
        // ISRC6
        fn __execute__(
            self: @ComponentState<TContractState>, calls: Array<Call>
        ) -> Array<Span<felt252>> {
            ArrayTrait::new()
        }

        fn __validate__(self: @ComponentState<TContractState>, calls: Array<Call>) -> felt252 {
            0
        }

        fn is_valid_signature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            0
        }

        // ISRC5
        fn supports_interface(
            self: @ComponentState<TContractState>, interface_id: felt252
        ) -> bool {
            true
        }

        // IDeclarer
        fn __validate_declare__(
            self: @ComponentState<TContractState>, class_hash: felt252
        ) -> felt252 {
            0
        }

        // IEip712Deployable
        fn __validate_deploy__(
            self: @ComponentState<TContractState>,
            class_hash: felt252,
            contract_address_salt: felt252,
            address: EthAddress
        ) -> felt252 {
            0
        }

        // IEip712Address
        fn get_address(self: @ComponentState<TContractState>) -> EthAddress {
            EthAddressZero::zero()
        }

        fn set_address(
            ref self: ComponentState<TContractState>,
            new_address: EthAddress,
            signature: Span<felt252>
        ) {}

        // ISRC6CamelOnly
        fn isValidSignature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            0
        }

        // IEip712AddressCamel
        fn getAddress(self: @ComponentState<TContractState>) -> EthAddress {
            EthAddressZero::zero()
        }

        fn setAddress(
            ref self: ComponentState<TContractState>,
            newAddress: EthAddress,
            signature: Span<felt252>
        ) {}
    }
}
