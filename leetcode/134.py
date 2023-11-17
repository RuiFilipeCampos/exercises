class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:

        if sum(gas) < sum(cost):
            return -1

        prohibited_stations = set()

        for start in range(len(gas)):

            if start in prohibited_stations:
                continue

            gas_tank = gas[start]

            if gas_tank == 0:
                continue

            current = start

            for _ in range(1, len(gas) + 1):
                gas_cost = cost[current]

                if gas_tank < gas_cost:
                    for k in range(start, current):
                        prohibited_stations.add(k)
                    break

                current = (current + 1) % len(gas)
                gas_refuel = gas[current]
                gas_tank = gas_tank - gas_cost + gas_refuel
            else:
                return start
        return -1