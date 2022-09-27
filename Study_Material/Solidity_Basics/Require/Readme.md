# Require

- The require function should be used to check return values from calls to external contracts or to guarantee that valid conditions, such as inputs or contract state variables, are satisfied.

### Let's understand it with help of Remix -

1) Lets create a simple contract having a get function which returns 10 when called and owner function which returns the owner address

![1](https://user-images.githubusercontent.com/95535448/189815885-a174d40e-d84e-4ce3-a0a8-69a66bd96e17.png)

You can notice that anyone can call the get function here , even if we change the account we can still notice that anyone can call the get function.

2) Now let's add require to our contract.

![2](https://user-images.githubusercontent.com/95535448/189821874-31a73137-9599-4f57-b5bd-e094a68f45df.png)

Now, what will happen is if this get function is called by the owner of the contract it will return 10 otherwise it will return "You are not the owner".

### Output
 - If it's not called by the owner 
 
![not woner](https://user-images.githubusercontent.com/95535448/189821926-dd3ea8d0-53f3-4b1a-8fcf-99972c3350f5.png)

- If called by the owner

![owner](https://user-images.githubusercontent.com/95535448/189821992-c73d8d28-add8-45ad-bd9c-458956a8fe65.png)
