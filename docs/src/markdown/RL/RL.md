## 动作价值函数

1. 如果不考虑 ==状态转移==，如何衡量一个动作的价值？

$$
Q_{t}(a) \doteq \frac{\texttt { sum of rewards when } a \texttt { taken prior to } t}{\texttt { number of times } a \texttt { taken prior to } t}=\frac{\sum_{i=1}^{t-1} R_{i} \cdot \mathbb{1}_{A_{i}=a}}{\sum_{i=1}^{t-1} \mathbb{1}_{A_{i}=a}}
$$

- 可以这样理解，由于不稳定因素，执行动作 $a$ 会得到一个随机奖励 $r$ , 但是 $r$ 服从某一个分布。例如： $r \sim N(0, 1)$ 。

- 根据大数定律，如果执行次数趋近无穷大，那么 $Q(a)$ 等于真实价值的均值。

- 理论上保证收敛, $Q_{n+1} = Q_n + \frac{1}{n} [R_n - Q_n]$

2. 但实际上 ==状态会发生转移== :

   ```mermaid
   stateDiagram
   	State0 --> State0 : a1
   	State0 --> State1 : a2
   State1 --> State2 : a2
   	State2 --> State0 : a3
   	State2 --> State0 : a4
   	State1 --> State0: a1
   ```

   - 这样，动作价值其实会随着状态转移而发生变化。比如，在State0状态下 $a2$ 动作价值最大，但在State1下价值却会最小。

   - 在一个状态下执行动作 $a$ 用户的状态会或者不会发生转移，以一个用户的生命周期状态转移序列为例：

     ```mermaid
     graph LR
     	S0 --> S1;
     	S1 --> S2; S1 --> S3; S1-->S4
     	S2-->..; S3 --> ... ; S4 --> ....
     ```

     目标是：状态转移过程中奖励值总和 $Q$ 最大:
   $$
   Q(S,a) = R(S, a) + \gamma max_{a\prime} Q(S^\prime, a^\prime)
   $$

   


   ​	

---

   

   

   ​	