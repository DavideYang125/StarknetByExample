#[starknet::interface]
trait IDemoCounter<TContractState> {
    fn get_current_count(self: @TContractState) -> u256;
    fn increment(ref self: TContractState);
    fn decrement(ref self: TContractState);
}


#[starknet::contract]
mod DemoCounter {
    #[storage]
    struct Storage {
        // Counter variable
        counter: u256,
    }

    #[generate_trait]
    #[external(v0)]
    impl DemoCounter of IDemoCounter {
        fn get_current_count(self: @ContractState) -> u256 {
            return self.counter.read();
        }

        fn increment(ref self: ContractState) {
            // Store counter value + 1
            let mut counter: u256 = self.counter.read() + 1;
            self.counter.write(counter);
        }
        fn decrement(ref self: ContractState) {
            // Store counter value - 1
            let mut counter: u256 = self.counter.read() - 1;
            self.counter.write(counter);
        }
    }
}
