# Strings

Solidity supports String literal using both double quote (`"`) and single quote (`'`). It provides string as a data type to declare a variable of type String.

A String can also be created using the `string` constructor.

**Syntax**

#### 1. Using `string literal`

```solidity
string stringName = "value";// orstring stringName = 'value';
```

#### 2. Using `string constructor`

```solidity
string stringName = new string(value);
```

Let’s see an example of Strings in Solidity:

```solidity
pragma solidity ^0.8.7;

contract SolidityStrings {
  // using double quotes
  string str1 = "Gavin";

  // using single quotes
  string str2 = 'Belson';

  // using string constructor
  string str3 = new string(2022);

  // getter function to retrieve value of str1
  function getString1() public view returns(string memory) {
    return str1;
  }

  // getter function to retrieve value of str2
  function getString2() public view returns(string memory) {
    return str2;
  }

  // getter function to retrieve value of str3
  function getString3() public view returns(string memory) {
    return str3;
  }
}
```

## Escape Characters

| Character | Description                                           |
| --------- | ----------------------------------------------------- |
| `\n`      | Starts a new line                                     |
| `\\`      | Backslash                                             |
| `\'`      | Single Quote                                          |
| `\b`      | Double Quote                                          |
| `\f`      | Backspace                                             |
| `\r`      | Carriage Return                                       |
| `\t`      | Tab                                                   |
| `\v`      | Vertical Tab                                          |
| `xNN`     | Represents an Hex value and inserts appropriate Bytes |
| `\uNNNN`  | Represents Unicode value and inserts UTF-8 sequence.  |

---

## Bytes to String Conversion

Bytes can be converted to String using `string()` constructor.

```solidity
bytes memory bstr = new bytes(10);
string message = string(bstr);
```

**Example**

```solidity
pragma solidity ^0.8.7;

contract SolidityTest {
   function getResult() public view returns(string memory) {
      uint a = 1;
      uint b = 2;
      uint result = a + b;
      return integerToString(result);
   }

   function integerToString(uint _i) internal pure returns (string memory) {
      if (_i == 0) {
         return "0";
      }
      uint j = _i;
      uint len;

      while (j != 0) {
         len++;
         j /= 10;
      }
      bytes memory bstr = new bytes(len);
      uint k = len - 1;

      while (_i != 0) {
         bstr[k--] = byte(uint8(48 + _i % 10));
         _i /= 10;
      }
      return string(bstr);
   }
}
```

**Output** -

```
0: string: 3
```

---

# Cryptographic Hash Functions

Solidity provides inbuilt cryptographic functions as well. Following are important methods −

- **keccak256(bytes memory) returns (bytes32)** − computes the Keccak-256 hash of the input.
- **ripemd160(bytes memory) returns (bytes20)** − compute RIPEMD-160 hash of the input.
- **sha256(bytes memory) returns (bytes32)** − computes the SHA-256 hash of the input.
- **ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address)** − recover the address associated with the public key from elliptic curve signature or return zero on error. The function parameters correspond to ECDSA values of the signature: r - first 32 bytes of signature; s: second 32 bytes of signature; v: final 1 byte of signature. This method returns an address.

**Example**:

```solidity
pragma solidity ^0.8.7;

contract Test {
   function callKeccak256() public pure returns(bytes32 result){
      return keccak256("ABC");
   }
}
```

**Output** -

```
0: bytes32: result 0xe1629b9dda060bb30c7908346f6af189c16773fa148d3366701fbaa35d54f3c8
```

---

## ABI encoding functions

Solidity has a bunch of ABI encoding functions. Copied from Solidity docs, they are…

- `abi.encode(...) returns (bytes)`: ABI-encodes the given arguments
- `abi.encodePacked(...) returns (bytes)`: Performs packed encoding of the given arguments
- `abi.encodeWithSelector(bytes4 selector, ...) returns (bytes)`: ABI-encodes the given arguments starting from the second and prepends the given four-byte selector
- `abi.encodeWithSignature(string signature, ...) returns (bytes)`: Equivalent to `abi.encodeWithSelector(bytes4(keccak256(signature), ...)`

---

### abi.encodePacked

Encode packed is simpler (although non-standard) than `encode`. Dynamic types are encoded in-place without length. Static types will not be padded if they are shorter than 32 bytes.

Packed encode a single string

```solidity
abi.encodePacked("AAAA");
```

Simply produces `0x41414141`, which is exactly the same as just simply converting it to `bytes`.

Encoding some `uint` with `string`

```solidity
abi.encodePacked(uint8(0x42), uint256(0x1337), "AAAA", "BBBB");
```

The output is

```
0x42
0x0000000000000000000000000000000000000000000000000000000000001337
0x41414141
0x4242424
```

Interestingly, arrays don’t necessarily have their elements packed.

```solidity
uint8[3] memory arr = [0x1, 0x2, 0x42];
abi.encodePacked(arr, "AAAA", "BBBB");
```

The output is

```
0x0000000000000000000000000000000000000000000000000000000000000001
0x0000000000000000000000000000000000000000000000000000000000000002
0x0000000000000000000000000000000000000000000000000000000000000042
0x41414141
0x42424242
```

So the `uint8` array elements are still padded to 32-byte words.

---

### keccak256 encoding behavior

Before ABI encoding functions were introduced, `keccak` function accepts multiple arguments like

```solidity
keccak256("AAAA", "BBBB", 42);
```

It has been implicitly doing `encodePacked`. But now if you try calling `keccak` with those, you are likely to get a compiler warning.

This function only accepts a single "bytes" argument

So it is no longer recommended to let compiler work its magic and implicitly encode the parameters to bytes. It gives the programmer more control of how the data should be encoded, packed or not.

**If you want the same behavior as before**, you can try `encodePacked`, or convert the data to `bytes` yourself. For `string`, it can be directly converted to `bytes` like `bytes(myString)`. For anything else, explicit packing may be needed.

---

## Compare string hashes with keccak256

Instead of using common operators `==` (or triple equal as in JavaScript `===`) or `!=` , we can compare string values by **comparing the strings keccak256 hashes** to see if they match.

However, we can't directly pass strings to keccak256. Instead, we will pass `abi.encodePacked()` as an argument, passing to this one a specific `string` or a `string` variable.

For Example:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract Strings {

	string s1 = "Hello World!";

	function isEqual (string memory _string) public returns(bool) {
	  if (keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(_string))) {
	  return true;
	  }
	}
}
```

If we pass `"Hello World!"` while calling the function `isEqual` we get true as the output, all other cases give us `false` output.

---

---
