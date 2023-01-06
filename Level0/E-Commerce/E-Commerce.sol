// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ecommerce {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        string deliveryStatus;
    }

    mapping(uint256 => Product) public products;

    event ProductPurchased(uint256 productId, string name, uint256 price);

    // Function to allow sellers to register new products
    function registerProduct(
        uint256 id,
        string memory name,
        uint256 price
    ) public {
        products[id] = Product(id, name, price, "pending");
    }

    // Function to allow buyers to purchase a product
    function purchaseProduct(uint256 id) public payable {
        require(
            products[id].deliveryStatus == "pending",
            "Product is not available for sale"
        );
        // Ensure the buyer has sufficient funds
        require(msg.value >= products[id].price, "Insufficient funds");

        // Update the product's delivery status to "in progress"
        products[id].deliveryStatus = "in progress";

        // Deduct the purchase price from the buyer's account
        msg.sender.transfer(products[id].price);

        emit ProductPurchased(id, products[id].name, products[id].price);
    }

    // Function to allow sellers to mark a product as delivered
    function markProductAsDelivered(uint256 id) public {
        // Ensure the product's delivery status is "in progress"
        require(
            products[id].deliveryStatus == "in progress",
            "Product has not been purchased or is already delivered"
        );

        // Update the product's delivery status to "delivered"
        products[id].deliveryStatus = "delivered";

        // Transfer the purchase price to the seller's account
        address seller = seller.transfer(products[id].price); // seller's address here ;
    }
}
