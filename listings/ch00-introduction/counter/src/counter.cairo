#[starknet::interface]
trait ISimpleCounteratwo<TContractState> {
    fn get_current_total(self: @TContractState) -> u256;
    fn increase(ref self: TContractState);
    fn decrease(ref self: TContractState);
}


#[starknet::contract]
mod SimpleCounteratwo {
    #[storage]
    struct Storage {
        // Counter variable
        counter: u256,
    }

    #[generate_trait]
    #[external(v0)]
    impl SimpleCounteratwo of ISimpleCounteratwo {
        fn get_current_total(self: @ContractState) -> u256 {
            return self.counter.read();
        }

        fn increase(ref self: ContractState) {
            // Store counter value + 1
            let mut counter: u256 = self.counter.read() + 1;
            self.counter.write(counter);
        }
        fn decrease(ref self: ContractState) {
            // Store counter value - 1
            let mut counter: u256 = self.counter.read() - 1;
            self.counter.write(counter);
        }
    }
}
