# -*- coding: utf-8 -*-
"""
Created on Wed May 11 15:52:33 2022

@author: Vedant Goswami
"""

import datetime
import hashlib
import json
from flask import Flask, jsonify, request
import requests
from uuid import uuid4
from urllib.parse import urlparse
# Building blockchain
class Blockchain:
    
    def __init__(self):
        self.chain = []
        self.transections=[]
        self.create_block(proof = 1, previous_hash = '0')
        self.nodes = set()
        
        
    def create_block(self,proof,previous_hash):
        block = {
                    'index': len(self.chain)+1,
                    'timestamp': str(datetime.datetime.now()),
                    'proof': proof,
                    'previous_hash': previous_hash
                }
        self.chain.append(block)
        return block
    
    def get_previous_block(self):
        return self.chain[-1]
    def proof_of_work(self, previous_proof):
        new_proof = 1
        check_proof = False
        while(check_proof==False):
            hash_operation = hashlib.sha256(str(new_proof**2-previous_proof**2).encode()).hexdigest()
            if hash_operation[:4] == '0000':
                check_proof = True
            else:
                new_proof += 1
        return new_proof
    def hash(self, block):
         encoded_block = json.dumps(block, sort_keys=True).encode()
         return hashlib.sha256(encoded_block).hexdigest()
    def is_chain_valid(self, chain):
         previous_block = chain[0]
         block_index = 1
         while block_index < len(chain):
             block = chain[block_index]
             if(block['previous_hash'] != self.hash(previous_block)):
                 return False
             previous_proof = previous_block['proof']
             proof = block['proof']
             hash_operation = hashlib.sha256(str(proof**2-previous_proof**2).encode()).hexdigest()
             if hash_operation[:4] != '0000':
                 return False
             previous_block = block
             block_index+=1
         return True
    
    def add_transection(self, sender,reciever,amount):
        self.transections.append({'sender': sender,
                                  'reciver': reciever,
                                  'amount': amount})
        previous_block = self.get_previous_block()
        return previous_block['index']+1
    
    def add_node(self,address):
        parsed_url = urlparse(address)
        self.nodes.add(parsed_url.netloc)
        
    def replace_chain(self):
        network = self.nodes
        longest_chain = None
        max_length = len(self.chain)
        for node in network:
            response = requests.get(f'http://{node}/get_chain')
            if (response.status_code == 200):
                length = response.json()['length']
                chain = response.json()['chain']
                if(length>max_length and  self.is_chain_valid(chain)):
                    max_length = length
                    longest_chain = chain
        if longest_chain:
            self.chain = longest_chain
            return True
        return False
         
#  Mining our blockchain
app = Flask(__name__)

# Creating an address on port 5000
node_address = str(uuid4()).replace('-','')


# creating a Blockchain
blockchain = Blockchain()

@app.route('/mine_block',methods=['GET'])
def mine_block():
    previous_block = blockchain.get_previous_block()
    previous_proof = previous_block['proof']
    proof = blockchain.proof_of_work(previous_proof)
    previous_hash = blockchain.hash(previous_block)
    block = blockchain.create_block(proof, previous_hash)
    blockchain.add_transection(sender=node_address, reciever="vedant", amount=1)
    response = {
                'message': 'Congratulations you just mined a block!',
                'index': block['index'],
                'timestamp': block['timestamp'],
                'proof': block['proof'],
                'transections': block['transections'],
                'previous_hash': block['previous_hash']
        }
    return jsonify(response), 200


@app.route('/get_chain',methods=['GET'])
def get_chain():
    response = {
        'chain': blockchain.chain,
        'length': len(blockchain.chain)
        }
    return jsonify(response),200

#checking if the blockchain is valid
@app.route('/is_valid',methods=['GET'])
def is_valid():
    is_valid = blockchain.is_chain_valid(blockchain.chain)
    if is_valid:
        response = {'message': 'All good. The Blockchain is Valid'}
    else:
        response = {'message': 'Chiller, We have a problem. The Blockchain is not valid'}
    return jsonify(response),200

#Adding a new transection to the Blockchain
@app.route('/add_transection',methods=['POST'])
def add_transection():
    json = request.get_json()
    transection_keys = ['sender','reciever','amount']
    if not all ( key in json for key in transection_keys ):
        return "Some elements of the transection are missing",400
    index = blockchain.add_transection(json['sender'], json['reciever'], json['amount'])
    response = {'message': f'This transection will be added to Block {index}'}
    return jsonify(response),201

# Decentralizing Blockchain
@app.route('/connect_node',methods=['POST'])
def connect_node():
    json = request.get_json()
    nodes = json.get('nodes')
    if nodes is None:
        return "No Node",400
    else:
        for node in nodes:
            blockchain.add_node(node)
        response = {'message': "All the nodes are now connected. The chiller contains the following nodes",
                    'total_nodes': list(blockchain.nodes)
                    }
        return jsonify(response),201
            
  #Replacing the chain with the longest chain
@app.route('/replace_chain',methods=['GET'])
def replace_chain():
    is_chain_replaced = blockchain.replace_chain()
    if is_chain_replaced:
        response = {'message': 'The nodes had different chains so the chain was replaced by the longer chain',
                    'new_chain': blockchain.chain}
    else:
        response = {'message': 'All good. The Chain is the largest one.',
                    'actual_chain': blockchain.chain}
    return jsonify(response),200      

# Running the app
app.run(host='0.0.0.0', port = 5000)
