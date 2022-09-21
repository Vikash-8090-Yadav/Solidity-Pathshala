# Polymorphism

- Polymorphism is an ability to process data in more than one form. Like any other programming language Solidity also supports polymorphism.
- It shapes to stating various functions inside the same contract or inheriting contracts having the same name.
- The functions vary in the parameter data types.
- They as well change the number of parameters.
- Return types are not in a meeting believed for defining valid function signatures for polymorphism.
- Function polymorphism is also well-known as method overloading.

### Let's understand it with help of Remix -

1) Lets create a simple contract having a function sum in it.

![1](https://user-images.githubusercontent.com/95535448/189317831-65f5a51f-3959-401d-aa94-36c312503c77.png)

2) Lets try to replicate the same function again .

![2](https://user-images.githubusercontent.com/95535448/189318010-6b3321cc-c50a-4e3c-a672-0d1293797ed6.png)

We will notice we will get an error as we cannot have multiple functions with the same arguments.

3) Lets try to add an new argument(c) to our function .

![3](https://user-images.githubusercontent.com/95535448/189320292-d7b77063-1798-4ed4-81c4-f00c8f48d2b3.png)

We can now try compiling our contract and we will notice that our contract is successfuly compiled this is due to polymoprhism. Both the fucntions inside our 
contract are  same but only the arguments inside the functions differ.

4) Lets try to add a new function with the same name and same agruments but of different data types .

![4](https://user-images.githubusercontent.com/95535448/189322226-96d1307e-264f-40ba-a05c-dc04088794ac.png)

We can see our contract compiles even after we giving a different data type (string) to the argument . This is because of polymorphism


### Lets Run our Contract

![5](https://user-images.githubusercontent.com/95535448/189325958-35f15946-0856-43a8-9700-e171f9b0a638.png)

![final](https://user-images.githubusercontent.com/95535448/189326109-f1d6d0f1-5b91-460d-a8a8-4e1f35255316.png)
