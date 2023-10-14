### E-Commerce Smart Contract

- This smart contract has a struct to represent a product, with fields for the product ID, name, price, and delivery status.
- It also has a mapping from product ID to product struct, to store the catalog of available products.
- The contract has functions to allow sellers to register new products, buyers to purchase products, and sellers to mark products as delivered.
- The purchaseProduct function checks that the product is available for sale and that the buyer has sufficient funds before updating the product's delivery status to "in progress" and transferring the purchase price from the buyer's account to the contract's account.
- The markProductAsDelivered function checks that the product's delivery status is "in progress" before updating the delivery status to "delivered" and transferring the purchase price to the seller's account.
