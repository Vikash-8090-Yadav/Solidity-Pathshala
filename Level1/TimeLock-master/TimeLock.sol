contract TimeLock {

	address owner;
	uint lockTime = 1 years;
	uint startTime;

	modifier onlyBy(address _account){
		if (msg.sender != _account)
			throw;
		_;
	}

	function () payable {}

	function TimeLock() {

		owner = msg.sender;
		startTime = now;
	}

	function withdraw() onlyBy(owner) {

		if ((startTime + lockTime) < now) {
			owner.send(this.balance);
		}
	}

}
